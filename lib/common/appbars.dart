import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatcard/theme.dart';

AppBar getLoginAppBar(
  BuildContext context, {
  allowBack = false,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: WhatCardTheme.of(context).primaryBackground,
    automaticallyImplyLeading: false,
    leading: allowBack
        ? IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              color: WhatCardTheme.of(context).primaryText,
              size: 30,
            ),
            color: WhatCardTheme.of(context).primaryText,
            onPressed: () => GoRouter.of(context).pop(),
            // size: 30,
          )
        : null,
    title: Row(
      children: [
        Text(
          'WhatCard',
          style: WhatCardTheme.of(context).title1,
        ),
      ],
    ),
  );
}
