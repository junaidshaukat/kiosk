import 'package:flutter/material.dart';

export 'package:dio/dio.dart';
export 'package:hive/hive.dart';
export 'package:intl/intl.dart';
export 'package:lottie/lottie.dart' hide Marker;
export 'package:provider/provider.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:image_picker/image_picker.dart';
export 'package:video_player/video_player.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:intl/date_symbol_data_local.dart';
export 'package:path_provider/path_provider.dart';
export 'package:pin_code_fields/pin_code_fields.dart' hide AnimationType;
export 'package:syncfusion_flutter_gauges/gauges.dart';
export 'package:dropdown_button2/dropdown_button2.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';

export './utils/export.dart';
export './services/export.dart';
export './providers/export.dart';

export '/theme/export.dart';
export '/routes/export.dart';
export '/widgets/export.dart';
export '/localization/export.dart';
export '/presentation/export.dart';

GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
    GlobalKey<ScaffoldMessengerState>();

late BuildContext buildContext;
