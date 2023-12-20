import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

import 'package:whatcard/common/index.dart';

class FriendsPage extends ConsumerWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultDisplayName =
        ref.watch(sharedPreferencesServiceProvider).getDefaultDisplayName();

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: WhatCardTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Friends',
          style: WhatCardTheme.of(context).title2.override(
                fontFamily: WhatCardTheme.of(context).title2Family,
                color: Colors.black,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(WhatCardTheme.of(context).title2Family),
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: MainLayout(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
