import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ConfigurationExpansionTile extends StatefulWidget {
  const ConfigurationExpansionTile(
      {super.key,
      this.tileController,
      this.initiallyExpanded = false,
      required this.onSaved,
      this.discount});
  final FlexExpansionTileController? tileController;
  final bool initiallyExpanded;
  final Discount? discount;
  final void Function(
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  ) onSaved;
  @override
  State<ConfigurationExpansionTile> createState() =>
      _ConfigurationExpansionTileState();
}

class _ConfigurationExpansionTileState
    extends State<ConfigurationExpansionTile> {
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController? limitCtrl;
  bool get hasStartDate => startDate != null;
  bool get hasEndDate => endDate != null;
  bool get hasLimit => limitCtrl != null;

  @override
  void initState() {
    if (widget.discount != null) {
      startDate = widget.discount!.startsAt;
      endDate = widget.discount!.endsAt;
      if(widget.discount!.usageLimit !=null){
        limitCtrl =
            TextEditingController(text: widget.discount!.usageLimit.toString());
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    limitCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    const halfSpace = Gap(6);
    final disableStartDate = widget.discount?.startsAt != null;
    return FormField(
      onSaved: (_) {
        widget.onSaved(startDate, endDate, int.tryParse(limitCtrl?.text ?? ''));
      },
      builder: (_) => FlexExpansionTile(
        // key: controller.configKey,
        controller: widget.tileController,
        maintainState: true,
        onExpansionChanged: (expanded) async {
          if (expanded && widget.key is GlobalKey) {
            await (widget.key as GlobalKey).currentContext?.ensureVisibility();
          }
        },
        initiallyExpanded: widget.initiallyExpanded,
        title: Text('Configuration', style: largeTextStyle),
        childPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          children: <Widget>[
            Text(
              'Discount code applies from you hit the publish button and forever if left untouched.',
              style: smallTextStyle?.copyWith(color: manatee),
            ),
            IgnorePointer(
              ignoring: disableStartDate,
              child: Opacity(
                opacity: disableStartDate ? 0.5 : 1.0,
                child: Column(
                  children: [
                    space,
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      value: hasStartDate,
                      onChanged: (enabled) async {
                        // hasStartDate = val;
                        // controller.update([2]);

                        if (enabled) {
                          startDate = DateTime.now();
                          (widget.key as GlobalKey?)
                              ?.currentContext
                              .ensureVisibility();
                        } else {
                          startDate = null;
                        }
                        setState(() {});
                        // if (!val) {
                        //   controller.startDate = null;
                        // } else {
                        //   await controller.configKey.currentContext
                        //       .ensureVisibility();
                        // }
                      },
                      title: const Text('Start date'),
                      subtitle: const Text(
                          'Schedule the discount to activate in the future.',
                          style: TextStyle(color: manatee)),
                    ),
                    halfSpace,
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: hasStartDate
                          ? DateTimeCard(
                              validator: (date) {
                                if (date == null) {
                                  return 'Required';
                                }
                                return null;
                              },
                              dateTime: startDate!,
                              dateText: 'Start',
                              onTap: () async {
                                await context.adaptiveDateTimePicker(
                                        date: startDate!)
                                    .then((result) {
                                  if (result != null) {
                                    setState(() => startDate = result);
                                  }
                                });
                              },
                            )
                          : const SizedBox.shrink(),
                    ),
                    space,
                  ],
                ),
              ),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Discount has an expiry date?'),
              subtitle: const Text(
                  'Schedule the discount to deactivate in the future.',
                  style: TextStyle(color: manatee)),
              onChanged: (enabled) async {
                if (enabled) {
                  endDate = DateTime.now().add(7.days);
                  (widget.key as GlobalKey?)?.currentContext.ensureVisibility();
                } else {
                  endDate = null;
                }
                setState(() {});
                // controller.hasEndDate = val;
                // controller.update([2]);
                // if (!val) {
                //   controller.endDate = null;
                // } else {
                //   await controller.configKey.currentContext
                //       .ensureVisibility();
                // }
              },
              value: hasEndDate,
            ),
            halfSpace,
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: hasEndDate
                  ? DateTimeCard(
                      validator: (date) {
                        if (date == null) {
                          return 'Required';
                        }
                        return null;
                      },
                      dateTime: endDate,
                      dateText: 'Expiry',
                      onTap: () async {
                        await context
                            .adaptiveDateTimePicker(date: endDate)
                            .then((result) {
                          if (result != null) {
                            setState(() => endDate = result);
                          }
                        });
                      },
                    )
                  : const SizedBox.shrink(),
            ),
            space,
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Limit the number of redemptions?'),
              subtitle: const Text(
                  'Limit applies across all customers, not per customer.',
                  style: TextStyle(color: manatee)),
              value: hasLimit,
              onChanged: (enabled) async {
                if (enabled) {
                  limitCtrl = TextEditingController();
                  (widget.key as GlobalKey?)?.currentContext.ensureVisibility();
                } else {
                  limitCtrl = null;
                }
                setState(() {});
                // controller.hasLimit = val;
                // controller.update([2]);
                // if (!val) {
                //   controller.limitCtrl.clear();
                // } else {
                //   await controller.configKey.currentContext
                //       .ensureVisibility();
                // }
              },
            ),
            halfSpace,
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: hasLimit
                  ? Row(
                      children: [
                        Flexible(
                          child: LabeledNumericTextField(
                            label: 'Number of redemptions',
                            controller: limitCtrl!,
                            hintText: '...',
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Flexible(child: SizedBox())
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            space,
          ],
        ),
      ),
    );
  }
}
