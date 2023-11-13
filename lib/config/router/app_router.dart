import 'package:forms_app/presentation/screens.dart';
import 'package:forms_app/presentation/screens/bloc_counter_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitsCounterScreen()
    ),
    GoRoute(
      path: '/bloc-counter',
      builder: (context, state) => const BlockCounterScreen()
    )
]);
