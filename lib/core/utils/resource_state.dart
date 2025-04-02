class ResourceState<T> {
  final T? data;
  final String? errorMessage;
  final bool isLoading;

  ResourceState._({this.data, this.errorMessage, required this.isLoading});

  factory ResourceState.success(T data) => ResourceState._(data: data, isLoading: false);
  factory ResourceState.error(String message) => ResourceState._(errorMessage: message, isLoading: false);
  factory ResourceState.loading() => ResourceState._(isLoading: true);
}