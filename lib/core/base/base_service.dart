import 'package:logger/logger.dart';
import 'package:flutter_mvvm_starter/core/logger.dart';

class BaseService {
  Logger log;

  BaseService({String title}) {
    this.log = getLogger(
      title ?? this.runtimeType.toString(),
    );
  }
}
