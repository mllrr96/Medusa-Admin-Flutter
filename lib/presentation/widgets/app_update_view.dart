import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:apk_installer/apk_installer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdateView extends StatefulWidget {
  const AppUpdateView({super.key});

  @override
  State<AppUpdateView> createState() => _AppUpdateViewState();
}

class _AppUpdateViewState extends State<AppUpdateView> {
  String buttonString = 'Install Update';
  double progress = 0.0;
  bool get isDownloading => buttonString != 'Install Update';
  CancelToken cancelToken = CancelToken();

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    return PopScope(
      canPop: !isDownloading,
      onPopInvoked: (val) async {
        if (val) return;
        await showOkCancelAlertDialog(
                context: context,
                title: 'Cancel download',
                message: 'Are you sure you want to cancel download?',
                okLabel: 'Cancel Download',
                cancelLabel: 'Continue Download',
                isDestructiveAction: true)
            .then((value) {
          if (value == OkCancelResult.ok) {
            if (isDownloading) {
              cancelToken.cancel();
              context.router.popForced();
            }
          }
        });
      },
      child: DraggableScrollableSheet(
        expand: false,
        snap: true,
        snapSizes: const [0.5],
        maxChildSize: 0.9,
        builder: (context, scrollController) => Scaffold(
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: isDownloading
                    ? null
                    : () async {
                        if (Platform.isIOS) {
                          await launchUrl(Uri.parse(
                              '${AppConstants.githubLink}/releases/tag/${PreferenceService.appUpdate?.tagName}'));
                          return;
                        } else if (Platform.isAndroid) {
                          // Download the update
                          final asset = PreferenceService.appUpdate?.assets
                              ?.where((asset) =>
                                  (asset.name?.endsWith('.apk') ?? false))
                              .firstOrNull;
                          if (asset?.browserDownloadUrl == null) {
                            if (context.mounted) {
                              context.showSnackBar('Failed to download update');
                            }
                            return;
                          }
                          final downloadsDirectory =
                              await getDownloadsDirectory() ??
                                  await getApplicationDocumentsDirectory();
                          final savePath =
                              '${downloadsDirectory.path}/${asset!.name}';
                          if (File(savePath).existsSync()) {
                            await installApk(savePath);
                          } else {
                            await downloadUpdate(
                                asset.browserDownloadUrl!, savePath);
                            if (File(savePath).existsSync() &&
                                context.mounted) {
                              await installApk(savePath);
                            }
                          }
                        }
                      },
                child: Text(buttonString)),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New Update Available', style: context.bodyLarge),
                Text(PreferenceService.appUpdate?.tagName ?? '',
                    style: context.bodyLarge?.copyWith(color: manatee)),
                // const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: LinearProgressIndicator(value: progress / 100),
                ),
                SizedBox(
                    width: context.width,
                    child: Text('Changelog', style: context.headlineMedium)),
                Text(PreferenceService.appUpdate?.body ?? '',
                    style: context.bodySmall?.copyWith(color: manatee)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> downloadUpdate(String url, String savePath) async {
    try {
      await getIt<Dio>().download(
        url,
        savePath,
        cancelToken: cancelToken,
        deleteOnError: true,
        onReceiveProgress: (count, total) {
          if (count == total) {
            buttonString = 'Install Update';
            progress = 0.0;
          } else {
            buttonString =
                'Downloading update... ${((count / total) * 100).toStringAsFixed(2)}%';
            progress = ((count / total) * 100);
          }
          setState(() {});
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
          validateStatus: (status) {
            if (status == null) return false;
            return status < 500;
          },
        ),
      );
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar('Failed to download update');
      }
    }
  }

  Future<void> installApk(String savePath) async {
    try {
      if (!cancelToken.isCancelled) {
        await ApkInstaller.installApk(filePath: savePath);
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar('Failed to install update');
      }
    }
  }
}
