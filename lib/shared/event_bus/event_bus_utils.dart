import 'package:event_bus/event_bus.dart';

class EventBusUtils {
  static final EventBusUtils _singleton = EventBusUtils._internal();

  static EventBus? _eventBus;

  factory EventBusUtils() {
    return _singleton;
  }

  EventBusUtils._internal() {
    _eventBus ??= EventBus();
  }

  static void pushEvent<T>(T event) {
    _eventBus ??= EventBus();
    _eventBus!.fire(event);
  }

  static Stream<T> listenEvent<T>() {
    _eventBus ??= EventBus();
    return _eventBus!.on<T>();
  }
}
