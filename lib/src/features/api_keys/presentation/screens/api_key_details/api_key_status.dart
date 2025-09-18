import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class ApiKeyStatus extends StatelessWidget {
  const ApiKeyStatus(this.apiKey, {super.key});

  final ApiKey apiKey;

  @override
  Widget build(BuildContext context) {
    final status = apiKey.revokedAt == null ? 'Revoked' : 'Active';
    final color = apiKey.revokedAt == null ? Colors.red[100] : Colors.green[100];
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Gap(5),
          Text(status),
        ],
      ),
    );
  }
}
