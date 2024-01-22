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
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/domain/use_case/batch_job/create_batch_job_use_case.dart';
import 'package:medusa_admin/domain/use_case/file/upload_use_case.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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

  @override
  Widget build(BuildContext context) {
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
            await CancelBatchJobUseCase.instance(batchJobId!).then((result) {
              result.when((success) => context.router.popForced(),
                  (error) => context.showSnackBar(error.toSnackBarString()));
            });
            dismissLoading();
          }
        });
      },
      child: Scaffold(
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
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              children: [
                const Gap(8.0),
                Text(
                  'Through imports you can add or update products. To update existing products/variants you must set an existing id in the Product/Variant id columns. If the value is unset a new record will be created. You will be asked for confirmation before we import products.',
                  style:
                      context.bodyMedium?.copyWith(color: ColorManager.manatee),
                  textAlign: TextAlign.justify,
                ),
                const Gap(8.0),
                OutlinedButton(
                    onPressed: () async {
                      final file = await pickFile();
                      if (file == null) return;
                      loading();
                      final uploadResult =
                          await UploadUseCase.instance.uploadProtected([file]);
                      await uploadResult.when((urls) async {
                        final uploadUrl = urls.first;
                        final batchJobResult =
                            await CreateBatchJobUseCase.instance(
                                BatchJobType.productImport,
                                dryRun: true,
                                context: {
                              'fileKey': uploadUrl.split('/').last
                            });

                        batchJobResult.when((batchJob) {
                          batchJobId = batchJob.id;
                          batchJob.result?.statDescriptors?.forEach((element) {
                            print(element.name);
                            print(element.message);
                            print(element.key);
                          });
                          dismissLoading();
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
                    child: const Text('Pick File')),
                Text(
                  'Only .csv files are supported.',
                  style:
                      context.bodySmall?.copyWith(color: ColorManager.manatee),
                  textAlign: TextAlign.justify,
                ),
                const Spacer(),
                const Divider(),
                const Spacer(),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Unsure about how to arrange your list?')),
                Text(
                  'Download the template below to ensure you are following the correct format.',
                  style:
                      context.bodyMedium?.copyWith(color: ColorManager.manatee),
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
                            await file
                                .writeAsBytes(byteData.buffer.asUint8List());
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
                                color: context.theme.colorScheme.primary,
                                size: 24),
                          Opacity(
                            opacity: loadingTemplate ? 0.4 : 1.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.file_present_rounded,
                                        color:
                                            context.theme.colorScheme.primary),
                                    const Gap(8.0),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
