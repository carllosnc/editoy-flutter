import 'package:editoy/features/editing_page.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '/imports.dart';

final router = GoRouter(
  routes: [
    if (WelcomePreference.value)
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const WelcomePage();
        },
      ),
    GoRoute(
      path: WelcomePreference.value ? '/home' : '/',
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/editing',
      builder: (context, state) {
        final XFile file = state.extra as XFile;
        return EditingPage(file: file);
      },
    ),
  ],
);
