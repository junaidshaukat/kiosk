import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ApiProvider extends ChangeNotifier {
  final BuildContext context;
  late ConnectivityProvider connectivity;
  late PreferenceProvider preference;

  ApiProvider(this.context) {
    preference = context.read<PreferenceProvider>();
    connectivity = context.read<ConnectivityProvider>();
  }

  String get trace {
    final stackTrace = StackTrace.current;
    final frames = stackTrace.toString().split('\n');

    if (frames.length > 1) {
      final callerFrame = frames[1].trim();
      final regex = RegExp(r'#\d+\s+(\S+)\.(\S+)\s+\(.*\)');
      final match = regex.firstMatch(callerFrame);

      if (match != null) {
        final className = match.group(1);
        final methodName = match.group(2);
        return "$className::$methodName";
      } else {
        return "$runtimeType::unknown";
      }
    } else {
      return "$runtimeType::unknown";
    }
  }

  dioException(model, DioException error) {
    String? message;
    String? messageDetails;
    List<String> errors = [];

    Response? response = error.response;
    if (response != null) {
      dynamic data = response.data;
      if (data is Map) {
        if (data.containsKey('message')) {
          message = data['message'];
        } else {
          message = error.response?.statusMessage;
        }

        if (data.containsKey('messageDetails')) {
          dynamic temp = data['messageDetails'];

          if (temp is String) {
            messageDetails = temp;
          }

          if (temp is List) {
            if (temp.isNotEmpty) {
              messageDetails =
                  "$this\n${temp.asMap().entries.map((entry) => "\u2022 ${entry.value}").join('\n')}";
            }
          }

          if (temp is Map) {
            if (temp.isNotEmpty) {
              messageDetails =
                  "$this\n${temp.entries.map((entry) => "\u2022 ${entry.value}").join('\n')}";
            }
          }
        }

        if (data.containsKey('errors')) {
          dynamic temp = data['errors'];

          if (temp is Map) {
            temp.forEach((key, value) {
              if (value is List) {
                for (var e in value) {
                  errors.add(e.toString());
                }
              }
            });
          }

          errors.sort((a, b) => a.length.compareTo(b.length));
          messageDetails = errors.map((e) => "\u2022 $e").join('\n');
        }

        message ??= error.message ?? 'unknown_error'.tr;

        messageDetails ??= 'unknown_error'.tr;

        throw model.copyWith(
          message: message,
          messageDetails: messageDetails,
        );
      }

      throw model.copyWith(
        message: 'unknown_error'.tr,
        messageDetails: response.statusMessage,
      );
    }
    throw CustomException(error.message);
  }

  Dio get dio {
    Dio client = Dio();

    client.options.baseUrl = preference.baseUrl;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    // if (preference.auth.token != null) {
    //   headers.addAll({'Authorization': "Bearer ${preference.auth.token}"});
    // }

    client.options.headers = headers;

    client.interceptors.add(
      LogInterceptor(
        request: false,
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (o) => console.debug(o.toString(), 'Api'),
      ),
    );

    return client;
  }

  Future<dynamic> get({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (!connectivity.isConnected) {
        throw NoInternetException();
      }

      Response response = await dio.get(
        data: data,
        path.hostname,
        queryParameters: query,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers, responseType: responseType),
      );

      if (response.statusCode! == 401) {
        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        return model.factory(response.data, response: response);
      } else {
        throw response.data != null
            ? model.factory(response.data, response: response)
            : CustomException();
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      rethrow;
    } on UnauthorizedException catch (error) {
      console.error(error, trace);
      rethrow;
    } on CustomException catch (error) {
      console.error(error, trace);
      rethrow;
    } on DioException catch (error) {
      console.error(error, trace);
      throw dioException(model, error);
    } catch (error) {
      console.error(error, trace);
      rethrow;
    }
  }

  Future<dynamic> post({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (!connectivity.isConnected) {
        throw NoInternetException();
      }

      Response response = await dio.post(
        data: data,
        path.hostname,
        queryParameters: query,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers, responseType: responseType),
      );

      if (response.statusCode! == 401) {
        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        return model.factory(response.data, response: response);
      } else {
        throw response.data != null
            ? model.factory(response.data, response: response)
            : CustomException();
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      rethrow;
    } on UnauthorizedException catch (error) {
      console.error(error, trace);
      rethrow;
    } on CustomException catch (error) {
      console.error(error, trace);
      rethrow;
    } on DioException catch (error) {
      console.error(error, trace);
      throw dioException(model, error);
    } catch (error) {
      console.error(error, trace);
      rethrow;
    }
  }

  Future<dynamic> delete({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (!connectivity.isConnected) {
        throw NoInternetException();
      }

      Response response = await dio.delete(
        data: data,
        path.hostname,
        queryParameters: query,
        cancelToken: cancelToken,
        options: Options(headers: headers, responseType: responseType),
      );

      if (response.statusCode! == 401) {
        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        return model.factory(response.data, response: response);
      } else {
        throw response.data != null
            ? model.factory(response.data, response: response)
            : CustomException();
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      rethrow;
    } on UnauthorizedException catch (error) {
      console.error(error, trace);
      rethrow;
    } on CustomException catch (error) {
      console.error(error, trace);
      rethrow;
    } on DioException catch (error) {
      console.error(error, trace);
      throw dioException(model, error);
    } catch (error) {
      console.error(error, trace);
      rethrow;
    }
  }

  Future<dynamic> put({
    Object? data,
    dynamic model,
    String path = '',
    CancelToken? cancelToken,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (!connectivity.isConnected) {
        throw NoInternetException();
      }

      Response response = await dio.put(
        data: data,
        path.hostname,
        queryParameters: query,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers, responseType: responseType),
      );

      if (response.statusCode! == 401) {
        await preference.clear();
        throw UnauthorizedException();
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        return model.factory(response.data, response: response);
      } else {
        throw response.data != null
            ? model.factory(response.data, response: response)
            : CustomException();
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      rethrow;
    } on UnauthorizedException catch (error) {
      console.error(error, trace);
      rethrow;
    } on CustomException catch (error) {
      console.error(error, trace);
      rethrow;
    } on DioException catch (error) {
      console.error(error, trace);
      throw dioException(model, error);
    } catch (error) {
      console.error(error, trace);
      rethrow;
    }
  }

  Future<void> downloadFile({
    Object? data,
    dynamic model,
    String path = '',
    required String url,
    required String savePath,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    ResponseType? responseType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    String lengthHeader = Headers.contentLengthHeader,
  }) async {
    try {
      if (!connectivity.isConnected) {
        throw NoInternetException();
      }

      await dio.download(
        path,
        savePath,
        data: data,
        queryParameters: query,
        cancelToken: cancelToken,
        lengthHeader: lengthHeader,
        deleteOnError: deleteOnError,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers, responseType: responseType),
      );
    } on NoInternetException catch (error) {
      console.error(error, trace);
      rethrow;
    } on DioException catch (error) {
      console.error(error, trace);
      throw dioException(null, error);
    } catch (error) {
      console.error(error, trace);
      rethrow;
    }
  }
}
