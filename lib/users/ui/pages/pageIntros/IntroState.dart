class IntroState {
  bool isLoading = false;
  dynamic data = "";

  IntroState(
      {this.isLoading = false, this.data = ""});
  IntroState copyWith({bool? isLoading, dynamic? data}) => IntroState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data
      );
}