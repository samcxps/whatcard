import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:whatcard/theme.dart';

enum InputDecorationType { large, small }

InputDecoration getTextInputDecoration(
  BuildContext context, {
  String? labelText,
  String? prefixText,
  variant = InputDecorationType.large,
}) =>
    InputDecoration(
      prefixText: prefixText,
      labelText: labelText,
      labelStyle: WhatCardTheme.of(context).bodyText1.override(
            fontFamily: WhatCardTheme.of(context).bodyText1Family,
            color: WhatCardTheme.of(context).primaryGray,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(WhatCardTheme.of(context).bodyText1Family),
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: WhatCardTheme.of(context).secondaryGray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: WhatCardTheme.of(context).secondaryGray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: variant == InputDecorationType.large
          ? const EdgeInsets.all(24)
          : const EdgeInsets.all(16),
    );
