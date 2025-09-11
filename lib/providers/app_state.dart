import 'package:flutter/material.dart';
import '../models/modality.dart';
import '../models/user.dart';
import '../models/invoice.dart';

class AppState extends ChangeNotifier {
  UserProfile? _user;
  Modality? _currentModality;

  // Mock KPIs para o header hero
  int _lessonsThisMonth = 12;
  int _lessonsGoal = 16;

  // Mock invoices
  final List<Invoice> _invoices = [];

  UserProfile? get user => _user;
  Modality? get currentModality => _currentModality;
  int get lessonsThisMonth => _lessonsThisMonth;
  int get lessonsGoal => _lessonsGoal;
  double get monthProgress => _lessonsGoal == 0
      ? 0
      : (_lessonsThisMonth / _lessonsGoal).clamp(0.0, 1.0);
  List<Invoice> get invoices => List.unmodifiable(_invoices);

  Future<void> loadMock() async {
    await Future.delayed(const Duration(milliseconds: 200));
    const mockModalities = <Modality>[
      Modality(
        id: 'gi',
        name: 'Jiu-Jitsu',
        belt: 'Faixa Branca',
        activeEnrollment: true,
      ),
      Modality(
        id: 'judo',
        name: 'Judô',
        belt: 'Faixa Branca',
        activeEnrollment: true,
      ),
      Modality(
        id: 'muay',
        name: 'Muay Thai',
        belt: '—',
        activeEnrollment: false,
      ),
    ];

    _user = const UserProfile(
      id: 'u1',
      name: 'Raphael',
      modalities: mockModalities,
    );
    _currentModality = mockModalities.firstWhere(
      (m) => m.activeEnrollment,
      orElse: () => mockModalities.first,
    );

    _lessonsThisMonth = 12;
    _lessonsGoal = 16;

    // Faturas mock
    _invoices
      ..clear()
      ..addAll([
        Invoice(
          id: 'i1',
          monthLabel: 'Ago/2025',
          dueDate: DateTime(2025, 8, 10),
          amount: 199.90,
          status: InvoiceStatus.paid,
        ),
        Invoice(
          id: 'i2',
          monthLabel: 'Set/2025',
          dueDate: DateTime(2025, 9, 10),
          amount: 199.90,
          status: InvoiceStatus.open,
        ),
        Invoice(
          id: 'i3',
          monthLabel: 'Out/2025',
          dueDate: DateTime(2025, 10, 10),
          amount: 209.90,
          status: InvoiceStatus.open,
        ),
        Invoice(
          id: 'i4',
          monthLabel: 'Jul/2025',
          dueDate: DateTime(2025, 7, 10),
          amount: 189.90,
          status: InvoiceStatus.overdue,
        ),
      ]);

    notifyListeners();
  }

  void setCurrentModality(Modality m) {
    _currentModality = m;
    notifyListeners();
  }

  void markInvoicePaid(String id) {
    final idx = _invoices.indexWhere((e) => e.id == id);
    if (idx != -1) {
      _invoices[idx].status = InvoiceStatus.paid;
      notifyListeners();
    }
  }
}
