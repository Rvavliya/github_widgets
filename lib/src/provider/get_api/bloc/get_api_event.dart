part of 'get_api_bloc.dart';

@freezed
class GetApiEvent with _$GetApiEvent {
  const factory GetApiEvent.started() = _Started;
  const factory GetApiEvent.refresh() = _Refresh;
}