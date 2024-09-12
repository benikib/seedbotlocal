class MoveCommandState{





  bool isLoading = false;
  bool data= false;
  bool semer = false;
  String batterie = "";

  MoveCommandState({
    this.isLoading= false,
    this.data = false,
    this.semer = false,
    this.batterie = "",
  });

  MoveCommandState copyWith({
    bool? isLoading,
    bool? data,
    bool? semer,
    String? batterie ,

  }) =>
      MoveCommandState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
        semer: semer ?? this.semer,
        batterie: batterie ?? this.batterie,
      );


}