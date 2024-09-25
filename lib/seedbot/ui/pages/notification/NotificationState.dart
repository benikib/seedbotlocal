class NotificationState {

  bool isLoading = false;
  List<dynamic>  data ;
  NotificationState(
  {this.isLoading = false, this.data  = const []});
  NotificationState copyWith({
    bool? isLoading,
    List<dynamic>? data,
  }) =>
      NotificationState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
      );
}