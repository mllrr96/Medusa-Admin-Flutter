import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/discount_crud/discount_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'components/index.dart';

@RoutePage()
class AddUpdateDiscountView extends StatefulWidget {
  const AddUpdateDiscountView({super.key, this.discount});
  final Discount? discount;

  @override
  State<AddUpdateDiscountView> createState() => _AddUpdateDiscountViewState();
}

class _AddUpdateDiscountViewState extends State<AddUpdateDiscountView> {
  bool get updatingDiscount => widget.discount != null;
  DiscountRuleType discountType = DiscountRuleType.percentage;
  AllocationType allocationType = AllocationType.total;
  UserUpdateDiscountReq? updateDiscountReq;
  UserCreateDiscountReq? createDiscountReq;
  List<DiscountCondition> conditions = [];
  final discountKey = GlobalKey();
  final generalKey = GlobalKey();
  final configKey = GlobalKey();
  final conditionsKey = GlobalKey();
  final generalFormKey = GlobalKey<FormState>();
  final configFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (updatingDiscount) {
      discountType = widget.discount!.rule!.type!;
      allocationType =
          widget.discount!.rule?.allocation ?? AllocationType.total;
    }
    super.initState();
  }

  void _save() {
    if (!generalFormKey.currentState!.validate() ||
        !configFormKey.currentState!.validate()) {
      return;
    }
    generalFormKey.currentState?.save();
    configFormKey.currentState?.save();
    context.unfocus();
    if (updatingDiscount) {
      context.read<DiscountCrudBloc>().add(
          DiscountCrudEvent.update(widget.discount!.id!, updateDiscountReq!));
    } else {
      context
          .read<DiscountCrudBloc>()
          .add(DiscountCrudEvent.create(createDiscountReq!));
    }
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocListener<DiscountCrudBloc, DiscountCrudState>(
      listener: (context, state) {
        state.mapOrNull(
            discount: (_) {
              dismissLoading();
              context.router.popForced(_.discount);
            },
            error: (_) {
              dismissLoading();
              context.showSnackBar(_.failure.toSnackBarString());
            },
            loading: (_) => loading());
      },
      child: PopScope(
        canPop: !updatingDiscount,
        // (updatingDiscount && controller.sameDiscount()),
        onPopInvoked: (val) async {
          if (val) return;
          if (await confirmDiscardChanges && context.mounted) {
            context.router.popForced();
          }
        },
        child: HideKeyboard(
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              leading: const CloseButton(),
              title: updatingDiscount
                  ? const Text('Update discount')
                  : const Text('Create new discount'),
              actions: [
                TextButton(
                    onPressed: () => _save(),
                    child: updatingDiscount
                        ? const Text('Update')
                        : const Text('Create')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                  child: Column(
                    children: [
                      if (!updatingDiscount)
                        Column(
                          children: [
                            DiscountTypeExpansionTile(
                              key: discountKey,
                              discountType: discountType,
                              allocationType: allocationType,
                              onTypeChange: (type) {
                                setState(() => discountType = type);
                              },
                              onAllocationChange: (type) {
                                setState(() => allocationType = type);
                              },
                            ),
                            space,
                          ],
                        ),
                      Form(
                          key: generalFormKey,
                          child: GeneralExpansionTile(
                            key: generalKey,
                            discountType: discountType,
                            onSaved: (regions, code, description, value) {
                              if (updatingDiscount) {
                                updateDiscountReq = UserUpdateDiscountReq(
                                  code: code,
                                  regionsIds:
                                      regions.map((e) => e.id!).toList(),
                                  rule: DiscountRule(
                                    id: widget.discount!.ruleId,
                                    type: null,
                                    allocation: allocationType,
                                    value: value,
                                    description: description,
                                  ),
                                );
                              } else {
                                createDiscountReq = UserCreateDiscountReq(
                                  code: code,
                                  regionsIds:
                                      regions.map((e) => e.id!).toList(),
                                  rule: DiscountRule(
                                    type: discountType,
                                    allocation: allocationType,
                                    value: value,
                                    description: description,
                                    conditions: conditions.isNotEmpty
                                        ? conditions
                                        : null,
                                  ),
                                );
                              }
                            },
                            discount: widget.discount,
                          )),
                      space,
                      Form(
                          key: configFormKey,
                          child: ConfigurationExpansionTile(
                            key: configKey,
                            onSaved: (startDate, endDate, limit) {},
                            discount: widget.discount,
                          )),
                      space,
                      if (!updatingDiscount)
                        ConditionExpansionTile(
                          key: conditionsKey,
                          onSaved: (conditions) {
                            if (conditions.isNotEmpty) {
                              setState(() => this.conditions = conditions);
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> get confirmDiscardChanges async => await showOkCancelAlertDialog(
        context: context,
        title: 'Discard changes',
        message: 'Are you sure you want to discard changes?',
        okLabel: 'Discard',
        isDestructiveAction: true,
      ).then((value) => value == OkCancelResult.ok);
}
