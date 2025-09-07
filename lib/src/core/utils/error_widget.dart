// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:medusa_admin/src/core/extension/text_style_extension.dart';
//
// import '../../core/constant/colors.dart';
//
// Obx errorMessage(
//         {required RxString errorMessage,
//         required BuildContext context,
//         double? emptyChildHeight,
//         double? errorChildHeight,
//         double? horizontalPadding,
//         double? radius}) =>
//     Obx(() {
//       return AnimatedCrossFade(
//         firstChild: SizedBox(height: emptyChildHeight ?? 50.0),
//         secondChild: Container(
//           height: errorChildHeight ?? 50.0,
//           margin: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 30.0),
//           decoration: BoxDecoration(
//             color: const Color(0xffFFE9E9),
//             borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.error,
//                   color: Colors.redAccent,
//                 ),
//                 const Gap(5),
//                 Expanded(
//                   child: Text(
//                     errorMessage.value,
//                     style:
//                         context.bodyMedium?.copyWith(color: ColorManager.red),
//                     overflow: TextOverflow.fade,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         crossFadeState: errorMessage.value.isEmpty ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//         duration: const Duration(milliseconds: 300),
//       );
//     });
