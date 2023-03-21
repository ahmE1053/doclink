import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:doclink/core/providers/auth_provider.dart';
import 'package:doclink/core/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/screen_export.dart';
import '../../presentation/screens/auth_page_view/auth_background_screen.dart';
import '../../presentation/screens/splash_screen.dart';

part 'router_provider.freezed.dart';

@freezed
class RouterHandler with _$RouterHandler {
  const factory RouterHandler({
    required String homePagePath,
    required String appointmentsPagePath,
    required String messagesPagePath,
    required String profilePagePath,
    required int oldIndex,
  }) = _RouterHandler;
}

class RouterHandlerNotifier extends Notifier<RouterHandler> {
  late GoRouter goRouter;
  final convexBottomBarKey = GlobalKey<ConvexAppBarState>();
  @override
  RouterHandler build() {
    goRouter = ref.watch(goRouterProvider);
    goRouter.removeListener(() {});
    Future(() {
      goRouter.addListener(
        () {
          saveOldPageState(state.oldIndex);
        },
      );
    });
    if (ref.exists(routerHandlerProvider)) {
      return state;
    }
    return const RouterHandler(
      homePagePath: '/home',
      appointmentsPagePath: '/appointments',
      messagesPagePath: '/messages',
      profilePagePath: '/profile',
      oldIndex: 0,
    );
  }

  void enterNewScreenFromNavBar(
    int index,
  ) {
    if (index == 0) {
      if (state.oldIndex == index) {
        ref.invalidate(testPageTextField);
        state = state.copyWith(homePagePath: '/home');
        goRouter.go(state.homePagePath);
        return;
      }

      saveOldPageState(index);
      goRouter.go(state.homePagePath);
    } else if (index == 1) {
      if (state.oldIndex == index) {
        state = state.copyWith(appointmentsPagePath: '/appointments');
        return;
      }
      saveOldPageState(index);
      goRouter.go(state.appointmentsPagePath);
    } else if (index == 2) {
      if (state.oldIndex == index) {
        state = state.copyWith(messagesPagePath: '/messages');
        return;
      }

      saveOldPageState(index);
      goRouter.go(state.messagesPagePath);
    } else if (index == 3) {
      if (state.oldIndex == index) {
        state = state.copyWith(profilePagePath: '/profile');
        return;
      }

      saveOldPageState(index);
      goRouter.go(state.profilePagePath);
    }
  }

  void enterNewScreen(String newPath) {
    goRouter.go('${goRouter.location}/$newPath');
  }

  void saveOldPageState(int index) {
    if (state.oldIndex == 0) {
      state = state.copyWith(oldIndex: index, homePagePath: goRouter.location);
    } else if (state.oldIndex == 1) {
      state = state.copyWith(
          appointmentsPagePath: goRouter.location, oldIndex: index);
    } else if (state.oldIndex == 2) {
      state =
          state.copyWith(oldIndex: index, messagesPagePath: goRouter.location);
    } else if (state.oldIndex == 3) {
      state =
          state.copyWith(oldIndex: index, profilePagePath: goRouter.location);
    }
  }
}

final routerHandlerProvider =
    NotifierProvider<RouterHandlerNotifier, RouterHandler>(
  () => RouterHandlerNotifier(),
);

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation:
          ref.read(authenticationProvider) == null ? '/auth' : '/home',
      routes: routes,
    );
  },
);
final routes = [
  ShellRoute(
    pageBuilder: (context, state, child) => CustomTransitionPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: MainScreen(
        child: () => child,
      ),
    ),
    routes: [
      GoRoute(
        path: '/home',
        routes: [
          GoRoute(
            path: 'specialties',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SpecialitiesScreen()),
          ),
        ],
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/appointments',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: const AppointmentsScreen(),
        ),
      ),
      GoRoute(
        path: '/messages',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: const MessagesScreen(),
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: const ProfileScreen(),
        ),
      ),
    ],
  ),
  GoRoute(
    path: '/auth',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const AuthBackgroundScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          key: state.pageKey,
          child: child,
        );
      },
    ),
  ),
  GoRoute(
    path: '/splash',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const SplashScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          key: state.pageKey,
          child: child,
        );
      },
    ),
  ),
];
