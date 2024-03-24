import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/collection_crud/collection_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CreateCollectionView extends StatefulWidget {
  const CreateCollectionView({super.key, this.collection});
  final ProductCollection? collection;

  @override
  State<CreateCollectionView> createState() => _CreateCollectionViewState();
}

class _CreateCollectionViewState extends State<CreateCollectionView> {
  final titleCtrl = TextEditingController();
  final handleCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> metadata = {};
  late final CollectionCrudBloc collectionCrudBloc;
  ProductCollection? collection;
  bool get updateCollection => widget.collection != null;
  @override
  void initState() {
    collectionCrudBloc = CollectionCrudBloc.instance;
    if (updateCollection) {
      collection = widget.collection;
      titleCtrl.text = collection!.title!;
      handleCtrl.text = collection!.handle ?? '';
      metadata = collection!.metadata ?? {};
    }
    super.initState();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    handleCtrl.dispose();
    collectionCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    final tr = context.tr;
    return BlocListener<CollectionCrudBloc, CollectionCrudState>(
      bloc: collectionCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          collection: (_) {
            if (updateCollection) {
              context.showSnackBar(
                  tr.collectionModalSuccessfullyUpdatedCollection);
            } else {
              context.showSnackBar(
                  tr.collectionModalSuccessfullyCreatedCollection);
            }
            context.maybePop();
          },
          error: (state) {
            context.showSnackBar(state.failure.toSnackBarString());
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: updateCollection
                ? Text(tr.collectionModalEditCollection)
                : Text(tr.collectionModalAddCollection),
            actions: [
              TextButton(
                  onPressed: updateCollection
                      ? () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          if (titleCtrl.text == collection!.title &&
                              handleCtrl.text == collection!.handle &&
                              metadata == collection!.metadata) {
                            context.maybePop();
                            return;
                          }
                          // update collection
                          collectionCrudBloc.add(CollectionCrudEvent.update(
                              widget.collection!.id!,
                              CreateCollectionReq(
                                title: titleCtrl.text,
                                handle: handleCtrl.text,
                              )));
                        }
                      : () async {
                          // create collection
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          collectionCrudBloc.add(CollectionCrudEvent.create(
                              CreateCollectionReq(
                            title: titleCtrl.text,
                            handle: handleCtrl.text,
                          )));
                        },
                  child: updateCollection
                      ? Text(tr.collectionModalSaveCollection)
                      : Text(tr.collectionModalPublishCollection))
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                margin: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  color: context.theme.cardColor,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(tr.collectionModalDetails,
                              style: largeTextStyle),
                        ],
                      ),
                      // Text('Add Collection', style: Theme.of(context).textTheme.bodyLarge),
                      if (!updateCollection)
                        Text(tr.collectionModalDescription,
                            style: smallTextStyle!.copyWith(color: manatee)),
                      space,
                      LabeledTextField(
                        label: tr.collectionModalTitleLabel,
                        controller: titleCtrl,
                        required: true,
                        hintText: 'Sunglasses',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return tr.addressFormThisFieldIsRequired;
                          }
                          return null;
                        },
                      ),
                      LabeledTextField(
                          label: tr.collectionModalHandleLabel,
                          controller: handleCtrl,
                          hintText: tr.collectionModalHandlePlaceholder),
                      Row(
                        children: [
                          Text(tr.collectionModalMetadata,
                              style: largeTextStyle),
                        ],
                      ),
                      space,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete_forever,
                                    color: Colors.red)),
                            LabeledTextField(
                                label: 'Key',
                                controller: TextEditingController(),
                                hintText: 'Key'),
                            LabeledTextField(
                                label: 'Value',
                                controller: TextEditingController(),
                                hintText: 'Value'),
                          ],
                        ),
                      ),
                      TextButton(
                          child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add),
                                Text('Add Metadata'),
                              ]),
                          onPressed: () {}),
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
}
