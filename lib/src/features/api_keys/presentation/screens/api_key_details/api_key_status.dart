import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class ApiKeyStatus extends StatelessWidget {
  const ApiKeyStatus(this.apiKey, {super.key});

  final ApiKey apiKey;

  @override
  Widget build(BuildContext context) {
    final status = apiKey.revokedAt != null ? 'Revoked' : 'Active';
    final color = apiKey.revokedAt != null ? Colors.red : Colors.green;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
          ),
          Gap(5),
          Text(status),
        ],
      ),
    );
  }
}
