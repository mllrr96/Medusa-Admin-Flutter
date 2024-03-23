import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/presentation/blocs/batch_job_crud/batch_job_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import '../../../domain/use_case/file/get_file_url_use_case.dart';
import 'widgets/batch_job_tile.dart';

@RoutePage()
class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final pagingController = PagingController<int, BatchJob>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();
  late Dio dio;
  late BatchJobCrudBloc batchJobCrudBloc;

  void _loadPage(int _) {
    batchJobCrudBloc.add(
      BatchJobCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      }),
    );
  }

  @override
  void initState() {
    batchJobCrudBloc = BatchJobCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    dio = getIt<Dio>();
    super.initState();
  }

  @override
  void dispose() {
    batchJobCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BatchJobCrudBloc, BatchJobCrudState>(
      bloc: batchJobCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          batchJobs: (state) async {
            final isLastPage =
                state.batchJobs.length < BatchJobCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.batchJobs);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.batchJobs.length;
              pagingController.appendPage(state.batchJobs, nextPageKey);
            }
            if (refreshController.isRefresh) {
              pagingController.addPageRequestListener(_loadPage);
              refreshController.refreshCompleted();
            }
          },
          error: (state) {
            refreshController.refreshFailed();
            pagingController.error = state.failure;
          },
        );
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const MedusaSliverAppBar(
              title: Text('Activity'),),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0),
              padding: EdgeInsets.only(bottom: context.bottomViewPadding),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<BatchJob>(
                animateTransitions: true,
                itemBuilder: (context, batchJob, index) => BatchJobTile(
                  batchJob,
                  onDelete: () {},
                  onShare: () async => shareFile(batchJob.result?.fileKey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> shareFile(String? fileKey) async {
    if (fileKey == null) {
      return;
    }
    final fileName = fileKey.split('/').last;
    Directory dir = await getApplicationDocumentsDirectory();
    String savePath = '${dir.path}/exports/$fileName';

    final exist = await File(savePath).exists();
    if (exist) {
      await Share.shareXFiles([XFile(savePath)]);
    } else {
      final result = await GetFileUrlUseCase.instance(fileKey);
      await result.when((uri) async {
        final file = await _downloadFile(uri, fileName);
        if (file != null) {
          await Share.shareXFiles([XFile(file.path)]);
        }
      }, (error) => null);
    }
  }

  Future<File?> _downloadFile(String uri, String fileName) async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      String savePath = '${dir.path}/exports/$fileName';

      await dio.download(
        uri,
        savePath,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              if (status != null) {
                return status < 500;
              } else {
                return false;
              }
            }),
      );

      File file = File(savePath);

      return file;
    } catch (e) {
      return null;
    }
  }
}
