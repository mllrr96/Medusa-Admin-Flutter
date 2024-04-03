// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
//
// import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
// import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import '../../../components/custom_text_field.dart';
// import '../../../components/pick_regions/controllers/pick_regions_controller.dart';
// import '../../../components/pick_regions/views/pick_regions_view.dart';
//
// class CreateUpdateCustomGiftCard extends StatelessWidget {
//   const CreateUpdateCustomGiftCard({super.key});
//   @override
//   Widget build(BuildContext context) {
//     const halfSpace = Gap(6.0);
//     return Scaffold(
//       appBar: AppBar(
//         leading: const CloseButton(),
//         title: const Text('Update Custom Gift Card'),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 context.maybePop();
//               },
//               child: const Text('Save'))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(12.0)),
//                 color: context.theme.expansionTileTheme.backgroundColor,
//               ),
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8.0),
//                     child: Text('Details'),
//                   ),
//                   halfSpace,
//                   LabeledTextField(
//                     label: 'Region',
//                     controller: null,
//                     required: true,
//                     readOnly: true,
//                     onTap: () async {
//                       final regionReq = PickRegionsReq(
//                         multipleSelect: false,
//                         selectedRegions: [],
//                       );
//                       await showBarModalBottomSheet(
//                           context: context,
//                           builder: (context) => PickRegionsView(pickRegionsReq: regionReq)).then((result) {
//                         if (result is PickRegionsRes) {}
//                       });
//                     },
//                     // validator: (val) {
//                     //   if (controller.selectedRegions.isEmpty) {
//                     //     return 'Select at least one region';
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
