import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/customers/presentation/bloc/customer_crud/customer_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class AddUpdateCustomerView extends StatefulWidget {
  const AddUpdateCustomerView({super.key, this.customer});

  final Customer? customer;

  @override
  State<AddUpdateCustomerView> createState() => _AddUpdateCustomerViewState();
}

class _AddUpdateCustomerViewState extends State<AddUpdateCustomerView> {
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailNameCtrl = TextEditingController();
  final phoneNameCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  bool get updateMode => widget.customer != null;

  Customer? get customer => widget.customer;

  @override
  void initState() {
    if (updateMode) {
      firstNameCtrl.text = customer?.firstName ?? '';
      lastNameCtrl.text = customer?.lastName ?? '';
      emailNameCtrl.text = customer?.email ?? '';
      phoneNameCtrl.text = customer?.phone ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailNameCtrl.dispose();
    phoneNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const halfSpace = Gap(6.0);
    return BlocListener<CustomerCrudBloc, CustomerCrudState>(
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          error: (error) {
            dismissLoading();
            context.showSnackBar(error.failure.toSnackBarString());
          },
          customer: (_) {
            dismissLoading();
            context.showSnackBar(
                updateMode ? 'Customer updated successfully' : 'Customer created successfully');
            context.maybePop();
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: updateMode ? const Text('Customer Details') : const Text('Create New Customer'),
            actions: [
              TextButton(
                  onPressed: updateMode ? _update : _create,
                  child: updateMode ? const Text('Update') : const Text('Create'))
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Form(
                  key: keyForm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('General'),
                        halfSpace,
                        LabeledTextField(
                          label: 'First Name',
                          textCapitalization: TextCapitalization.words,
                          controller: firstNameCtrl,
                          hintText: 'Lebron',
                        ),
                        LabeledTextField(
                          label: 'Last Name',
                          textCapitalization: TextCapitalization.words,
                          controller: lastNameCtrl,
                          hintText: 'James',
                        ),
                        const Divider(),
                        const Text('Contact'),
                        halfSpace,
                        LabeledTextField(
                          label: 'Email',
                          required: true,
                          controller: emailNameCtrl,
                          hintText: 'Email...',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Email is required';
                            }
                            if (!val.isEmail) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                        LabeledTextField(
                          label: 'Phone Number',
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                          controller: phoneNameCtrl,
                          hintText: '+45 42 42 42 42',
                          validator: (val) {
                            if (val != null && val.isNotEmpty && !val.isPhoneNumber) {
                              return 'Invalid phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update() {
    if (emailNameCtrl.text == customer!.email &&
        firstNameCtrl.text == (customer!.firstName ?? '') &&
        lastNameCtrl.text == (customer!.lastName ?? '') &&
        phoneNameCtrl.text == (customer!.phone ?? '')) {
      context.maybePop();
      return;
    }
    if (!keyForm.currentState!.validate()) {
      return;
    }

    context.read<CustomerCrudBloc>().add(
          CustomerCrudEvent.update(
            customer!.id,
            CustomerUpdateReq(
              email: emailNameCtrl.text == (customer!.email) ? null : emailNameCtrl.text,
              firstName:
                  firstNameCtrl.text == (customer!.firstName ?? '') ? null : firstNameCtrl.text,
              lastName: lastNameCtrl.text == (customer!.lastName ?? '') ? null : lastNameCtrl.text,
              phone: phoneNameCtrl.text == (customer!.phone ?? '') ? null : phoneNameCtrl.text,
            ),
          ),
        );
  }

  void _create() {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    context.read<CustomerCrudBloc>().add(
          CustomerCrudEvent.create(
            CustomerCreateReq(
              email: emailNameCtrl.text,
              firstName: firstNameCtrl.text,
              lastName: lastNameCtrl.text,
              // TODO: Check why no password is needed
              // password: passwordCtrl.text,
              phone: phoneNameCtrl.text,
            ),
          ),
        );
  }
}
