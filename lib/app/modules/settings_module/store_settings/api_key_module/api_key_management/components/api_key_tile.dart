import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class ApiKeyTile extends StatelessWidget {
  const ApiKeyTile(this.apiKey,{super.key});
  final PublishableApiKey apiKey;
  @override
  Widget build(BuildContext context) {
    final revoked = apiKey.revokedAt != null;
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
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
                      color: revoked
                          ? Colors.redAccent
                          : Colors.green,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                ),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(apiKey.title ?? ''),
                      Text(apiKey.id ?? '',
                          style: smallTextStyle?.copyWith(
                              color: lightWhite)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(apiKey.createdAt.formatDate(),
                  style: smallTextStyle),
              Text(apiKey.createdAt.formatTime(),
                  style: smallTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
