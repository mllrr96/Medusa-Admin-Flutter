import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/data/models/pick_customer_req.dart';
import 'package:medusa_admin/data/models/pick_customer_res.dart';
import 'package:medusa_admin/presentation/blocs/order_crud/order_crud_bloc.dart';
import 'package:medusa_admin/presentation/views/orders/components/fulfillment_label.dart';
import 'package:medusa_admin/presentation/views/orders/components/payment_status_label.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class TransferOrderView extends StatefulWidget {
  const TransferOrderView(this.order, {super.key});
  final Order order;

  @override
  State<TransferOrderView> createState() => _TransferOrderViewState();
}

class _TransferOrderViewState extends State<TransferOrderView> {
  final currentOwnerCtrl = TextEditingController();
  final newOwnerCtrl = TextEditingController();
  Customer? selectedCustomer;
  late OrderCrudBloc orderCrudBloc;

  @override
  void initState() {
    orderCrudBloc = OrderCrudBloc.instance;
    final customer = widget.order.customer;
    currentOwnerCtrl.text =
        '${customer?.firstName ?? ''} ${customer?.lastName ?? ''} ${customer?.firstName != null || customer?.lastName != null ? '-' : ''} ${customer?.email ?? ''}';
    super.initState();
  }

  @override
  void dispose() {
    orderCrudBloc.close();
    currentOwnerCtrl.dispose();
    newOwnerCtrl.dispose();
    super.dispose();
  }

  Order get order => widget.order;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
    return BlocListener<OrderCrudBloc, OrderCrudState>(
      bloc: orderCrudBloc,
      listener: (context, state) {
        state.whenOrNull(
            loading: () => loading(),
            order: (_) {
              dismissLoading();
              context.showSnackBar('Order updated successfully');
              context.maybePop();
            },
            error: (e) {
              dismissLoading();
              context.showSnackBar(e.toSnackBarString());
            });
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: const Text('Transfer Order'),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
                bottom: bottomViewPadding == 0 ? 12 : bottomViewPadding,
                left: 24,
                right: 24),
            child: FilledButton(
                onPressed: selectedCustomer != null
                    ? () {
                  // orderCrudBloc.add(OrderCrudEvent.update(
                  //     order.id,
                  //     PostOrdersOrderReq(
                  //         customerId: selectedCustomer!.id)));
                }
                    : null,
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          body: SafeArea(
              child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            children: [
              // AlternativeOrderCard(order, onTap: null),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FulfillmentStatusLabel(
                      fulfillmentStatus: order.fulfillmentStatus!),
                  PaymentStatusLabel(paymentStatus: order.paymentStatus!)
                ],
              ),
              space,
              LabeledTextField(
                label: 'Current Owner',
                controller: currentOwnerCtrl,
                readOnly: true,
              ),
              LabeledTextField(
                label: 'New Owner',
                controller: newOwnerCtrl,
                hintText: 'Select...',
                readOnly: true,
                onTap: () async {
                  final result = await context.pushRoute(PickCustomerRoute(
                      pickCustomerReq: PickCustomerReq(
                          disabledCustomers: [order.customer!])));
                  if (result is PickCustomerRes) {
                    setState(() =>
                        selectedCustomer = result.selectedCustomers.first);
                    final customer = selectedCustomer;
                    newOwnerCtrl.text =
                        '${customer?.firstName ?? ''} ${customer?.lastName ?? ''} ${customer?.firstName != null || customer?.lastName != null ? '-' : ''} ${customer?.email ?? ''}';
                  }
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
