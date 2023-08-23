import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import '../../../../data/repository/regions/regions_repo.dart';
import '../../../components/custom_text_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChooseRegionView extends GetView<ChooseRegionController> {
  const ChooseRegionView({
    Key? key,
    this.onRegionChanged,
  }) : super(key: key);
  final void Function(Region?)? onRegionChanged;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return controller.obx(
      (state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose region', style: smallTextStyle),
            space,
            DropdownButtonFormField<Region>(
              validator: (val) {
                if (val == null) {
                  return 'Field is required';
                }
                return null;
              },
              items: state!
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name!)))
                  .toList(),
              hint: const Text('Region'),
              onChanged: onRegionChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      onError: (e) => Center(child: Text(e ?? 'Error loading regions')),
      onLoading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Skeletonizer(
          enabled: true,
          child: LabeledTextField(
            label: 'Choose region',
            controller: null,
            decoration: InputDecoration(
              hintText: 'North America',
              suffixIcon: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseRegionController extends GetxController
    with StateMixin<List<Region>> {
  static ChooseRegionController get instance =>
      Get.find<ChooseRegionController>();

  ChooseRegionController({required this.regionsRepo});
  final RegionsRepo regionsRepo;

  @override
  Future<void> onInit() async {
    await _loadRegions();
    super.onInit();
  }

  Future<void> _loadRegions() async {
    change(null, status: RxStatus.loading());
    final result = await regionsRepo.retrieveAll(queryParameters: {});

    result.when(
        (success) => change(success.regions ?? [], status: RxStatus.success()),
        (error) => change(null, status: RxStatus.error(error.message)));
  }
}
