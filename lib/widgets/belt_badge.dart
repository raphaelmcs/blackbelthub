import 'package:flutter/material.dart';

class BeltBadge extends StatelessWidget {
  final String
  beltName; // e.g., "Faixa Branca", "Azul", "Roxa", "Marrom", "Preta"
  const BeltBadge({super.key, required this.beltName});

  Color _colorForBelt(String b) {
    final name = b.toLowerCase();
    if (name.contains('preta') || name == 'preta')
      return const Color(0xFF0E0E0E);
    if (name.contains('marrom')) return const Color(0xFF6B4423);
    if (name.contains('roxa')) return const Color(0xFF6D28D9);
    if (name.contains('azul')) return const Color(0xFF2563EB);
    if (name.contains('branca') || name.contains('branco'))
      return const Color(0xFFE5E7EB);
    if (name.contains('coral') || name.contains('vermelha'))
      return const Color(0xFFB91C1C);
    return const Color(0xFF9CA3AF); // default/unknown
  }

  @override
  Widget build(BuildContext context) {
    final c = _colorForBelt(beltName);
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24, width: 1),
      ),
    );
  }
}
