import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';

import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/models/add_update_tax_rate_req.dart';
import 'package:medusa_admin/presentation/blocs/tax_crud/tax_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

@RoutePage()
class AddUpdateTaxRateView extends StatefulWidget {
  const AddUpdateTaxRateView(this.addUpdateTaxRateReq, {super.key});
  final AddUpdateTaxRateReq addUpdateTaxRateReq;

  @override
  State<AddUpdateTaxRateView> createState() => _AddUpdateTaxRateViewState();
}

class _AddUpdateTaxRateViewState extends State<AddUpdateTaxRateView> {
  bool get updateMode => widget.addUpdateTaxRateReq.taxRate != null;
  final nameCtrl = TextEditingController();
  final taxRateCtrl = TextEditingController();
  final taxCodeCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late TaxCrudBloc taxCrudBloc;

  @override
  void initState() {
    taxCrudBloc = TaxCrudBloc.instance;
    if (updateMode) {
      nameCtrl.text = widget.addUpdateTaxRateReq.taxRate!.name ?? '';
      taxRateCtrl.text =
          widget.addUpdateTaxRateReq.taxRate!.rate?.toString() ?? '';
      taxCodeCtrl.text = widget.addUpdateTaxRateReq.taxRate!.code ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    taxCrudBloc.close();
    nameCtrl.dispose();
    taxRateCtrl.dispose();
    taxCodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaxCrudBloc, TaxCrudState>(
      bloc: taxCrudBloc,
      listener: (context, state) {
        state.maybeMap(
            loading: (_) => loading(),
            taxRate: (taxRate) {
              context.showSnackBar(
                  'Tax rate ${updateMode ? 'updated' : 'created'}');
              dismissLoading();
              context.popRoute(true);
            },
            error: (error) {
              context.showSnackBar(error.failure.toSnackBarString());
              dismissLoading();
            },
            orElse: () => dismissLoading());
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: updateMode
                ? const Text('Update Tax Rate')
                : const Text('Add Tax Rate'),
            actions: [
              TextButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  if (updateMode) {
                    taxCrudBloc.add(TaxCrudEvent.update(
                        widget.addUpdateTaxRateReq.taxRate!.id!,
                        UserUpdateTaxRateReq(
                          code: taxCodeCtrl.text,
                          name: nameCtrl.text,
                          rate: double.tryParse(taxRateCtrl.text),
                          regionId: widget.addUpdateTaxRateReq.regionId,
                        )));
                  } else {
                    taxCrudBloc.add(TaxCrudEvent.create(UserCreateTaxRateReq(
                      code: taxCodeCtrl.text,
                      name: nameCtrl.text,
                      rate: double.tryParse(taxRateCtrl.text),
                      regionId: widget.addUpdateTaxRateReq.regionId,
                    )));
                  }
                },
                child: updateMode ? const Text('Update') : const Text('Create'),
              ),
            ],
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Details'),
                        ),
                        LabeledTextField(
                          label: 'Name',
                          controller: nameCtrl,
                          required: true,
                          hintText: 'Rate name',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                        ),
                        LabeledNumericTextField(
                          label: 'Tax Rate',
                          controller: taxRateCtrl,
                          prefixText: '  %  ',
                          required: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            if (double.tryParse(val) == null) {
                              return 'Invalid tax rate';
                            }

                            if (double.parse(val).isGreaterThan(100)) {
                              return 'Invalid tax rate';
                            }

                            return null;
                          },
                          onPlusPressed: () {
                            var val = double.tryParse(
                                taxRateCtrl.text.removeAllWhitespace);
                            if (val != null) {
                              val = val + 0.01;
                              taxRateCtrl.text = val.toStringAsFixed(2);
                            } else {
                              taxRateCtrl.text = '0.01';
                            }
                          },
                          onMinusPressed: () {
                            var val = double.tryParse(
                                taxRateCtrl.text.removeAllWhitespace);
                            if (val != null && val.isGreaterThan(0.01)) {
                              val = val - 0.01;
                              taxRateCtrl.text = val.toStringAsFixed(2);
                            }
                          },
                        ),
                        LabeledTextField(
                          label: 'Tax Code',
                          controller: taxCodeCtrl,
                          keyboardType: TextInputType.number,
                          required: true,
                          hintText: '1000',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Override'),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Platform.isIOS
                                      ? CupertinoIcons.add
                                      : Icons.add),
                                  const Text(' Add Overrides')
                                ],
                              )),
                        ),
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
