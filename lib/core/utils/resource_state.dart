class ResourceState<T> {
  final T? data;
  final Exception? exception;
  final bool isLoading;

  ResourceState._({this.data, this.exception, required this.isLoading});

  factory ResourceState.success(T data) => ResourceState._(data: data, isLoading: false);
  factory ResourceState.error(Exception exception) => ResourceState._(exception: exception, isLoading: false);
  factory ResourceState.loading() => ResourceState._(isLoading: true);
}