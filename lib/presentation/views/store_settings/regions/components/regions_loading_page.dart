import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'region_card.dart';

class RegionsLoadingPage extends StatelessWidget {
  const RegionsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const region = Region(name: 'Medusa', currencyCode: 'USD', taxRate: 0,
    countries: [
      Country(id: 001, iso2: 'af', numCode: 4, name: 'AFGHANISTAN', iso3: 'afg', displayName: 'Afghanistan'),
      Country(id: 002, iso2: 'al', numCode: 8, name: 'ALBANIA', iso3: 'alb', displayName: 'Albania'),
      Country(id: 003, iso2: 'dz', numCode: 12, name: 'ALGERIA', iso3: 'dza', displayName: 'Algeria'),
      Country(id: 004, iso2: 'as', numCode: 16, name: 'AMERICAN SAMOA', iso3: 'asm', displayName: 'American Samoa'),
      Country(id: 005, iso2: 'ad', numCode: 20, name: 'ANDORRA', iso3: 'and', displayName: 'Andorra'),
    ]
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(10, (index) =>index.isEven ? const RegionCard(region: region) : const Gap(6.0),
        ),
      ),
    );
  }
}
