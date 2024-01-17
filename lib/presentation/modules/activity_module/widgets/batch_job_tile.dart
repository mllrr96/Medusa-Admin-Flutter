import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' hide GetStringUtils;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../core/constant/colors.dart';

class BatchJobTile extends StatefulWidget {
  const BatchJobTile(this.batchJob, {super.key, this.onDelete, this.onShare});
  final BatchJob batchJob;
  final void Function()? onDelete;
  final void Function()? onShare;
  @override
  State<BatchJobTile> createState() => _BatchJobTileState();
}

class _BatchJobTileState extends State<BatchJobTile> {
  bool showDate = false;

  @override
  Widget build(BuildContext context) {
    final isExport = widget.batchJob.type == BatchJobType.orderExport ||
        widget.batchJob.type == BatchJobType.productExport;

    final isCompleted = widget.batchJob.status == BatchJobStatus.completed;

    Widget fileWidget;
    Widget statusWidget = const SizedBox.shrink();

    String getFileSize() {
      final fileSize = widget.batchJob.result?.fileSize?.toDouble();
      if (fileSize == null) {
        return '';
      }

      switch (fileSize) {
        case > 0 && < 999:
          return '${fileSize.toStringAsFixed(2)} B';
        case > 1000 && < 999999:
          return '${(fileSize / 1024).toStringAsFixed(2)} KB';
        case > 1000000 && < 999999999:
          return '${(fileSize / 1024 / 1024).toStringAsFixed(2)} MB';
        case > 1000000000 && < 999999999999:
          return '${(fileSize / 1024 / 1024 / 1024).toStringAsFixed(2)} GB';
        default:
          return '${(fileSize / 1024 / 1024).toStringAsFixed(2)} MB';
      }
    }

    switch (widget.batchJob.status) {
      case BatchJobStatus.created:
        fileWidget = const Text('Created');
        break;
      case BatchJobStatus.processing:
        fileWidget = Row(
          children: [
            LoadingAnimationWidget.staggeredDotsWave(
                color: context.theme.primaryColor, size: 24),
            const Gap(10),
            const Flexible(
                child: Text('Pre-processing', overflow: TextOverflow.ellipsis)),
          ],
        );
        break;
      case BatchJobStatus.completed:
        if (isExport) {
          statusWidget = Text(
              'Export of ${widget.batchJob.type == BatchJobType.orderExport ? 'orders' : 'products'} is done.');
          fileWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.file_present_rounded),
              const Gap(10),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.batchJob.result?.fileKey ?? '',
                        overflow: TextOverflow.ellipsis),
                    if (widget.batchJob.result?.fileSize != null)
                      Text(
                        getFileSize(),
                        style: context.bodySmall
                            ?.copyWith(color: ColorManager.manatee),
                      ),
                  ],
                ),
              ),
              // Flexible(child: Container()),
            ],
          );
        } else {
          statusWidget = const Text('Import of products is done.');
          fileWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.file_present_rounded),
              const Gap(10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('product-import.csv',
                        overflow: TextOverflow.ellipsis),
                    Text(
                      'Successful import',
                      style: context.bodySmall
                          ?.copyWith(color: ColorManager.manatee),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        break;
      case BatchJobStatus.canceled:
        if (isExport) {
          fileWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.file_present_rounded),
              const Gap(10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.batchJob.result?.fileKey ?? '',
                        overflow: TextOverflow.ellipsis),
                    Text(
                      'Canceled batch export job',
                      style:
                          context.bodySmall?.copyWith(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          statusWidget = const Text('Import of products has been canceled.');
          fileWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.file_present_rounded),
              const Gap(10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('product-import.csv',
                        overflow: TextOverflow.ellipsis),
                    Text(
                      'Canceled batch import job',
                      style:
                          context.bodySmall?.copyWith(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        break;
      case BatchJobStatus.failed:
        if (isExport) {
          fileWidget = const Text('Export Failed');
        } else {
          fileWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.redAccent),
              const Gap(10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('product-import.csv',
                        overflow: TextOverflow.ellipsis),
                    Text(
                      'Job failed',
                      style:
                          context.bodySmall?.copyWith(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          );
          statusWidget = const Text('Import of products has failed.');
        }
        break;
      case BatchJobStatus.preProcessed:
        fileWidget = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.staggeredDotsWave(
                color: context.theme.primaryColor, size: 24),
            const Gap(10),
            const Flexible(
                child: Text('Pre-processed', overflow: TextOverflow.ellipsis)),
          ],
        );
        break;
      case BatchJobStatus.confirmed:
        fileWidget = const Text('Confirmed');
        break;
      case null:
        fileWidget = const SizedBox();
        break;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(color: context.theme.cardColor, width: 2),
                  color: context
                      .getAlphaBlend(context.theme.scaffoldBackgroundColor),
                ),
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isExport
                        ? const Icon(Icons.file_upload_outlined)
                        : const Icon(Icons.file_download_outlined),
                    const Gap(5.0),
                    statusWidget
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showDate = !showDate;
                    });
                  },
                  child: Text(
                      showDate
                          ? '${widget.batchJob.createdAt.formatDate()} at ${widget.batchJob.createdAt.formatTime()}'
                          : widget.batchJob.createdAt?.timeAgo() ?? '',
                      textAlign: TextAlign.center),
                ),
              ),
              const Gap(10),
              Container(
                  width: context.width / 1.8,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // border: Border.all(color: context.theme.cardColor, width: 2),
                    color: context.getAlphaBlend(context.theme.cardColor),
                  ),
                  child: fileWidget),
              const Gap(10),
              if (isExport && isCompleted)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: isCompleted ? widget.onDelete : null,
                        child: const Text('Delete')),
                    FilledButton.icon(
                        onPressed: isCompleted ? widget.onShare : null,
                        label: const Text('Share'),
                        icon: const Icon(Icons.file_upload_outlined)),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class BatchJobTypeBanner extends StatelessWidget {
  const BatchJobTypeBanner(this.batchJobType, {super.key});
  final BatchJobType batchJobType;
  @override
  Widget build(BuildContext context) {
    Icon? icon;
    switch (batchJobType) {
      case BatchJobType.productImport:
        icon = const Icon(Icons.file_download_outlined);
      case BatchJobType.productExport:
        icon = const Icon(Icons.file_upload_outlined);
      case BatchJobType.orderExport:
        icon = const Icon(Icons.file_upload_outlined);
      case BatchJobType.others:
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: context.theme.cardColor, width: 2),
        color: context.getAlphaBlend(context.theme.scaffoldBackgroundColor),
      ),
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Row(
              children: [
                icon,
                const Gap(10),
              ],
            ),
          Text(batchJobType.toString()),
          if (icon != null) const Gap(10),
        ],
      ),
    );
  }
}
