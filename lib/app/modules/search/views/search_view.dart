import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import '../components/index.dart';
import '../controllers/medusa_search_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<MedusaSearchController>(
        // init: MedusaSearchController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: SearchAppBar(controller: controller),
            body: PagedListView(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Object>(
                  itemBuilder: (context, category, index) {
                    final cat = category as Product;
                    return ListTile(
                      title: Text(cat.title ?? ''),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  noItemsFoundIndicatorBuilder: (context) {
                    if (controller
                        .searchCtrl.text.removeAllWhitespace.isEmpty) {
                      return SizedBox(
                        width: Get.width,
                        height: 400,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 6.0),
                                child: Text(
                                  'Search history',
                                  style: smallTextStyle?.copyWith(
                                      color: lightWhite),
                                ),
                              ),
                              ...SearchableFields.values
                                  .map((e) => ListTile(
                                        dense: true,
                                        contentPadding:
                                            const EdgeInsets.only(left: 16.0),
                                        leading: SearchChip(searchableField: e),
                                        title: const Text('Shoes'),
                                        trailing: IconButton(
                                          icon: const Icon(
                                              CupertinoIcons.xmark_circle_fill,
                                              size: 20),
                                          onPressed: () {},
                                        ),
                                      ))
                                  .toList(),
                            ],
                          ),
                        ),
                      );
                    }

                    return Center(
                      child: Text('No items found'),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
