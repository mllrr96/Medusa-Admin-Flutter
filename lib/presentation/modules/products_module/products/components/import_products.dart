import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/create_batch_job_use_case.dart';
import 'package:medusa_admin/domain/use_case/upload_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImportProductsView extends StatefulWidget {
  const ImportProductsView({super.key});

  @override
  State<ImportProductsView> createState() => _ImportProductsViewState();
}

class _ImportProductsViewState extends State<ImportProductsView> {
  bool loadingTemplate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Import products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            const Gap(8.0),
            Text(
              'Through imports you can add or update products. To update existing products/variants you must set an existing id in the Product/Variant id columns. If the value is unset a new record will be created. You will be asked for confirmation before we import products.',
              style: context.bodyMedium?.copyWith(color: ColorManager.manatee),
              textAlign: TextAlign.justify,
            ),
            const Gap(8.0),
            OutlinedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['csv'],
                  );
                  if (result?.files.isEmpty ?? true) {
                    return;
                  }
                  PlatformFile file = result!.files.first;
                  if (file.path == null) {
                    return;
                  }
                  loading();
                  final uploadResult = await UploadUseCase.instance
                      .uploadProtected([File(file.path!)]);
                  uploadResult.when((success) async {
                    final uploadUrl = success.first;
                    print('Upload URL: $uploadUrl');
                   final batchJobResult = await CreateBatchJobUseCase.instance(
                        BatchJobType.productImport,
                        dryRun: true,
                        context: {'fileKey': uploadUrl.split('\\').last});

                    batchJobResult.when((success) {
                      print(success.toJson());
                    }, (error) {
                      log(error.toString());
                    });

                  }, (error) {
                    log(error.toString());
                  });

                  dismissLoading();
                },
                child: const Text('Pick File')),
            Text(
              'Only .csv files are supported.',
              style: context.bodySmall?.copyWith(color: ColorManager.manatee),
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
            )
          ],
        ),
      ),
    );
  }
}
