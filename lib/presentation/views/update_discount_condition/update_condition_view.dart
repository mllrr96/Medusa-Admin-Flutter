import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'package:medusa_admin/data/models/update_condition_req.dart';
import 'package:medusa_admin/data/models/update_condition_res.dart';
import 'package:medusa_admin/presentation/blocs/discount_condition/discount_condition_bloc.dart';
import 'package:medusa_admin/presentation/views/discount_conditions/components/index.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class UpdateConditionView extends StatefulWidget {
  const UpdateConditionView(this.updateConditionReq, {super.key});
  final UpdateConditionReq updateConditionReq;

  @override
  State<UpdateConditionView> createState() => _UpdateConditionViewState();
}

class _UpdateConditionViewState extends State<UpdateConditionView> {
  TextEditingController searchCtrl = TextEditingController();
  late DiscountConditionBloc discountConditionBloc;
  Function eq = const DeepCollectionEquality.unordered().equals;
  String operatorText = '';
  UpdateConditionReq get updateConditionReq => widget.updateConditionReq;
  List conditionItems = [];
  List<Object> selectedItems = [];
  List items = [];

  @override
  void initState() {
    discountConditionBloc = DiscountConditionBloc.instance;
    loadText();
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        discountConditionBloc.add(const DiscountConditionEvent.loadProducts());
      case DiscountConditionType.productType:
        discountConditionBloc.add(const DiscountConditionEvent.loadTypes());
      case DiscountConditionType.productCollections:
        discountConditionBloc
            .add(const DiscountConditionEvent.loadCollections());
      case DiscountConditionType.productTags:
        discountConditionBloc.add(const DiscountConditionEvent.loadTags());
      case DiscountConditionType.customerGroups:
        discountConditionBloc.add(const DiscountConditionEvent.loadGroups());
    }
    super.initState();
  }

  @override
  void dispose() {
    discountConditionBloc.close();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomViewPadding =
        context.bottomViewPadding == 0 ? 12.0 : context.bottomViewPadding;
    final topPadding =
        context.bottomViewPadding == 0 ? 12.0 : context.bottomViewPadding / 2;
    final smallTextStyle = context.bodySmall;

    return BlocListener<DiscountConditionBloc, DiscountConditionState>(
      bloc: discountConditionBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          loaded: (_) {
            dismissLoading();
            items = _.items;
            conditionItems.clear();
            conditionItems.addAll(_.items);
            selectedItems.clear();
            selectedItems.addAll(_.items);
            setState(() {});
          },
          error: (_) {
            dismissLoading();
            context.showSnackBar(_.failure.toSnackBarString());
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Condition'),
          actions: [
            TextButton(
              onPressed: () async => await add(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (Platform.isIOS) const Icon(CupertinoIcons.add),
                  if (Platform.isAndroid) const Icon(Icons.add),
                  const Text('Add'),
                ],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight / 2),
            child: SizedBox(
              height: kToolbarHeight / 2,
              child: Text(operatorText, style: smallTextStyle, maxLines: 1),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              bottom: bottomViewPadding,
              left: 22.0,
              right: 22.0,
              top: topPadding),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: FilledButton(
            onPressed: selectedItems.isEmpty ? null : () => save(context),
            child: const Text('Update', style: TextStyle(color: Colors.white)),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return tileWidget(item);
            },
          ),
        ),
      ),
    );
  }

  Widget tileWidget(Object object) {
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        final item = object as Product;
        return ProductTileWithVariantCount(
          product: item,
          value: selectedItems
              .map((e) => (e as Product).id!)
              .toList()
              .contains(item.id),
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              selectedItems.add(item);
            } else {
              selectedItems
                  .removeWhere((element) => (element as Product).id == item.id);
            }
            setState(() {});
          },
        );
      case DiscountConditionType.productType:
        final item = object as ProductType;
        return ConditionTypeListTile(
          type: item,
          value: selectedItems
              .map((e) => (e as ProductType).id!)
              .toList()
              .contains(item.id),
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              selectedItems.add(item);
            } else {
              selectedItems.removeWhere(
                  (element) => (element as ProductType).id == item.id);
            }
            setState(() {});
          },
        );
      case DiscountConditionType.productCollections:
        final item = object as ProductCollection;
        return ConditionCollectionTile(
          collection: item,
          value: selectedItems
              .map((e) => (e as ProductCollection).id!)
              .toList()
              .contains(item.id),
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              selectedItems.add(item);
            } else {
              selectedItems.removeWhere(
                  (element) => (element as ProductCollection).id == item.id);
            }
            setState(() {});
          },
        );

      case DiscountConditionType.productTags:
        final item = object as ProductTag;
        return ConditionTagTile(
          tag: item,
          value: selectedItems
              .map((e) => (e as ProductTag).id!)
              .toList()
              .contains(item.id),
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              selectedItems.add(item);
            } else {
              selectedItems.removeWhere(
                  (element) => (element as ProductTag).id == item.id);
            }
            setState(() {});
          },
        );

      case DiscountConditionType.customerGroups:
        final item = object as CustomerGroup;
        return ConditionCustomerGroupTile(
          customerGroup: item,
          value: selectedItems
              .map((e) => (e as CustomerGroup).id!)
              .toList()
              .contains(item.id),
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              selectedItems.add(item);
            } else {
              selectedItems.removeWhere(
                  (element) => (element as CustomerGroup).id == item.id);
            }
            setState(() {});
          },
        );
    }
  }

  void save(BuildContext context) {
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        if (eq((conditionItems as List<Product>).map((e) => e.id!).toList(),
            (selectedItems as List<Product>).map((e) => e.id!).toList())) {
          context.maybePop();
        } else {
          context.maybePop(UpdateConditionRes(
            updatedItemIds:
                (selectedItems as List<Product>).map((e) => e.id!).toList(),
            originalItemIds:
                (conditionItems as List<Product>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.productType:
        if (eq((conditionItems as List<ProductType>).map((e) => e.id!).toList(),
            (selectedItems as List<ProductType>).map((e) => e.id!).toList())) {
          context.maybePop();
        } else {
          context.maybePop(UpdateConditionRes(
            updatedItemIds:
                (selectedItems as List<ProductType>).map((e) => e.id!).toList(),
            originalItemIds: (conditionItems as List<ProductType>)
                .map((e) => e.id!)
                .toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.productCollections:
        if (eq(
            (conditionItems as List<ProductCollection>)
                .map((e) => e.id!)
                .toList(),
            (selectedItems as List<ProductCollection>)
                .map((e) => e.id!)
                .toList())) {
          context.maybePop();
        } else {
          context.maybePop(UpdateConditionRes(
            updatedItemIds: (selectedItems as List<ProductCollection>)
                .map((e) => e.id!)
                .toList(),
            originalItemIds: (conditionItems as List<ProductCollection>)
                .map((e) => e.id!)
                .toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.productTags:
        if (eq((conditionItems as List<ProductTag>).map((e) => e.id!).toList(),
            (selectedItems as List<ProductTag>).map((e) => e.id!).toList())) {
          context.maybePop();
        } else {
          context.maybePop(UpdateConditionRes(
            updatedItemIds:
                (selectedItems as List<ProductTag>).map((e) => e.id!).toList(),
            originalItemIds:
                (conditionItems as List<ProductTag>).map((e) => e.id!).toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
      case DiscountConditionType.customerGroups:
        if (eq(
            (conditionItems as List<CustomerGroup>).map((e) => e.id!).toList(),
            (selectedItems as List<CustomerGroup>)
                .map((e) => e.id!)
                .toList())) {
          context.maybePop();
        } else {
          context.maybePop(UpdateConditionRes(
            updatedItemIds: (selectedItems as List<CustomerGroup>)
                .map((e) => e.id!)
                .toList(),
            originalItemIds: (conditionItems as List<CustomerGroup>)
                .map((e) => e.id!)
                .toList(),
            discountCondition: updateConditionReq.discountCondition,
            discountConditionType: updateConditionReq.discountConditionType,
          ));
        }
        return;
    }
  }

  Future<void> add(BuildContext context) async {
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        final result = await context.pushRoute(
            ConditionProductRoute(disabledProducts: List<Product>.from(items)));

        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.products!);
          selectedItems.addAll(result.products!);
          setState(() {});
        }
        break;
      case DiscountConditionType.productType:
        final result = await context.pushRoute(
            ConditionTypeRoute(disabledTypes: List<ProductType>.from(items)));

        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.productTypes!);
          selectedItems.addAll(result.productTypes!);
          setState(() {});
        }
        break;
      case DiscountConditionType.productCollections:
        final result = await context.pushRoute(ConditionCollectionRoute(
            disabledCollections: List<ProductCollection>.from(items)));

        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.productCollections!);
          selectedItems.addAll(result.productCollections!);
          setState(() {});
        }
        break;
      case DiscountConditionType.productTags:
        final result = await context.pushRoute(
            ConditionTagRoute(disabledTags: List<ProductTag>.from(items)));

        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.productTags!);
          selectedItems.addAll(result.productTags!);
          setState(() {});
        }
        break;
      case DiscountConditionType.customerGroups:
        final result = await context.pushRoute(ConditionCustomerGroupRoute(
            disabledGroups: List<CustomerGroup>.from(items)));

        if (result != null && result is DiscountConditionRes) {
          items.addAll(result.customerGroups!);
          selectedItems.addAll(result.customerGroups!);
          setState(() {});
        }
        break;
    }
  }

  void loadText() {
    switch (updateConditionReq.discountConditionType) {
      case DiscountConditionType.products:
        if (updateConditionReq.discountCondition.operator ==
            DiscountConditionOperator.notIn) {
          operatorText =
              'Discount is applicable to all products except selected products';
        } else {
          operatorText = 'Discount is applicable to selected products only';
        }
        break;
      case DiscountConditionType.productType:
        if (updateConditionReq.discountCondition.operator ==
            DiscountConditionOperator.notIn) {
          operatorText =
              'Discount is applicable to all product types except selected product types';
        } else {
          operatorText =
              'Discount is applicable to selected product types only';
        }
        break;
      case DiscountConditionType.productCollections:
        if (updateConditionReq.discountCondition.operator ==
            DiscountConditionOperator.notIn) {
          operatorText =
              'Discount is applicable to all collections except selected collections';
        } else {
          operatorText = 'Discount is applicable to selected collections only';
        }
        break;
      case DiscountConditionType.productTags:
        if (updateConditionReq.discountCondition.operator ==
            DiscountConditionOperator.notIn) {
          operatorText =
              'Discount is applicable to all tags except selected tags';
        } else {
          operatorText = 'Discount is applicable to selected tags only';
        }
        break;
      case DiscountConditionType.customerGroups:
        if (updateConditionReq.discountCondition.operator ==
            DiscountConditionOperator.notIn) {
          operatorText =
              'Discount is applicable to all groups except selected groups';
        } else {
          operatorText = 'Discount is applicable to selected groups only';
        }
        break;
    }
  }
}
