import '/core/app_export.dart';

extension Assets on String {
  String copyWith(dynamic message) {
    if (message is String) {
      return "$this\n$message";
    }

    if (message is List) {
      if (message.isNotEmpty) {
        return "$this\n${message.asMap().entries.map((entry) => "\u2022 ${entry.value}").join('\n')}";
      }

      return this;
    }

    return this;
  }

  /// hostname
  String get hostname {
    return replaceFirst('{{hostname}}', '');
  }

  /// fonts
  String get font {
    return 'assets/fonts/$this';
  }

  /// icons
  String get icon {
    return 'assets/icons/$this';
  }

  /// lottie
  String get lottie {
    return 'assets/lottie/$this';
  }

  /// network images
  String get network {
    return this;
  }

  /// image
  String get image {
    return 'assets/images/$this';
  }

  /// gif
  String get gif {
    return 'assets/gif/$this';
  }

  ///ttf
  String get ttf {
    return '$this.ttf';
  }

  ///svg
  String get svg {
    return '$this.svg';
  }

  ///png
  String get png {
    return '$this.png';
  }

  /// jpg
  String get jpg {
    return '$this.jpg';
  }

  /// json
  String get json {
    return '$this.json';
  }

  DateTime dateParse([
    String pattern = 'yyyy/MM/dd',
    String? locale,
  ]) {
    DateFormat inputFormat = DateFormat(pattern, locale);
    return inputFormat.parse(this);
  }
}

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  String format({
    String pattern = dateTimeFormatPattern,
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}
