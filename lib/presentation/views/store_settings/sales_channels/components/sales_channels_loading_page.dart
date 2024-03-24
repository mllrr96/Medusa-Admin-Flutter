import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'sales_channel_tile.dart';

class SalesChannelsLoadingPage extends StatelessWidget {
  const SalesChannelsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const salesChannel = SalesChannel(
        name: 'Default Sales Channel', description: 'Created by Medusa');
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          14,
          (index) => index.isEven
              ? const SalesChannelTile(salesChannel)
              : const Divider(height: 0, indent: 16.0),
        ),
      ),
    );
  }
}
