import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../models/invoice.dart';
import '../widgets/invoice_card.dart';
import '../widgets/dojo_app_bar.dart';

enum PaymentFilter { all, open, overdue, paid }

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  PaymentFilter filter = PaymentFilter.all;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final invoices = state.invoices.where((i) {
      switch (filter) {
        case PaymentFilter.all:
          return true;
        case PaymentFilter.open:
          return i.status == InvoiceStatus.open;
        case PaymentFilter.overdue:
          return i.status == InvoiceStatus.overdue;
        case PaymentFilter.paid:
          return i.status == InvoiceStatus.paid;
      }
    }).toList();

    return Scaffold(
      appBar: const DojoAppBar(title: 'Mensalidade'),
      body: Column(
        children: [
          const SizedBox(height: 8),
          _Filters(
            filter: filter,
            onChanged: (f) => setState(() => filter = f),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: invoices.length,
              itemBuilder: (_, i) => InvoiceCard(invoice: invoices[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  final PaymentFilter filter;
  final ValueChanged<PaymentFilter> onChanged;
  const _Filters({required this.filter, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _chip(context, 'Todos', PaymentFilter.all),
          const SizedBox(width: 8),
          _chip(context, 'Em dia', PaymentFilter.open),
          const SizedBox(width: 8),
          _chip(context, 'Em atraso', PaymentFilter.overdue),
          const SizedBox(width: 8),
          _chip(context, 'Pago', PaymentFilter.paid),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context, String label, PaymentFilter value) {
    final selected = filter == value;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onChanged(value),
    );
  }
}
