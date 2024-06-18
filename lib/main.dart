import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/page/app.dart';
import 'bootstrap.dart';

void main() {
  bootstrap(() =>
      DevicePreview(enabled: !kReleaseMode, builder: (context) => const App()));
}

