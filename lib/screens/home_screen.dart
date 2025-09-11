import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/modality_switcher.dart';
import '../widgets/metric_card.dart';
import '../widgets/dojo_app_bar.dart';
import '../widgets/header_hero.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<AppState>().loadMock(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    return Scaffold(
      appBar: DojoAppBar(
        title: state.currentModality?.name ?? 'BlackBeltHub',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderHero(),
            const SizedBox(height: 8),
            const ModalitySwitcher(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: const [
                  /*                   MetricCard(
                    title: 'Status da Matrícula',
                    value: 'Ativa',
                    caption: 'Pagamento em dia',
                    icon: Icons.verified,
                  ),
                  MetricCard(
                    title: 'Aulas no Mês',
                    value: '12',
                    caption: 'Meta: 16',
                    icon: Icons.calendar_month,
                  ), */
                  MetricCard(
                    title: 'Próxima Aula',
                    value: 'Qui • 19:30',
                    caption: 'Professor(a): Sensei Nakamura',
                    icon: Icons.schedule,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
