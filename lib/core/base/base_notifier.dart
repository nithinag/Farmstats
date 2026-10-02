import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseNotifier<T> extends Notifier<T> {
  // Common notifier logic
}

abstract class BaseAsyncNotifier<T> extends AsyncNotifier<T> {
  // Common async notifier logic
}
