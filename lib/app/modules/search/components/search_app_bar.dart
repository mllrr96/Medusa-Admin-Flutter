import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/search/components/index.dart';
import '../../../../core/utils/medusa_icons_icons.dart';
import '../../components/adaptive_back_button.dart';
import '../controllers/medusa_search_controller.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, required this.controller});
  final MedusaSearchController controller;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
    const constraints = BoxConstraints(minWidth: 30.0, minHeight: 40);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            const AdaptiveBackButton(),
            Flexible(
                child: TextField(
              onSubmitted: (val) {
                if (val.removeAllWhitespace.isNotEmpty) {
                  controller.pagingController.refresh();
                }
              },
              controller: controller.searchCtrl,
              style: smallTextStyle,
              autofocus: true,
              autocorrect: false,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIconConstraints: constraints,
                suffixIcon: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: InkWell(
                    child: const Icon(CupertinoIcons.xmark_circle_fill),
                    onTap: () {
                      controller.searchCtrl.clear();
                      controller.pagingController.refresh();
                    },
                  ),
                ),
                prefixIconConstraints: constraints,
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 12.0),
                    Hero(
                        tag: 'search',
                        child: Icon(MedusaIcons.magnifying_glass_mini,
                            color: lightWhite)),
                    const SizedBox(width: 12.0),
                  ],
                ),
                isDense: true,
                filled: true,
                hintText: 'Search medusa',
                hintStyle: smallTextStyle?.copyWith(color: lightWhite),
                fillColor: context.theme.appBarTheme.backgroundColor,
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                contentPadding: EdgeInsets.zero,
              ),
            )),
            const SizedBox(width: 12.0)
          ],
        ),
        SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchChip(
                  searchableField: SearchableFields.products,
                  onTap: () {},
                ),
                const Chip(label: Text('Order')),
                const Chip(label: Text('Filters')),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
