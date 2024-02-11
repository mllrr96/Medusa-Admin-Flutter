import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/blocs/group_crud/group_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/metadata_card.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class CreateUpdateGroupView extends StatefulWidget {
  const CreateUpdateGroupView({super.key, this.customerGroup});
  final CustomerGroup? customerGroup;

  @override
  State<CreateUpdateGroupView> createState() => _CreateUpdateGroupViewState();
}

class _CreateUpdateGroupViewState extends State<CreateUpdateGroupView> {
  final groupTitleCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool get updateMode => widget.customerGroup != null;
  var metadata = <Metadata>[];
  var metadataTextCtrl = <MetadataTextCtrl>[];
  final listKey = GlobalKey<AnimatedListState>();
  late GroupCrudBloc groupCrudBloc;

  @override
  void initState() {
    groupCrudBloc = GroupCrudBloc.instance;
    groupTitleCtrl.text = widget.customerGroup?.name ?? '';
    widget.customerGroup?.metadata?.forEach((key, value) {
      metadataTextCtrl.add(MetadataTextCtrl(
          key: TextEditingController(text: key),
          value: TextEditingController(text: value)));
    });
    super.initState();
  }

  @override
  void dispose() {
    groupCrudBloc.close();
    groupTitleCtrl.dispose();
    for (var element in metadataTextCtrl) {
      element.key.dispose();
      element.value.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final largeTextStyle = context.bodyLarge;
    return BlocListener<GroupCrudBloc, GroupCrudState>(
      bloc: groupCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          error: (error) {
            dismissLoading();
            context.showSnackBar(error.failure.toSnackBarString());
          },
          group: (success) {
            dismissLoading();
            context.popRoute();
            context.showSnackBar(updateMode
                ? 'Customer group updated!'
                : 'Customer group created!');
          },
        );
      },
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: updateMode
                ? const Text('Update Customer Group')
                : const Text('Create New Customer Group'),
            actions: [
              TextButton(
                  onPressed: updateMode
                      ? () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          context.unfocus();
                          var metadata = <String, dynamic>{};
                          for (var e in metadataTextCtrl) {
                            metadata.addAll({e.key.text: e.value.text});
                          }
                          groupCrudBloc.add(GroupCrudEvent.update(
                              widget.customerGroup!.id!,
                              groupTitleCtrl.text,
                              metadata.isEmpty ? null : metadata));
                        }
                      : () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          context.unfocus();
                          var metadata = <String, dynamic>{};
                          for (var e in metadataTextCtrl) {
                            metadata.addAll({e.key.text: e.value.text});
                          }
                          groupCrudBloc.add(GroupCrudEvent.create(
                              groupTitleCtrl.text,
                              metadata.isEmpty ? null : metadata));
                        },
                  child:
                      updateMode ? const Text('Update') : const Text('Create'))
            ],
          ),
          body: SafeArea(
            child: ListView(
              controller: ScrollController(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: context.theme.cardColor,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LabeledTextField(
                          label: 'Title',
                          required: true,
                          controller: groupTitleCtrl,
                          hintText: 'Customer Group Title',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Group title is required';
                            }
                            return null;
                          },
                        ),
                        space,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Metadata', style: largeTextStyle),
                            TextButton(
                              child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.add),
                                    Text('Add Metadata'),
                                  ]),
                              onPressed: () async {
                                listKey.currentState?.insertItem(
                                    metadataTextCtrl.length,
                                    duration:
                                        const Duration(milliseconds: 200));

                                metadataTextCtrl.add(MetadataTextCtrl(
                                    key: TextEditingController(),
                                    value: TextEditingController()));
                                setState(() {});
                                // await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
                                //   await controller.scrollController.animateTo(
                                //       controller.scrollController.position.maxScrollExtent,
                                //       duration: const Duration(milliseconds: 300),
                                //       curve: Curves.fastOutSlowIn);
                                // });
                              },
                            ),
                          ],
                        ),
                        space,
                        if (metadataTextCtrl.isNotEmpty)
                          AnimatedList(
                              reverse: true,
                              key: listKey,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              initialItemCount: metadataTextCtrl.length,
                              itemBuilder: (context, index, animation) {
                                final metaData = metadataTextCtrl[index];
                                return SizeTransition(
                                  key: ValueKey(index),
                                  axis: Axis.vertical,
                                  sizeFactor: animation,
                                  child: MetadataCard(
                                    keyCtrl: metaData.key,
                                    valueCtrl: metaData.value,
                                    onDelete: () {
                                      metadataTextCtrl.removeAt(index);
                                      listKey.currentState?.removeItem(
                                          index,
                                          (_, animation) => SizeTransition(
                                                key: ValueKey(index),
                                                axis: Axis.vertical,
                                                sizeFactor: animation,
                                                child: MetadataCard(
                                                  key: ValueKey(index),
                                                  keyCtrl: metaData.key,
                                                  valueCtrl: metaData.value,
                                                ),
                                              ),
                                          duration: const Duration(
                                              milliseconds: 200));
                                      setState(() {});
                                    },
                                  ),
                                );
                              }),
                      ],
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

class Metadata {
  final String key;
  final dynamic value;
  Metadata({required this.key, this.value});
}

class MetadataTextCtrl {
  final TextEditingController key;
  final TextEditingController value;
  MetadataTextCtrl({required this.key, required this.value});
}
