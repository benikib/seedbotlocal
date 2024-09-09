class MoveCommandState{





  bool isLoading = false;
  bool data= false;
  bool semer = false;

  MoveCommandState({
    this.isLoading= false,
    this.data = false,
    this.semer = false,
  });

  MoveCommandState copyWith({
    bool? isLoading,
    bool? data,
    bool? semer,
  }) =>
      MoveCommandState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
        semer: semer ?? this.semer,
      );


}