import "package:flutter/foundation.dart";
import "package:logger/logger.dart";

abstract class Log {
  void debug({required String title, required dynamic message});
}

class LogImpl extends Log {
  final logger = Logger(
      filter: MyLogFilter(),
      printer: PrettyPrinter(
          lineLength: 220,
          colors: true,
          methodCount: 0,
          errorMethodCount: 6,
          printEmojis: true,
          printTime: false));

  @override
  void debug({required String title, required message}) {
    logger.d("Debug:: ${title} \n ${message}");
  }
}

class MyLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return kDebugMode || kProfileMode;
  }
}
