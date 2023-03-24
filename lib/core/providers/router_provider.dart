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
  /*
  * This class is used to define the state of the four main sections of the app
  * because shellRouter of the GoRouter packages loses the state of the previous page
  * when navigating to a new page i created this class to obtain the last path that the user was in
  * in each section of the app
  * when the user opens the app all of them default to root paths of each section which are
  *   homePagePath: '/home',
      appointmentsPagePath: '/appointments',
      messagesPagePath: '/messages',
      profilePagePath: '/profile',
  * and if the user enters a sub-page of one of those sections and then used the
  * navigation bar to go to another page the string of the previous screen saves where he left
  * so when he return to the same section it navigates to where he left off
  * and of course there is some logic in another file to keep track of any text field or other related
  * stuff
  * */
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

  /*
  * this is the build method it is supposed to run only once during the initial run of the application
  * it initializes the main navigator of the app 'goRouter' with the value from the below goRouterProvider
  * this provider checks if the user is signed in or not to decide which page the app will open to
  * and the listener listens to navigation events that happen and saves the state of the previous page
  * */

  @override
  RouterHandler build() {
    goRouter = ref.watch(goRouterProvider);

    Future(() {
      goRouter.addListener(
        () {
          saveOldPageState(state.oldIndex);
        },
      );
    });

    return const RouterHandler(
      homePagePath: '/home',
      appointmentsPagePath: '/appointments',
      messagesPagePath: '/messages',
      profilePagePath: '/profile',
      oldIndex: 0,
    );
  }

  ///Used to handle navigation from nav bar. As mentioned it is used to save the state of
  ///the previous page. If the person presses on the same page that he is in it sends him back
  ///to the main section, deleting all the already saved state if there were any.
  void enterNewScreenFromNavBar(
    int index,
  ) {
    switch (index) {
      case (0):
        if (state.oldIndex == index) {
          ref.invalidate(homeSearchTextField);
          state = state.copyWith(homePagePath: '/home');
          goRouter.go(state.homePagePath);
          return;
        }

        saveOldPageState(index);
        goRouter.go(state.homePagePath);
        saveOldPageState(index);
        goRouter.go(state.homePagePath);
        break;
      case (1):
        if (state.oldIndex == index) {
          state = state.copyWith(appointmentsPagePath: '/appointments');
          return;
        }
        saveOldPageState(index);
        goRouter.go(state.appointmentsPagePath);
        break;
      case (2):
        if (state.oldIndex == index) {
          state = state.copyWith(messagesPagePath: '/messages');
          return;
        }

        saveOldPageState(index);
        goRouter.go(state.messagesPagePath);
        break;
      case (3):
        if (state.oldIndex == index) {
          state = state.copyWith(profilePagePath: '/profile');
          return;
        }

        saveOldPageState(index);
        goRouter.go(state.profilePagePath);
    }
  }

  ///Handles normal navigation between pages in the same section
  void enterNewScreen(String newPath) {
    goRouter.go('${goRouter.location}/$newPath');
  }

  ///Saves the path of the page that the user was in before navigation
  ///If the page had any state like a text field or something there are
  ///providers that already keep track of it, only losing this state
  ///when the user pops the screen or press the button of the same screen
  ///that he is in the nav bar
  void saveOldPageState(int index) {
    switch (state.oldIndex) {
      case (0):
        state =
            state.copyWith(oldIndex: index, homePagePath: goRouter.location);
        break;
      case (1):
        state = state.copyWith(
            appointmentsPagePath: goRouter.location, oldIndex: index);
        break;
      case (2):
        state = state.copyWith(
            oldIndex: index, messagesPagePath: goRouter.location);
        break;
      case (3):
        state =
            state.copyWith(oldIndex: index, profilePagePath: goRouter.location);
        break;
    }
  }
}

///Notifier provider holding the state of the navigation class.
final routerHandlerProvider =
    NotifierProvider<RouterHandlerNotifier, RouterHandler>(
  () => RouterHandlerNotifier(),
);

///Main GoRouter provider that controls the navigation in the app.
///It checks first if the user is singed in or not, then sends him to the
///main or authentication screen.
final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authInfo = ref.read(authenticationProvider);
    print(authInfo);
    return GoRouter(
      initialLocation: authInfo == null ? '/auth' : '/home',
      routes: routes,
    );
  },
);

/// routes of the app
final routes = [
  ShellRoute(
    pageBuilder: (context, state, child) => CustomTransitionPage(
      transitionsBuilder: (__, animation, _, child) => FadeTransition(
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
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (__, animation, _, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: const HomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'specialties',
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionsBuilder: (__, animation, _, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: const SpecialitiesScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/appointments',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (__, animation, _, child) {
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
          transitionsBuilder: (__, animation, _, child) {
            return FadeTransition(
              opacity: animation,
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
          transitionsBuilder: (__, animation, _, child) {
            return FadeTransition(
              opacity: animation,
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
      transitionsBuilder: (__, animation, _, child) {
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
      transitionsBuilder: (__, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          key: state.pageKey,
          child: child,
        );
      },
    ),
  ),
];
