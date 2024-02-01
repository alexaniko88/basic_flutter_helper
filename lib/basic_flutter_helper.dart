library basic_flutter_helper;

import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'extensions/string_extensions.dart';
part 'extensions/date_time_extensions.dart';
part 'extensions/duration_extensions.dart';
part 'extensions/int_extensions.dart';
part 'extensions/platform_extensions.dart';
part 'extensions/list_extensions.dart';

part 'mixins/safe_emit_cubit_mixin.dart';
part 'mixins/self_cancellable_streams_cubit_mixin.dart';
part 'mixins/self_cancellable_streams_mixin.dart';

part 'utils/models/pair.dart';
part 'utils/connectivity/connectivity_stream_builder.dart';
part 'utils/connectivity/connectivity_utils.dart';
part 'utils/disabled_content.dart';
part 'utils/logger.dart';