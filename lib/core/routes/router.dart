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
    GoRoute(
      path: '/camera',
      builder: (context, state) {
        final ImageCallback callback = state.extra as ImageCallback;
        return CameraPage(callback: callback);
      },
    ),
    GoRoute(
      path: '/grid',
      builder: (context, state) {
        return const GridPage();
      },
    ),
  ],
);
