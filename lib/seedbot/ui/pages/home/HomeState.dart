class HomeState{





  bool isLoading = false;
  bool data= false;

  HomeState({
  this.isLoading= false,
  this.data = false,
  });

  HomeState copyWith({
  bool? isLoading,
 bool? data,
  }) =>
      HomeState(
  isLoading: isLoading ?? this.isLoading,
  data: data ?? this.data,
  );


}