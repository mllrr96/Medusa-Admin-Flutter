import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/promotions/presentation/bloc/promotion_crud/promotion_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'components/index.dart';

@RoutePage()
class AddUpdatePromotionView extends StatefulWidget {
  const AddUpdatePromotionView({super.key, this.promotion});
  final Promotion? promotion;

  @override
  State<AddUpdatePromotionView> createState() => _AddUpdatePromotionViewState();
}

class _AddUpdatePromotionViewState extends State<AddUpdatePromotionView> {
  bool get updatingDiscount => widget.promotion != null;
  PromotionType discountType = PromotionType.buyget;
  // AllocationType allocationType = AllocationType.total;
  PostPromotionReq? updateDiscountReq;
  PostPromotionReq? createDiscountReq;
  // List<DiscountCondition> conditions = [];
  final discountKey = GlobalKey();
  final generalKey = GlobalKey();
  final configKey = GlobalKey();
  final conditionsKey = GlobalKey();
  final generalFormKey = GlobalKey<FormState>();
  final configFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (updatingDiscount) {
      // discountType = widget.promotion!.rule!.type;
      // allocationType =
      //     widget.promotion!.rule?.allocation ?? AllocationType.total;
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
      context.read<PromotionCrudBloc>().add(
          PromotionCrudEvent.update(widget.promotion!.id, updateDiscountReq!));
    } else {
      context
          .read<PromotionCrudBloc>()
          .add(PromotionCrudEvent.create(createDiscountReq!));
    }
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocListener<PromotionCrudBloc, PromotionCrudState>(
      listener: (context, state) {
        state.mapOrNull(
            discount: (r) {
              dismissLoading();
              context.router.pop(r.discount);
            },
            error: (e) {
              dismissLoading();
              context.showSnackBar(e.failure.toSnackBarString());
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
                            // DiscountTypeExpansionTile(
                            //   key: discountKey,
                            //   discountType: discountType,
                            //   allocationType: allocationType,
                            //   onTypeChange: (type) {
                            //     setState(() => discountType = type);
                            //   },
                            //   onAllocationChange: (type) {
                            //   },
                            // ),
                            space,
                          ],
                        ),
                      Form(
                          key: generalFormKey,
                          child: GeneralExpansionTile(
                            key: generalKey,
                            discountType: discountType,
                            onSaved: (regions, code, description, value) {},
                            discount: widget.promotion,
                          )),
                      space,
                      Form(
                          key: configFormKey,
                          child: ConfigurationExpansionTile(
                            key: configKey,
                            onSaved: (startDate, endDate, limit) {},
                            discount: widget.promotion,
                          )),
                      space,
                      // if (!updatingDiscount)
                      //   ConditionExpansionTile(
                      //     key: conditionsKey,
                      //     onSaved: (conditions) {
                      //       // if (conditions.isNotEmpty) {
                      //       //   setState(() => this.conditions = conditions);
                      //       // }
                      //     },
                      //   ),
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
