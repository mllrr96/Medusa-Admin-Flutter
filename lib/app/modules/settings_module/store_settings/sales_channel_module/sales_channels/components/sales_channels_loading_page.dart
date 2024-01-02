import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'sales_channel_tile.dart';

class SalesChannelsLoadingPage extends StatelessWidget {
  const SalesChannelsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const salesChannel = SalesChannel(
        name: 'Default Sales Channel', description: 'Created by Medusa');
    return Column(
      children: List.generate(
        14,
        (index) => index.isEven
            ? const Skeletonizer(enabled: true, child: SalesChannelTile(salesChannel))
            : const Divider(height: 0, indent: 16.0),
      ),
    );
  }
}
