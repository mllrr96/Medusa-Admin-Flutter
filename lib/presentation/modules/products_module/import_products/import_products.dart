import 'dart:developer';
import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/batch_job/cancel_batch_job_use_case.dart';
import 'package:medusa_admin/domain/use_case/batch_job/confirm_batch_job_use_case.dart';
import 'package:medusa_admin/domain/use_case/batch_job/fetch_bach_job_use_case.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/domain/use_case/batch_job/create_batch_job_use_case.dart';
import 'package:medusa_admin/domain/use_case/file/upload_use_case.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'import_products_controller.dart';

@RoutePage()
class ImportProductsView extends StatefulWidget {
  const ImportProductsView({super.key});

  @override
  State<ImportProductsView> createState() => _ImportProductsViewState();
}

class _ImportProductsViewState extends State<ImportProductsView> {
  bool loadingTemplate = false;
  String? batchJobId;

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result?.files.isEmpty ?? true) {
      return null;
    }
    PlatformFile? file = result!.files.firstOrNull;
    if (file?.path != null) {
      return File(file!.path!);
    }
    return null;
  }

  Future<void> fetchBatchJob() async {
    final result = await FetchBatchJobUseCase.instance(batchJobId!);
    result.when((batchJob) {
      // update ui according to batch job status, in case the batch job is still running, fetch again after 5 seconds
    }, (error) {});
  }

  @override
  Widget build(BuildContext context) {
    final templateWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text('Unsure about how to arrange your list?')),
          Text(
            'Download the template below to ensure you are following the correct format.',
            style: context.bodyMedium?.copyWith(color: ColorManager.manatee),
            textAlign: TextAlign.justify,
          ),
          const Gap(8.0),
          InkWell(
            onTap: loadingTemplate
                ? null
                : () async {
                    setState(() => loadingTemplate = true);
                    const fileName = 'product-import-template.csv';
                    final dir = await getApplicationDocumentsDirectory();
                    String savePath = '${dir.path}/$fileName';
                    final exist = await File(savePath).exists();

                    if (exist) {
                      setState(() => loadingTemplate = false);
                      await Share.shareXFiles([XFile(savePath)]);
                    } else {
                      final byteData =
                          await rootBundle.load('assets/$fileName');
                      final file = File(savePath);
                      await file.writeAsBytes(byteData.buffer.asUint8List());
                      setState(() => loadingTemplate = false);
                      await Share.shareXFiles([XFile(savePath)]);
                    }
                  },
            borderRadius: BorderRadius.circular(4.0),
            child: Ink(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: ColorManager.manatee),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (loadingTemplate)
                      LoadingAnimationWidget.threeArchedCircle(
                          color: context.theme.colorScheme.primary, size: 24),
                    Opacity(
                      opacity: loadingTemplate ? 0.4 : 1.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.file_present_rounded,
                                  color: context.theme.colorScheme.primary),
                              const Gap(8.0),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('medusa-template.csv'),
                                  Text('2.90 KiB'),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.file_download_outlined,
                              color: context.theme.colorScheme.primary)
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );

    return GetBuilder<ImportProductsController>(
        init: ImportProductsController(),
        builder: (controller) {
          return PopScope(
            canPop: batchJobId == null,
            onPopInvoked: (val) async {
              if (val) return;
              // await CreateBatchJobUseCase.instance.cancelBatchJob(batchJobId!);
              await showOkCancelAlertDialog(
                context: context,
                title: 'Cancel import?',
                message: 'Are you sure you want to cancel products import?',
                okLabel: 'Cancel import',
                cancelLabel: 'Continue import',
                isDestructiveAction: true,
              ).then((result) async {
                if (result == OkCancelResult.ok) {
                  loading();
                  // Cancel batch job here
                  await CancelBatchJobUseCase.instance(batchJobId!)
                      .then((result) {
                    result.when(
                        (success) => context.router.popForced(),
                        (error) =>
                            context.showSnackBar(error.toSnackBarString()));
                  });
                  dismissLoading();
                }
              });
            },
            child: Scaffold(
              bottomNavigationBar: controller.obx(
                (batchJob) {
                  final status = batchJob?.status;
                  if (status == BatchJobStatus.preProcessed) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: FilledButton(
                        onPressed: () async {
                          loading();
                          final result = await ConfirmBatchJobUseCase.instance(
                              batchJobId!);
                          result.when((success) {
                            context.router.popForced();
                            context.showSnackBar(
                                'Import confirmed for processing. Progress info is available in the activity drawer.');
                            dismissLoading();
                          }, (error) {
                            dismissLoading();
                            context.showSnackBar(error.toSnackBarString());
                          });
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.maxFinite, 48),
                        ),
                        child: const Text('Import List'),
                      ),
                    );
                  } else {
                    return templateWidget;
                  }
                },
                onLoading: templateWidget,
                onEmpty: templateWidget,
                onError: (_) => templateWidget,
              ),
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MedusaSliverAppBar(
                    floating: false,
                    snap: false,
                    title: const Text('Import products'),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.help_outline),
                      ),
                    ],
                  ),
                ],
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: controller.obx(
                    (batchJob) {
                      if (batchJob?.status == BatchJobStatus.created ||
                          batchJob?.status == BatchJobStatus.processing) {
                        Future.delayed(const Duration(seconds: 5), () async {
                          await controller.fetchBatchJob(batchJobId!,
                              showLoading: false);
                        });
                      }
                      final fileName = batchJob?.context?['fileKey'];

                      return Column(children: [
                        const Gap(8.0),
                        Text(
                          'Through imports you can add or update products. To update existing products/variants you must set an existing id in the Product/Variant id columns. If the value is unset a new record will be created. You will be asked for confirmation before we import products.',
                          style: context.bodyMedium
                              ?.copyWith(color: ColorManager.manatee),
                          textAlign: TextAlign.justify,
                        ),
                        const Gap(16.0),
                        if (batchJob?.status == BatchJobStatus.preProcessed)
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(color: ColorManager.manatee),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.file_present_rounded,
                                          color: context
                                              .theme.colorScheme.primary),
                                      const Gap(8.0),
                                      Flexible(
                                        child: Text(fileName ?? ''),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(16),
                                  onPressed: () async {
                                    await showOkCancelAlertDialog(
                                      context: context,
                                      title: 'Cancel import?',
                                      message:
                                          'Are you sure you want to cancel products import?',
                                      okLabel: 'Cancel import',
                                      cancelLabel: 'Continue import',
                                      isDestructiveAction: true,
                                    ).then((result) async {
                                      if (result == OkCancelResult.ok) {
                                        loading();
                                        // Cancel batch job here
                                        await CancelBatchJobUseCase.instance(
                                                batchJobId!)
                                            .then((result) {
                                          result.when((success) {
                                            batchJobId = null;
                                            setState(() {});
                                            controller.resetState();
                                          },
                                              (error) => context.showSnackBar(
                                                  error.toSnackBarString()));
                                        });
                                        dismissLoading();
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.delete_forever,
                                      color: context
                                          .theme.colorScheme.errorContainer),
                                )
                              ],
                            ),
                          ),
                        if (batchJob?.status == BatchJobStatus.processing ||
                            batchJob?.status == BatchJobStatus.created)
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(color: ColorManager.manatee),
                            ),
                            child: Row(
                              children: [
                                LoadingAnimationWidget.threeArchedCircle(
                                    color: context.theme.primaryColor,
                                    size: 24),
                                const Gap(8.0),
                                const Text('Processing file'),
                              ],
                            ),
                          ),
                        const Gap(16.0),
                        Text(batchJob?.result?.statDescriptors?.firstOrNull
                                ?.message ??
                            ''),
                      ]);
                    },
                    onEmpty: Column(
                      children: [
                        const Gap(8.0),
                        Text(
                          'Through imports you can add or update products. To update existing products/variants you must set an existing id in the Product/Variant id columns. If the value is unset a new record will be created. You will be asked for confirmation before we import products.',
                          style: context.bodyMedium
                              ?.copyWith(color: ColorManager.manatee),
                          textAlign: TextAlign.justify,
                        ),
                        const Gap(8.0),
                        const Spacer(),
                        FilledButton(
                          onPressed: () async {
                            final file = await pickFile();
                            if (file == null) return;
                            loading();
                            final uploadResult = await UploadUseCase.instance
                                .uploadProtected([file]);
                            await uploadResult.when((urls) async {
                              final uploadUrl = urls.first;
                              final batchJobResult =
                                  await CreateBatchJobUseCase.instance(
                                      BatchJobType.productImport,
                                      dryRun: true,
                                      context: {
                                    'fileKey': uploadUrl.split('/').last
                                  });
                              await batchJobResult.when((batchJob) async {
                                batchJobId = batchJob.id;
                                dismissLoading();
                                await controller.fetchBatchJob(batchJob.id!);
                              }, (error) {
                                log(error.toString());
                                context.showSnackBar(
                                    'Error creating batch job, ${error.toSnackBarString()}');
                                dismissLoading();
                              });
                            }, (error) {
                              log(error.toString());
                              context.showSnackBar(
                                  'Error uploading file, ${error.toSnackBarString()}');
                              dismissLoading();
                            });
                          },
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(200, 48),
                          ),
                          child: const Text('Pick File'),
                        ),
                        const Gap(8.0),
                        Text(
                          'Only .csv files are supported.',
                          style: context.bodySmall
                              ?.copyWith(color: ColorManager.manatee),
                          textAlign: TextAlign.justify,
                        ),
                        const Spacer(),
                      ],
                    ),
                    onLoading: Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                          color: context.theme.primaryColor, size: 48),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
