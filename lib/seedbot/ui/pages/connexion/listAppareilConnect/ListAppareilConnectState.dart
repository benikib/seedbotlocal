

import '../../../../business/models/connexionAppareilModel/AppareilModel.dart';

class ListAppareilConnectState{
  bool isLoading = false;
  List<AppareilModel> data= [];

  ListAppareilConnectState({
    this.isLoading= false,
    this.data= const [],
  });

  ListAppareilConnectState copyWith({
    bool? isLoading,
    List<AppareilModel>? data,
  }) =>
      ListAppareilConnectState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
      );

}