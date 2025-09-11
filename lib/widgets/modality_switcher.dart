import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../models/modality.dart';

class ModalitySwitcher extends StatelessWidget {
  const ModalitySwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final modalities = state.user?.modalities ?? const <Modality>[];
    final current = state.currentModality;

    if (modalities.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (_, i) {
          final m = modalities[i];
          final selected = current?.id == m.id;
          return ChoiceChip(
            selected: selected,
            label: Text(m.name),
            onSelected: (_) => context.read<AppState>().setCurrentModality(m),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: modalities.length,
      ),
    );
  }
}
