import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState {
  const factory BaseState.data(T value) = Data;

  const factory BaseState.loading() = Loading;

  const factory BaseState.error([String? message]) = Error;
}
