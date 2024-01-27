import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:apk_installer/apk_installer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

@RoutePage()
class AppUpdateView extends StatefulWidget {
  const AppUpdateView({super.key});

  @override
  State<AppUpdateView> createState() => _AppUpdateViewState();
}

class _AppUpdateViewState extends State<AppUpdateView> {
  String buttonTitle = 'Install Update';
  double progress = 0.0;
  bool get isDownloading => buttonTitle != 'Install Update';
  CancelToken cancelToken = CancelToken();
  void setButtonTitle(String val) => setState(() => buttonTitle = val);

  Future<bool> get shouldCancel async => await showOkCancelAlertDialog(
          context: context,
          title: 'Cancel download',
          message: 'Are you sure you want to cancel download?',
          okLabel: 'Cancel Download',
          cancelLabel: 'Continue Download',
          isDestructiveAction: true)
      .then((value) => value == OkCancelResult.ok);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    return PopScope(
      canPop: !isDownloading,
      onPopInvoked: (val) async {
        if (val) return;
        if (await shouldCancel && isDownloading) {
          cancelToken.cancel();
          cancelToken.whenCancel.then((_) {
            ScaffoldMessenger.of(context).clearSnackBars();
            context.router.popForced();
          });
        }
      },
      child: BlocBuilder<AppUpdateBloc, AppUpdateState>(
        builder: (context, state) {
          final appUpdate =
              state.mapOrNull(updateAvailable: (state) => state.appUpdate);
          return Scaffold(
            bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  onPressed: isDownloading
                      ? () async {
                          if (await shouldCancel && isDownloading) {
                            cancelToken.cancel('Download Cancelled');
                            cancelToken.whenCancel.then((_) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              context.router.popForced();
                            });
                          }
                        }
                      : () async {
                          setButtonTitle('Preparing ...');
                          if (Platform.isIOS) {
                            await launchUrl(Uri.parse(
                                '${AppConstants.githubLink}/releases/tag/${appUpdate?.tagName}'));
                            setButtonTitle('Install Update');
                            return;
                          } else if (Platform.isAndroid) {
                            // Download the update
                            final asset = appUpdate?.assets
                                ?.where((asset) =>
                                    (asset.name?.endsWith('.apk') ?? false))
                                .firstOrNull;
                            if (asset?.browserDownloadUrl == null) {
                              if (context.mounted) {
                                context
                                    .showSnackBar('Failed to download update');
                                setButtonTitle('Install Update');
                              }
                              return;
                            }
                            final downloadsDirectory =
                                await getDownloadsDirectory() ??
                                    await getApplicationDocumentsDirectory();
                            final savePath =
                                '${downloadsDirectory.path}/${asset!.name}';
                            if (File(savePath).existsSync()) {
                              setButtonTitle('Installing Update ...');
                              await installApk(savePath);
                              setButtonTitle('Install Update');
                            } else {
                              await downloadUpdate(
                                  asset.browserDownloadUrl!, savePath);
                              setButtonTitle('Installing Update ...');

                              if (File(savePath).existsSync() &&
                                  context.mounted) {
                                await installApk(savePath);
                              }
                              setButtonTitle('Install Update');
                            }
                          }
                        },
                  child: Text(buttonTitle)),
            ),
            body: CustomScrollView(slivers: [
              SliverStack(
                children: [
                  SliverToBoxAdapter(
                      child: LinearProgressIndicator(
                    value: progress / 100,
                    minHeight: kToolbarHeight + context.viewPadding.top,
                    backgroundColor: context.theme.appBarTheme.backgroundColor,
                  )),
                  MedusaSliverAppBar(
                    backgroundColor: Colors.transparent,
                    leading: const CloseButton(),
                    appBarStyle: AppBarStyle.normal,
                    title: const Text('App Update'),
                    actions: [
                      if (progress != 0.0)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('${progress.toStringAsFixed(0)}%'),
                        ),
                    ],
                  ),
                ],
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Current Version:', style: context.bodyMedium),
                    trailing: Text(
                      'v${PreferenceService.packageInfo.version}',
                      style: context.bodyMedium?.copyWith(color: manatee),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Latest Version:', style: context.bodyMedium),
                    trailing: Text(
                      appUpdate?.tagName ?? '',
                      style: context.bodyMedium?.copyWith(color: manatee),
                    )
                        .animate(
                            autoPlay: true,
                            onPlay: (controller) =>
                                controller.repeat(reverse: true))
                        .shimmer(
                            duration: const Duration(seconds: 5),
                            blendMode: BlendMode.srcIn,
                            colors: [Colors.blue, Colors.green, Colors.teal]),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Release Notes', style: context.bodyLarge),
                  ),
                  Markdown(
                    styleSheet: MarkdownStyleSheet(
                      a: context.bodyLarge,
                      p: context.bodyMedium,
                      h2: context.bodyMedium,
                      h3: context.bodyMedium,
                      h4: context.bodyMedium,
                      h5: context.bodyMedium,
                      h6: context.bodyMedium,
                      blockquote: context.bodyMedium,
                      code: context.bodyMedium,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10.0),
                    data: appUpdate?.body ?? '',
                  ),
                ])),
              ),
            ]),
          );
        },
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
            buttonTitle = 'Install Update';
            progress = 0.0;
          } else {
            buttonTitle = 'Downloading update...';
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
