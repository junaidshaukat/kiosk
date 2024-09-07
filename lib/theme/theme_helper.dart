import 'package:flutter/material.dart';
import '/core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
/// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();
// A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };
// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 6,
        space: 6,
        color: appTheme.black900,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w900,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w300,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w900,
        color: appTheme.gray600,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: appTheme.gray600,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        color: appTheme.gray600,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w900,
        color: appTheme.gray600,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: appTheme.gray600,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        color: appTheme.gray600,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w900,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w900,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        color: appTheme.gray600,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF007C16),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFFB60000),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  ///
  Color get primary => const Color(0XFF007C16);

  /// White
  Color get white => const Color(0XFFFFFFFF);
  Color get white800 => const Color(0xFFF0F5F8);

  /// Black
  Color get black900 => const Color(0XFF000000);

  /// BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);
  Color get blue53 => const Color(0xFF3B3D53);

  /// Gray
  Color get gray100 => const Color(0XFFF3F4F4);
  Color get gray200 => const Color(0XFFE8E6EA);
  Color get gray600 => const Color(0XFF79797A);
  Color get gray60001 => const Color(0XFF858585);

  /// Green
  Color get green900 => const Color(0XFF008000);
  Color get green228 => const Color(0xFF00E228);
  Color get green16 => const Color(0xFF007C16);
  Color get green22 => const Color(0xFF089922);

  /// Lime
  Color get lime800 => const Color(0XFFBC903E);
  Color get lime228 => const Color(0xFF70ADF0);
  Color get lime16 => const Color(0xFF237BDD);

  /// Yellow
  Color get yellow800 => const Color(0XFFDB9E3B);
  Color get yellow288 => const Color(0xFFF9C28A);
  Color get yellow16 => const Color(0xFFF78008);

  Color get unselect => const Color(0XFFD9D9D9);

  Color get pale => const Color(0XFFE0F1F5);
}
