import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/invoice.dart';
import '../providers/app_state.dart';
import 'status_badge.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;
  const InvoiceCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final currency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  invoice.monthLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                StatusBadge(status: invoice.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.event, size: 18),
                const SizedBox(width: 6),
                Text(
                  'Vencimento: ${DateFormat('dd/MM/yyyy').format(invoice.dueDate)}',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.payments_outlined, size: 18),
                const SizedBox(width: 6),
                Text('Valor: ${currency.format(invoice.amount)}'),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: _Action(invoice: invoice),
            ),
          ],
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final Invoice invoice;
  const _Action({required this.invoice});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();
    final isPayable =
        invoice.status == InvoiceStatus.open ||
        invoice.status == InvoiceStatus.overdue;

    if (!isPayable) {
      return OutlinedButton.icon(
        onPressed: null,
        icon: const Icon(Icons.check_circle_outline),
        label: const Text('Pago'),
      );
    }

    return ElevatedButton.icon(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Pagamento (mock)'),
            content: Text('Confirmar pagamento de ${invoice.monthLabel}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  state.markInvoicePaid(invoice.id);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pagamento confirmado (mock).'),
                    ),
                  );
                },
                child: const Text('Pagar agora'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.lock_open),
      label: const Text('Pagar agora'),
    );
  }
}
