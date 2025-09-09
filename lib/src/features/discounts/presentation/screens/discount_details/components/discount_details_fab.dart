import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/src/features/discounts/presentation/bloc/discount_crud/discount_crud_bloc.dart';

class DiscountDetailsFab extends StatelessWidget {
  const DiscountDetailsFab(this.discountCrudBloc,
      {super.key, this.expandableStyle = true});
  final bool expandableStyle;
  final DiscountCrudBloc discountCrudBloc;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    onDeleteTap(String id) async {
      await showOkCancelAlertDialog(
              context: context,
              title: 'Delete Promotion',
              message: 'Are you sure you want to delete this promotion?',
              okLabel: 'Yes, delete',
              cancelLabel: 'Cancel',
              isDestructiveAction: true)
          .then((value) async {
        if (value == OkCancelResult.ok) {
          discountCrudBloc.add(DiscountCrudEvent.delete(id));
        }
      });
    }

    // onUpdateTap(Promotion discount) async {
    //   await context
    //       .pushRoute(AddUpdateDiscountRoute(discount: discount))
    //       .then((value) async {
    //     if (value is bool && value == true) {
    //       discountCrudBloc.add(DiscountCrudEvent.load(discount.id));
    //     }
    //   });
    // }

    if (expandableStyle) {
      const emptySpeedDial = SpeedDial(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        animatedIcon: AnimatedIcons.menu_close,
      );

      return BlocBuilder<DiscountCrudBloc, DiscountCrudState>(
        bloc: discountCrudBloc,
        builder: (context, state) {
          return state.maybeWhen(
              discount: (promotion) => SpeedDial(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    animatedIcon: AnimatedIcons.menu_close,
                    spacing: 10,
                    children: [
                      SpeedDialChild(
                        child: const Icon(MedusaIcons.trash),
                        label: 'Delete Discount',
                        backgroundColor: Colors.red,
                        labelBackgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        labelStyle:
                            smallTextStyle?.copyWith(color: Colors.white),
                        onTap: () => onDeleteTap(promotion.id),
                        onLongPress: () {},
                      ),
                      SpeedDialChild(
                        child: const Icon(MedusaIcons.pencil_square_solid),
                        label: 'Update Discount',
                        labelStyle: smallTextStyle,
                        // onTap: () async => await onUpdateTap(_.discount),
                        onLongPress: () {},
                      ),
                    ],
                  ),
              loading: (_) => emptySpeedDial,
              orElse: () => const SizedBox.shrink());
        },
      );
    }
    return BlocBuilder<DiscountCrudBloc, DiscountCrudState>(
      bloc: discountCrudBloc,
      builder: (context, state) {
        return state.maybeWhen(
            discount: (promotion) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        onPressed: () => onDeleteTap(promotion.id),
                        child: const Icon(MedusaIcons.trash)),
                    const SizedBox(width: 12.0),
                    FloatingActionButton(
                        heroTag: null,
                        backgroundColor: ColorManager.primary,
                        foregroundColor: Colors.white,
                        // onPressed: () async => await onUpdateTap(_.discount),
                        onPressed: null,
                        child: const Icon(MedusaIcons.pencil_square_solid)),
                  ],
                ),
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
