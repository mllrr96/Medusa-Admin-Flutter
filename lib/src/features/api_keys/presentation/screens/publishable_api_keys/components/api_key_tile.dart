import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/extensions/date_time_extension.dart';

class ApiKeyTile extends StatelessWidget {
  const ApiKeyTile(this.apiKey, {super.key});

  final ApiKey apiKey;

  @override
  Widget build(BuildContext context) {
    final revoked = apiKey.revokedAt != null;
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 12.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 4,
                  decoration: BoxDecoration(
                      color: revoked ? Colors.redAccent : Colors.green,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12), bottomRight: Radius.circular(12))),
                ),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(apiKey.title, style: largeTextStyle),
                      const Gap(6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(apiKey.redacted,
                                style: smallTextStyle?.copyWith(color: manatee)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Created: ${apiKey.createdAt.formatDate()}',
                              style: smallTextStyle?.copyWith(color: manatee),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
