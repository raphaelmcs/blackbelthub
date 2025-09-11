import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import 'belt_badge.dart';

class HeaderHero extends StatelessWidget {
  const HeaderHero({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final cs = Theme.of(context).colorScheme;

    final name = state.user?.name ?? 'Aluno';
    final modality = state.currentModality?.name ?? '—';
    final belt = state.currentModality?.belt ?? '—';
    final lessons = state.lessonsThisMonth;
    final goal = state.lessonsGoal;
    final progress = state.monthProgress.isNaN ? 0.0 : state.monthProgress;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF121315), Color(0xFF1A0E12)],
        ),
        border: Border.all(color: cs.outline.withOpacity(.35)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá, $name',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    BeltBadge(beltName: belt),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '$belt • $modality',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.25),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: cs.outline.withOpacity(.35)),
                  ),
                  child: const Text(
                    'Matrícula Ativa',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 34,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today_outlined, size: 16),
                    label: const Text('Ver agenda'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: cs.outline),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      textStyle: const TextStyle(fontWeight: FontWeight.w700),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 96,
            width: 96,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 96,
                  width: 96,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: progress),
                    duration: const Duration(milliseconds: 650),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, _) {
                      return CircularProgressIndicator(
                        value: value,
                        strokeWidth: 8,
                        backgroundColor: cs.outline.withOpacity(.18),
                        valueColor: AlwaysStoppedAnimation(cs.primary),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$lessons/$goal',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'aulas',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
