class ParametreState {

  bool isLoading = false;
  bool data= false;
  String config = "";
  ParametreState({
    this.isLoading= false,
    this.data = false,
    this.config = "",
  });

  ParametreState copyWith({
    bool? isLoading,
    bool? data,
    String? config ,

  }) =>
      ParametreState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
        config: config ?? this.config,
      );
}