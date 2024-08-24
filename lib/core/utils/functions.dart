import 'dart:math';
import '/core/app_export.dart';

class Functions {
  String round(number, [String? pattern = "0.00", String? locale]) {
    String val = NumberFormat(pattern, locale).format(number);
    return val;
  }

  String mmYY(dynamic month, dynamic year) {
    return DateFormat('MMMM, yyyy').format(DateTime(
      int.parse('$year'),
      int.parse('$month'),
    ));
  }

  List<num> get fiveYears {
    num currentYear = DateTime.now().year;
    return List.generate(5, (index) {
      return currentYear - index;
    });
  }

  List<num> get monthNumbers {
    return List.generate(12, (i) {
      return i + 1;
    });
  }

  List<num> numbers([int length = 20]) {
    return List.generate(length, (i) {
      return i + 1;
    });
  }

  /// Returns the abbreviated month name (e.g., 'Jan', 'Feb', etc.)
  /// for a given month number.
  ///
  /// [month] should be in the range 1-12, where 1 corresponds to January
  /// and 12 corresponds to December. If the [month] is out of range,
  /// it returns 'Invalid month'.
  String getMMM(num month) {
    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    DateTime date = DateTime(0, int.parse("$month"));
    return DateFormat.MMM().format(date);
  }

  String getMonthName(int month) {
    const List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    // Ensure the monthNumber is valid (1-12)
    if (month < 1 || month > 12) {
      throw ArgumentError('Invalid month number: $month');
    }

    return months[month - 1];
  }

  String get randomString {
    final random = Random();
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
    return List.generate(12, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  String symbolic(dynamic donation, String? symbol) {
    String format(val) {
      return val.toString().replaceAll(',', '');
    }

    String temp = '';
    if (symbol != null) {
      temp += symbol;
    }

    if (donation != null) {
      temp += fns.round(num.parse(format(donation)));
    }

    return temp;
  }

  String messageDetails(data) {
    if (data is String) {
      return data;
    }

    if (data is List) {
      if (data.isNotEmpty) {
        return "$this\n${data.asMap().entries.map((entry) => "\u2022 ${entry.value}").join('\n')}";
      }
      return 'unknown_error'.tr;
    }

    return 'unknown_error'.tr;
  }

  List<int> pageSize(int n) {
    return List<int>.generate(5, (index) => n * (index + 1));
  }

  List<String> get orderBy {
    return ['asc', 'desc'];
  }

  DateTime? datetime(date) {
    if (date != null) {
      return DateTime.parse(date);
    }
    return null;
  }
}

Functions fns = Functions();
