import 'package:flutter/scheduler.dart';

void executeAfterFrameRender(VoidCallback callback) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
