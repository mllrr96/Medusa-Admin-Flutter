import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/models/app_preference.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';

@RoutePage()
class AppBarStyleView extends StatefulWidget {
  const AppBarStyleView({super.key});

  @override
  State<AppBarStyleView> createState() => _AppBarStyleViewState();
}

class _AppBarStyleViewState extends State<AppBarStyleView> {
  PreferenceService get preferenceService => PreferenceService.instance;
  AppPreference get appSettings => PreferenceService.appSettingsGetter;
  AppBarStyle get appBarStyle => PreferenceService.appSettingsGetter.appBarStyle;
  late AppBarStyle selectedStyle;

  @override
  void initState() {
    selectedStyle = appBarStyle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        MedusaSliverAppBar(
          title: Text('${selectedStyle.name.capitalize} AppBar'),
          actions: [
            TextButton(
                onPressed: () async {
                  await preferenceService
                      .updateAppSettings(
                          appSettings.copyWith(appBarStyle: selectedStyle))
                      .then((_) => context.maybePop());
                },
                child: const Text('Save'))
          ],
          appBarStyle: selectedStyle,
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, context.height),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const Text('AppBar Style'),
              const Gap(10.0),
              SegmentedButton<AppBarStyle>(
                  onSelectionChanged: (val) {
                    setState(() {
                      selectedStyle = val.first;
                    });
                  },
                  segments: AppBarStyle.values
                      .map((e) => ButtonSegment<AppBarStyle>(
                            value: e,
                            label: Text(e.name.capitalize),
                          ))
                      .toList(),
                  selected: {selectedStyle}),
              if (selectedStyle == AppBarStyle.normal)
                SwitchListTile(
                  value: false,
                  onChanged: (val) {},
                  title: const Text('Hide app bar when scrolling'),
                ),
              const Text('Restart the app to see the changes',
                  style: TextStyle(color: ColorManager.manatee))
            ]),
          ),
        ),
      ],
    ));
  }
}
