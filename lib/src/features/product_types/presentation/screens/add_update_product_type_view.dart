import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/features/product_types/presentation/bloc/product_types_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class AddUpdateProductTypeView extends StatefulWidget {
  const AddUpdateProductTypeView({super.key, this.productType});

  final ProductType? productType;

  @override
  State<AddUpdateProductTypeView> createState() => _AddUpdateProductTypeViewState();
}

class _AddUpdateProductTypeViewState extends State<AddUpdateProductTypeView> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  late ProductTypesBloc productTypesBloc;

  @override
  void initState() {
    productTypesBloc = ProductTypesBloc.instance;
    if (widget.productType != null) {
      controller.text = widget.productType!.value;
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    productTypesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return BlocListener<ProductTypesBloc, ProductTypesState>(
      bloc: productTypesBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          productType: (productType) {
            context.showSnackBar('Product type created');
            context.pop(productType.productType);
            dismissLoading();
          },
          error: (e) {
            context.showSnackBar(e.toSnackBarString());
            dismissLoading();
          },
        );
      },
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: widget.productType == null
                ? const Text('Create Product Type')
                : const Text('Update Product Type'),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FilledButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  if (widget.productType == null) {
                    productTypesBloc.add(
                      ProductTypesEvent.createProductType(
                        CreateProductType(
                          value: controller.text,
                        ),
                      ),
                    );
                  } else {
                    productTypesBloc.add(
                      ProductTypesEvent.updateProductType(
                        widget.productType!.id,
                        UpdateProductType(
                          value: controller.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Form(
                  key: formKey,
                  child: FlexExpansionTile(
                    title: Text('Product Type'),
                    initiallyExpanded: true,
                    child: LabeledTextField(
                      label: '',
                      hintText: 'Type',
                      controller: controller,
                      style: smallTextStyle,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
