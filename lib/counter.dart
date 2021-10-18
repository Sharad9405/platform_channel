import 'package:flutter/services.dart';

/// This class includes implementation of two platform methods [increment],
/// and [decrement] which are used to increment and decrement value
/// of count respectively.
class Counter {
  /// Creates a [MethodChannel] with the specified name to invoke platform method.
  /// In order to communicate across platforms, the name of MethodChannel
  /// should be same on native and dart side.
  static MethodChannel _methodChannel =
      const MethodChannel('methodChannelDemo');

  /// This method is responsible to increment and return the value of count.

  static Future<int> increment({int counterValue}) async {
    final result = await _methodChannel
        .invokeMethod<int>('increment', {'count': counterValue});
    return result;
  }

  /// This method is responsible to decrement and return the value of count.
  static Future<int> decrement({int counterValue}) async {
    final result =
        await _methodChannel.invokeMethod('decrement', {'count': counterValue});
    return result;
  }
}
