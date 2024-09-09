class AuthentificationState {





   bool isLoading = false;
   String data ='';

  AuthentificationState({
  this.isLoading= false,
  this.data= "",
  });

  AuthentificationState copyWith({
  bool? isLoading,
  String? data,
  }) =>
      AuthentificationState(
  isLoading: isLoading ?? this.isLoading,
  data: data ?? this.data,
  );


}