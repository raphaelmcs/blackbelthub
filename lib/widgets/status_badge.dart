import 'package:flutter/material.dart';
import '../models/invoice.dart';

class StatusBadge extends StatelessWidget {
  final InvoiceStatus status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    late final Color bg;
    late final String label;

    switch (status) {
      case InvoiceStatus.open:
        bg = cs.primary.withOpacity(.18);
        label = 'Em dia';
        break;
      case InvoiceStatus.overdue:
        bg = cs.error.withOpacity(.22);
        label = 'Em atraso';
        break;
      case InvoiceStatus.paid:
        bg = const Color(0xFF10B981).withOpacity(.22); // success
        label = 'Pago';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
