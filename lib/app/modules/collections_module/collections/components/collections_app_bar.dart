import 'package:flutter/material.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/search_text_field.dart';
import '../controllers/collections_controller.dart';

class CollectionsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CollectionsAppBar({Key? key}) : super(key: key);

  @override
  State<CollectionsAppBar> createState() => _CollectionsAppBarState();

  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CollectionsAppBarState extends State<CollectionsAppBar> {
  bool collectionSearch = false;
  final collectionCtrl = CollectionsController.instance;
  final searchNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: AnimatedCrossFade(
          key: const ValueKey(1),
          firstChild: SizedBox(
            height: kToolbarHeight,
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                Expanded(
                    child: SearchTextField(
                  hintText: 'Search for collection name, handle',
                  focusNode: searchNode,
                  controller: collectionCtrl.searchCtrl,
                  onChanged: (val) {
                    if (collectionCtrl.searchTerm.value != val) {
                      collectionCtrl.searchTerm.value = val;
                    }
                  },
                )),
                AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      collectionSearch = false;
                      collectionCtrl.searchCtrl.clear();
                      if (collectionCtrl.searchTerm.value.isNotEmpty) {
                        collectionCtrl.searchTerm.value = '';
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          secondChild: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AdaptiveIcon(
                    onPressed: () async {
                      setState(() {
                        collectionSearch = true;
                      });
                      await Future.delayed(kDuration);
                      searchNode.requestFocus();
                    },
                    icon: const Icon(MedusaIcons.magnifying_glass)),
              ],
            ),
          ),
          crossFadeState: collectionSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: kDuration),
    );
  }
}
