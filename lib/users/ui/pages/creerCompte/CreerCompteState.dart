class CreerCompteState {





  bool isLoading = false;
  String data ='';

  CreerCompteState({
    this.isLoading= false,
    this.data= "",
  });

  CreerCompteState copyWith({
    bool? isLoading,
    String? data,
  }) =>
      CreerCompteState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
      );


}