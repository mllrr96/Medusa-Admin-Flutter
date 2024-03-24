import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/sales_channel_crud/sales_channel_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

@RoutePage()
class AddUpdateSalesChannelView extends StatefulWidget {
  const AddUpdateSalesChannelView({super.key, this.salesChannel});
  final SalesChannel? salesChannel;

  @override
  State<AddUpdateSalesChannelView> createState() =>
      _AddUpdateSalesChannelViewState();
}

class _AddUpdateSalesChannelViewState extends State<AddUpdateSalesChannelView> {
  bool get updateMode => widget.salesChannel == null ? false : true;
  bool disabled = false;
  final formKey = GlobalKey<FormState>();
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  late SalesChannelCrudBloc salesChannelCrudBloc;

  @override
  void initState() {
    salesChannelCrudBloc = SalesChannelCrudBloc.instance;
    if (updateMode) {
      titleCtrl.text = widget.salesChannel!.name ?? '';
      descriptionCtrl.text = widget.salesChannel!.description ?? '';
      disabled = widget.salesChannel!.isDisabled ?? false;
    }

    super.initState();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
    return BlocListener<SalesChannelCrudBloc, SalesChannelCrudState>(
      bloc: salesChannelCrudBloc,
      listener: (context, state) {
        state.maybeMap(
          loading: (_) => loading(),
          salesChannel: (_) {
            dismissLoading();
            if (updateMode) {
              context.showSnackBar('Sales channel updated successfully');
              context.maybePop(_.salesChannel);
            } else {
              context.showSnackBar('Sales channel created successfully');
              context.maybePop(_.salesChannel);
            }
          },
          error: (error) {
            context.showSnackBar(error.failure.toSnackBarString());
            dismissLoading();
          },
          orElse: () => dismissLoading(),
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: updateMode
                ? const Text('Update sales channel')
                : const Text('Create new sales channel'),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            padding: EdgeInsets.only(
                bottom: bottomViewPadding, top: bottomViewPadding / 2),
            child: FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: disabled ? Colors.blueGrey : null),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                updateMode
                    ? salesChannelCrudBloc.add(SalesChannelCrudEvent.update(
                        widget.salesChannel!.id!,
                        UserSalesChannelUpdateReq(
                          name: titleCtrl.text,
                          description: descriptionCtrl.text,
                          isDisabled: disabled,
                        ),
                      ))
                    : salesChannelCrudBloc.add(SalesChannelCrudEvent.create(
                        UserSalesChannelCreateReq(
                          name: titleCtrl.text,
                          description: descriptionCtrl.text,
                          isDisabled: disabled,
                        ),
                      ));
              },
              child: updateMode
                  ? const Text('Update Channel',
                      style: TextStyle(color: Colors.white))
                  : disabled
                      ? const Text('Save as draft',
                          style: TextStyle(color: Colors.white))
                      : const Text('Publish Channel',
                          style: TextStyle(color: Colors.white)),
            ),
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: [
                  FlexExpansionTile(
                    initiallyExpanded: true,
                    title: const Text('General info'),
                    child: Column(
                      children: [
                        LabeledTextField(
                          label: 'Title',
                          controller: titleCtrl,
                          hintText:
                              'Website, App, Amazon, physical store POS, facebook, product feed',
                          required: !updateMode,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            return null;
                          },
                        ),
                        LabeledTextField(
                          label: 'Description',
                          controller: descriptionCtrl,
                          hintText:
                              'Available products at our website, app ...',
                          textInputAction: TextInputAction.done,
                        ),
                        CheckboxListTile(
                          value: disabled,
                          onChanged: (val) {
                            if (val == null) return;
                            setState(() => disabled = val);
                          },
                          title: const Text('Disabled'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
