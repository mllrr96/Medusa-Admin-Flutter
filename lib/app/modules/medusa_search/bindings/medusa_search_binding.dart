import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/data/repository/draft_order/draft_order_repo.dart';
import 'package:medusa_admin/app/data/repository/gift_card/gift_card_repo.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/repository/product_tag/product_tag_repo.dart';

import '../../../data/repository/regions/regions_repo.dart';
import '../../../data/repository/sales_channel/sales_channel_repo.dart';
import '../controllers/medusa_search_controller.dart';

class MedusaSearchBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SearchController>(
    //   () => SearchController(),
    // );
    Get.put(
      MedusaSearchController(
        productsRepo: ProductsRepo(),
        ordersRepo: OrdersRepo(),
        giftCardRepo: GiftCardRepo(),
        draftOrderRepo: DraftOrderRepo(),
        collectionRepo: CollectionRepo(),
        customerRepo: CustomerRepo(),
        customerGroupRepo: CustomerGroupRepo(),
        discountRepo: DiscountRepo(),
        priceListRepo: PriceListRepo(), productTagRepo: ProductTagRepo(),
        regionsRepo: RegionsRepo(),
        salesChannelRepo: SalesChannelRepo(),
      ),
    );
  }
}
