import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/bloc/product_tags_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class AddUpdateProductTagView extends StatefulWidget {
  const AddUpdateProductTagView({super.key, this.productTag});

  final ProductTag? productTag;

  @override
  State<AddUpdateProductTagView> createState() => _AddUpdateProductTagViewState();
}

class _AddUpdateProductTagViewState extends State<AddUpdateProductTagView> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  late ProductTagsBloc productTagsBloc;

  @override
  void initState() {
    productTagsBloc = ProductTagsBloc.instance;
    if (widget.productTag != null) {
      controller.text = widget.productTag!.value;
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    productTagsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return BlocListener<ProductTagsBloc, ProductTagsState>(
      bloc: productTagsBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (value) {
            loading();
          },
          productTag: (productTag) {
            context.showSnackBar('Product tag created');
            context.pop(productTag.productTag);
            dismissLoading();
          },
          error: (error) {
            context.showSnackBar(error.failure.toSnackBarString());
            dismissLoading();
          },
        );
      },
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: widget.productTag == null
                ? const Text('Create Product Tag')
                : const Text('Update Product Tag'),
          ),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                if (widget.productTag == null) {
                  productTagsBloc.add(
                    ProductTagsEvent.createProductTag(
                      CreateProductTag(
                        value: controller.text,
                      ),
                    ),
                  );
                } else {
                  productTagsBloc.add(
                    ProductTagsEvent.updateProductTag(
                      widget.productTag!.id,
                      UpdateProductTag(
                        value: controller.text,
                      ),
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          )),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Form(
                  key: formKey,
                  child: FlexExpansionTile(
                    initiallyExpanded: true,
                    title: Text('Value'),
                    child: LabeledTextField(
                      label: '',
                      controller: controller,
                      style: smallTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Tag value',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
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
