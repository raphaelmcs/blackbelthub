import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? caption;
  final IconData? icon;
  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.caption,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cs.surface.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 22, color: cs.onPrimary),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Text(value, style: Theme.of(context).textTheme.headlineSmall),
                  if (caption != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      caption!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.white60),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
