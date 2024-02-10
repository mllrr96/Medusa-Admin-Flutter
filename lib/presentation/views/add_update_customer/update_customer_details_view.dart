import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/customer_crud/customer_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

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
  final passwordCtrl = TextEditingController();
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
    passwordCtrl.dispose();
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
            context.showSnackBar(updateMode
                ? 'Customer updated successfully'
                : 'Customer created successfully');
            context.popRoute();
          },
        );
      },
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: updateMode
                ? const Text('Customer Details')
                : const Text('Create New Customer'),
            actions: [
              TextButton(
                  onPressed: updateMode
                      ? () {
                          if (emailNameCtrl.text == customer!.email &&
                              firstNameCtrl.text ==
                                  (customer!.firstName ?? '') &&
                              lastNameCtrl.text == (customer!.lastName ?? '') &&
                              phoneNameCtrl.text == (customer!.phone ?? '')) {
                            context.popRoute();
                            return;
                          }
                          if (!keyForm.currentState!.validate()) {
                            return;
                          }

                          context
                              .read<CustomerCrudBloc>()
                              .add(CustomerCrudEvent.update(
                                  customer!.id!,
                                  UserUpdateCustomerReq(
                                    email:
                                        emailNameCtrl.text == (customer!.email)
                                            ? null
                                            : emailNameCtrl.text,
                                    firstName: firstNameCtrl.text ==
                                            (customer!.firstName ?? '')
                                        ? null
                                        : firstNameCtrl.text,
                                    lastName: lastNameCtrl.text ==
                                            (customer!.lastName ?? '')
                                        ? null
                                        : lastNameCtrl.text,
                                    phone: phoneNameCtrl.text ==
                                            (customer!.phone ?? '')
                                        ? null
                                        : phoneNameCtrl.text,
                                  )));
                        }
                      : () {
                          if (!keyForm.currentState!.validate()) {
                            return;
                          }
                          context.read<CustomerCrudBloc>().add(
                                  CustomerCrudEvent.create(
                                      UserCreateCustomerReq(
                                email: emailNameCtrl.text,
                                firstName: firstNameCtrl.text,
                                lastName: lastNameCtrl.text,
                                password: passwordCtrl.text,
                                phone: phoneNameCtrl.text,
                              )));
                        },
                  child:
                      updateMode ? const Text('Update') : const Text('Create'))
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Form(
                  key: keyForm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('General'),
                        halfSpace,
                        LabeledTextField(
                          label: 'First Name',
                          required: !updateMode,
                          textCapitalization: TextCapitalization.words,
                          controller: firstNameCtrl,
                          hintText: 'Lebron',
                          validator: updateMode
                              ? null
                              : (val) {
                                  if (val != null && val.isEmpty) {
                                    return 'First name is required';
                                  }
                                  return null;
                                },
                        ),
                        LabeledTextField(
                          label: 'Last Name',
                          required: !updateMode,
                          textCapitalization: TextCapitalization.words,
                          controller: lastNameCtrl,
                          hintText: 'James',
                          validator: updateMode
                              ? null
                              : (val) {
                                  if (val != null && val.isEmpty) {
                                    return 'Last name is required';
                                  }
                                  return null;
                                },
                        ),
                        if (!updateMode)
                          LabeledTextField(
                            label: 'Password',
                            required: !updateMode,
                            controller: passwordCtrl,
                            obscureText: true,
                            hintText: 'Enter strong password',
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val != null && val.length < 8) {
                                return 'Password should be at least 8 characters long';
                              }
                              return null;
                            },
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
                            if (val != null &&
                                val.isNotEmpty &&
                                !val.isPhoneNumber) {
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
}
