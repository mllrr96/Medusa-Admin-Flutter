import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'region_card.dart';

class RegionsLoadingPage extends StatelessWidget {
  const RegionsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final region =
        Region(name: 'Medusa', currencyCode: 'USD', countries: countries.take(5).toList(), id: '');
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          10,
          (index) => index.isEven ? RegionCard(region: region) : const Gap(6.0),
        ),
      ),
    );
  }
}
