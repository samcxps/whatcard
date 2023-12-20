import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whatcard/app/friends/friends.dart';

import 'package:whatcard/app/index.dart';
import 'package:whatcard/models/game.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

final _key = GlobalKey<NavigatorState>();

bool isOnLoginScreen(String currentLocation) {
  final isOnSplash = currentLocation == '/splash';
  final isOnLogin = currentLocation == '/login';
  final isOnVerify = currentLocation == '/verify';
  final isOnOnboard = currentLocation == '/onboard';

  return isOnSplash || isOnLogin || isOnVerify || isOnOnboard;
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(firebaseAuthUser);
  final defaultDisplayName =
      ref.watch(sharedPreferencesServiceProvider).getDefaultDisplayName();

  return GoRouter(
      initialLocation: '/login',
      debugLogDiagnostics: true,
      navigatorKey: _key,
      routes: [
        // Login + onboarding stuff
        // Does not render navbar
        GoRoute(
          name: "SplashPage",
          path: '/splash',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          name: "LoginPage",
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          name: "VerifyPhonePage",
          path: '/verify',
          builder: (context, state) => VerifyPhonePage(),
        ),
        GoRoute(
          name: "OnboardingPage",
          path: '/onboard',
          builder: (context, state) => const OnboardingPage(),
        ),

        // ShellRoute contains all of our "Signed In" views
        // Renders navbar as well as correct page
        ShellRoute(
          builder: (context, state, child) {
            return BottomBar(child: child);
          },
          routes: [
            // Friends Stuff
            // Settings stuff
            GoRoute(
              name: 'FriendsPage',
              path: '/friends',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const FriendsPage(),
              ),
            ),

            // Home stuff + game stuff
            GoRoute(
              name: 'HomePage',
              path: '/home',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomePage(),
              ),
              routes: [
                GoRoute(
                  name: 'GamePage',
                  path: 'game',
                  builder: (context, state) =>
                      GamePage(gameId: state.extra as String),
                ),
                GoRoute(
                  name: 'CreateGamePage',
                  path: 'create-game',
                  builder: (context, state) => const CreateGamePage(),
                ),
                GoRoute(
                  name: 'JoinGamePage',
                  path: 'join-game',
                  builder: (context, state) => const JoinGamePage(),
                ),
              ],
            ),

            // Settings stuff
            GoRoute(
              name: 'SettingsPage',
              path: '/settings',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const SettingsPage(),
              ),
            ),
          ],
        ),
      ],
      redirect: ((context, state) {
        // If our async state is loading, don't perform redirects, yet
        if (authState.isLoading || authState.hasError) return null;

        // Get users auth state and default display name
        final isFirebaseAuthed = authState.valueOrNull != null;

        // Check if user is on a login/onboarding screen
        final isOnLogin = isOnLoginScreen(state.location);

        // If on a login screen
        if (isOnLogin) {
          // Stay on login screen if not authenticated
          if (!isFirebaseAuthed) return null;

          // Check if user has set a default display name in shared prefs
          //  if not, send to onboarding page to set default display name
          //  else, send to home
          if (defaultDisplayName == null && isFirebaseAuthed) {
            return '/onboard';
          } else {
            return '/home';
          }
        }

        // If not authed, redirect to login
        return isFirebaseAuthed ? null : "/login";
      }));
});

class BottomBar extends HookConsumerWidget {
  const BottomBar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static const tabs = ['/friends', '/home', '/settings'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: GNav(
        selectedIndex: 1,
        onTabChange: (index) => context.go(tabs[index]),
        backgroundColor: WhatCardTheme.of(context).primaryBackground,
        color: const Color(0x8A000000),
        activeColor: Colors.black,
        tabBackgroundColor: const Color(0x00000000),
        tabBorderRadius: 100,
        tabMargin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        gap: 5,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        duration: const Duration(milliseconds: 500),
        haptic: false,
        tabs: const [
          GButton(
            icon: Icons.people,
            text: 'Friends',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.home,
            text: 'Games',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
