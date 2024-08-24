import 'package:flutter/material.dart';

import '/core/app_export.dart';

/// The [Props] class represents a state container with various status states
/// and associated data. It includes methods for setting different states,
/// and provides utilities to manage state transitions and track errors.
class Props {
  /// The current state of the instance.
  /// Possible values:
  /// - 0: None
  /// - 1: Loading
  /// - 2: Success
  /// - 3: Error
  /// - 4: Processing
  /// - 5: Sending
  /// - 6: Resending
  /// - 7: Uploading
  /// - 8: Downloading
  /// - 9: Signin
  /// - 10: Biometric
  /// - 11: Creating
  /// - 12: Deleting
  /// - 13: Updating
  int state;

  /// The data associated with the current state.
  Object? data;

  /// The error message if the state is [isError].
  String? error;

  /// Additional links or metadata associated with the current state.
  Object? links;

  /// Initial data, used to reset the [data] when necessary.
  Object? initialData;

  /// Constructs a [Props] instance with the specified initial state and data.
  Props({
    this.state = 0,
    this.error,
    this.data,
    this.links,
    this.initialData,
  });

  /// Retrieves a string representation of the current stack trace, providing
  /// information about the class and method where the trace was called.
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

  /// Checks if the current state is 'None'.
  ///
  /// state ==   0
  bool get isNone => state == 0;

  /// Sets the state to 'None' with optional parameters to update the state,
  /// error, data, and links.
  void setNone({
    int currentState = 0,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Loading'.
  ///
  /// state ==  1
  bool get isLoading => state == 1;

  /// Sets the state to 'Loading' with optional parameters to update the state,
  /// error, data, and links.
  void setLoading({
    int currentState = 1,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Success'.
  ///
  /// state ==  2
  bool get isSuccess => state == 2;

  /// Sets the state to 'Success' with optional parameters to update the state,
  /// error, data, and links.
  void setSuccess({
    int currentState = 2,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Error'.
  ///
  /// state ==  3
  bool get isError => state == 3;

  /// Sets the state to 'Error' with optional parameters to update the state,
  /// error, data, and links. Logs the error and stack trace.
  void setError({
    int currentState = 3,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    links = currentLinks;
    data = currentData ?? initialData;
    error = currentError ?? "something_went_wrong";
    console.error(error, trace);
  }

  /// Checks if the current state is 'Processing'.
  ///
  /// state ==  4
  bool get isProcessing => state == 4;

  /// Sets the state to 'Processing' with optional parameters to update the state,
  /// error, data, and links.
  void setProcessing({
    int currentState = 4,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Sending'.
  ///
  /// state ==  5
  bool get isSending => state == 5;

  /// Sets the state to 'Sending' with optional parameters to update the state,
  /// error, data, and links.
  void setSending({
    int currentState = 5,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Resending'.
  ///
  /// state ==  6
  bool get isResending => state == 6;

  /// Sets the state to 'Resending' with optional parameters to update the state,
  /// error, data, and links.
  void setResending({
    int currentState = 6,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Uploading'.
  ///
  /// state ==  7
  bool get isUploading => state == 7;

  /// Sets the state to 'Uploading' with optional parameters to update the state,
  /// error, data, and links.
  void setUploading({
    int currentState = 7,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Downloading'.
  ///
  /// state ==  8
  bool get isDownloading => state == 8;

  /// Sets the state to 'Downloading' with optional parameters to update the state,
  /// error, data, and links.
  void setDownloading({
    int currentState = 8,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Signin'.
  ///
  /// state ==  9
  bool get isSignin => state == 9;

  /// Sets the state to 'Signin' with optional parameters to update the state,
  /// error, data, and links.
  void setSignin({
    int currentState = 9,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Biometric'.
  ///
  /// state ==  10
  bool get isBiometric => state == 10;

  /// Sets the state to 'Biometric' with optional parameters to update the state,
  /// error, data, and links.
  void setBiometric({
    int currentState = 10,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Creating'.
  ///
  /// state ==  11
  bool get isCreating => state == 11;

  /// Sets the state to 'Creating' with optional parameters to update the state,
  /// error, data, and links.
  void setCreating({
    int currentState = 11,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Deleting'.
  ///
  /// state ==  12
  bool get isDeleting => state == 12;

  /// Sets the state to 'Deleting' with optional parameters to update the state,
  /// error, data, and links.
  void setDeleting({
    int currentState = 12,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Checks if the current state is 'Updating'.
  ///
  /// state ==  13
  bool get isUpdating => state == 13;

  /// Sets the state to 'Updating' with optional parameters to update the state,
  /// error, data, and links.
  void setUpdating({
    int currentState = 13,
    String? currentError,
    Object? currentData,
    Object? currentLinks,
  }) {
    state = currentState;
    error = currentError;
    links = currentLinks;
    data = currentData ?? initialData;
  }

  /// Clears the current state, resetting the data to [initialData] or the provided [objct].
  void clear({Object? objct}) {
    state = -1;
    error = null;
    data = objct ?? initialData;
  }

  ///
  Widget widget() {
    switch (state) {
      case 0:
        return const SizedBox();
      case 1:
        return const SizedBox();
      case 2:
        return const SizedBox();
      case 3:
        return const SizedBox();
      case 4:
        return const SizedBox();
      case 5:
        return const SizedBox();
      case 6:
        return const SizedBox();
      case 7:
        return const SizedBox();
      case 8:
        return const SizedBox();
      case 9:
        return const SizedBox();
      case 10:
        return const SizedBox();
      case 11:
        return const SizedBox();
      case 12:
        return const SizedBox();
      case 13:
        return const SizedBox();
      case 14:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  /// Converts the [Props] instance into a JSON map representation.
  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'error': error,
      'data': data,
      'links': links,
      'initialData': initialData,
    };
  }
}
