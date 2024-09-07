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

  String get remove {
    if (isNotEmpty) {
      String str = substring(0, length - 1);
      if (str.isEmpty) {
        return '0';
      } else {
        return str;
      }
    } else {
      return '0';
    }
  }

  String get isFloat {
    if (contains('.')) {
      return this;
    } else {
      return '$this.';
    }
  }

  String get number {
    if (isNotEmpty) {
      String str = replaceFirst(RegExp(r'^0+'), '');
      if (str.isEmpty) {
        return '0';
      } else {
        return str;
      }
    } else {
      return '0';
    }
  }

  String concat(String b) {
    return '$this$b';
  }

  DateTime format([
    String pattern = 'yyyy/MM/dd',
    String? locale,
  ]) {
    final dateFormat = DateFormat(pattern, locale);
    return dateFormat.parse(this);
  }
}

extension DateTimes on DateTime {
  String format([
    String pattern = 'yyyy/MM/dd',
    String? locale,
  ]) {
    final dateFormat = DateFormat(pattern, locale);
    return dateFormat.format(this);
  }

  bool get isFriday {
    return weekday == DateTime.friday;
  }

  String get todayDDMM {
    final day = DateFormat('d').format(this);
    final month = DateFormat('MMMM').format(this);

    // Construct the date string as "Today, 12 September"
    final formattedDate = 'Today, $day $month';

    // Return the formatted string
    return formattedDate;
  }
}
