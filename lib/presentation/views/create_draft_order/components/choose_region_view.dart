// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
//
// import 'package:medusa_admin/domain/use_case/region/regions_use_case.dart';
// import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
// import 'package:medusa_admin_dart_client/medusa_admin.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:medusa_admin/core/extension/text_style_extension.dart';
//
// class ChooseRegionView extends StatelessWidget {
//   const ChooseRegionView({
//     super.key,
//     this.onRegionChanged,
//   });
//
//   final void Function(Region?)? onRegionChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     final smallTextStyle = context.bodySmall;
//     const space = Gap(12);
//     return GetBuilder<ChooseRegionController>(
//         init: ChooseRegionController(regionsUseCase: RegionCrudUseCase.instance),
//         builder: (controller) {
//           return controller.obx(
//             (state) => Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Choose region', style: smallTextStyle),
//                   space,
//                   DropdownButtonFormField<Region>(
//                     style: context.bodyMedium,
//                     validator: (val) {
//                       if (val == null) {
//                         return 'Field is required';
//                       }
//                       return null;
//                     },
//                     items: state!
//                         .map((e) =>
//                             DropdownMenuItem(value: e, child: Text(e.name!)))
//                         .toList(),
//                     hint: const Text('Region'),
//                     onChanged: onRegionChanged,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             onError: (e) => Center(child: Text(e ?? 'Error loading regions')),
//             onLoading: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//               child: Skeletonizer(
//                 enabled: true,
//                 child: LabeledTextField(
//                   label: 'Choose region',
//                   controller: null,
//                   decoration: InputDecoration(
//                     hintText: 'North America',
//                     suffixIcon: Icon(Icons.add),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
//
// class ChooseRegionController extends GetxController
//     with StateMixin<List<Region>> {
//   static ChooseRegionController get instance =>
//       Get.find<ChooseRegionController>();
//
//   ChooseRegionController({required this.regionsUseCase});
//
//   final RegionCrudUseCase regionsUseCase;
//
//   @override
//   Future<void> onInit() async {
//     await _loadRegions();
//     super.onInit();
//   }
//
//   Future<void> _loadRegions() async {
//     change(null, status: RxStatus.loading());
//     final result = await regionsUseCase.loadAll();
//
//     result.when(
//         (success) => change(success.regions ?? [], status: RxStatus.success()),
//         (error) => change(null, status: RxStatus.error(error.message)));
//   }
// }
