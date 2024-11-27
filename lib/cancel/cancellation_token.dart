import 'package:flutter/material.dart';
import 'package:sample_flutter/cancel/exceptions/fetch_cancelled_exception.dart';

class CancellationToken {
  bool _isCancelled = false;
  final List<VoidCallback> _listeners = [];

  bool get isCancelled => _isCancelled;

  void cancel() {
    if (!_isCancelled) {
      _isCancelled = true;
      for (var listener in _listeners) {
        listener();
      }
    }
  }

  void throwIfCancelled() {
    if (_isCancelled) {
      throw FetchCancelledException();
    }
  }

  void register(VoidCallback callback) {
    if (_isCancelled) {
      callback();
    } else {
      _listeners.add(callback);
    }
  }
}

class CancellationTokenSource {
  final CancellationToken token = CancellationToken();

  void cancel() {
    token.cancel();
  }
}
