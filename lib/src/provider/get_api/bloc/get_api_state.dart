part of 'get_api_bloc.dart';

@freezed
class GetApiState with _$GetApiState {
  const factory GetApiState.initial() = _Initial;
  const factory GetApiState.loading() = _Loading;
  const factory GetApiState.success(List<dynamic> getApiData) = _Success;
  const factory GetApiState.error(String message) = _Error;
}
