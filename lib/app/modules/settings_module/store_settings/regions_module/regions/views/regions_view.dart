import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/regions_controller.dart';

class RegionsView extends GetView<RegionsController> {
  const RegionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Regions'),
        centerTitle: true,
        actions: [AdaptiveIcon(onPressed: () => Get.toNamed(Routes.ADD_REGION), icon: const Icon(Icons.add))],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Get.toNamed(Routes.ADD_REGION),
      child: const Icon(MedusaIcons.plus_mini),
      ),
      body: SafeArea(
          child: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.pagingController.refresh(),
        header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
        child: PagedListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 6.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Region>(
              itemBuilder: (context, region, index) => RegionCard(region: region),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator.adaptive())),
        ),
      )),
    );
  }
}

class RegionCard extends StatelessWidget {
  const RegionCard({super.key, required this.region, this.onTap,  this.showProviders = true});
  final Region region;
  final void Function()? onTap;
  final bool showProviders;
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return InkWell(
      onTap: onTap ?? () => Get.toNamed(Routes.REGION_DETAILS, arguments: region.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(region.name!, overflow: TextOverflow.ellipsis),
                const SizedBox(width: 8.0),
                Expanded(
                    child: Text('(${getCountries()})',
                        style: mediumTextStyle!.copyWith(color: lightWhite),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2)),
              ],
            ),
            if(showProviders)
            const SizedBox(height: 6.0),
            if(showProviders)
              Row(
              children: [
                Text('Payment Providers: ', style: smallTextStyle?.copyWith(color: lightWhite)),
                Expanded(child: Text(getPaymentProviders(), style: smallTextStyle?.copyWith(color: lightWhite))),
              ],
            ),
            if(showProviders)
              Row(
              children: [
                Text('Fulfillment Providers: ', style: smallTextStyle?.copyWith(color: lightWhite)),
                Expanded(child: Text(getFulfilmentProviders(), style: smallTextStyle?.copyWith(color: lightWhite))),
              ],
            ),
          ],
        ),
      ),
    );

    // return ListTile(
    //   title: Text('${region.name!} (${getCountries()})'),
    //   subtitle: Text('Payment Providers: ', style: smallTextStyle),
    // );
  }

  String getCountries() {
    String countries = '';
    if (region.countries != null) {
      for (Country country in region.countries!) {
        if (countries.isNotEmpty) {
          countries = '$countries, ${country.displayName!}';
        } else {
          countries = country.displayName!;
        }
      }
    }
    if (countries.isEmpty) {
      return 'No countries configured';
    }
    return countries;
  }

  String getPaymentProviders() {
    String paymentProviders = '';
    if (region.paymentProviders != null) {
      for (PaymentProvider payment in region.paymentProviders!) {
        if (paymentProviders.isNotEmpty) {
          paymentProviders = '$paymentProviders, ${payment.id!}';
        } else {
          paymentProviders = payment.id!;
        }
      }
    }
    return paymentProviders.capitalize ?? paymentProviders;
  }

  String getFulfilmentProviders() {
    String fulfilmentProviders = '';
    if (region.fulfillmentProviders != null) {
      for (FulfillmentProvider fulfillment in region.fulfillmentProviders!) {
        if (fulfilmentProviders.isNotEmpty) {
          fulfilmentProviders = '$fulfilmentProviders, ${fulfillment.id!}';
        } else {
          fulfilmentProviders = fulfillment.id!;
        }
      }
    }
    return fulfilmentProviders.capitalize ?? fulfilmentProviders;
  }
}
