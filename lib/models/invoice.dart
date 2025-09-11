enum InvoiceStatus { open, overdue, paid }

extension InvoiceStatusX on InvoiceStatus {
  String get label {
    switch (this) {
      case InvoiceStatus.open:
        return 'Em dia';
      case InvoiceStatus.overdue:
        return 'Em atraso';
      case InvoiceStatus.paid:
        return 'Pago';
    }
  }
}

class Invoice {
  final String id;
  final String monthLabel; // ex.: "Set/2025"
  final DateTime dueDate;
  final double amount; // BRL (mock)
  InvoiceStatus status;

  Invoice({
    required this.id,
    required this.monthLabel,
    required this.dueDate,
    required this.amount,
    required this.status,
  });
}
