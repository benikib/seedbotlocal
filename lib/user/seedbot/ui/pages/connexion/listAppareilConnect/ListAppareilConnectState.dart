

import '../../../../business/models/connexionAppareilModel/appasreilConnectModel.dart';

class ListAppareilConnectState{
  bool isLoading = false;
  List<apppasreilConnectModel> data= [];

  ListAppareilConnectState({
    this.isLoading= false,
    this.data= const [],
  });

  ListAppareilConnectState copyWith({
    bool? isLoading,
    List<apppasreilConnectModel>? data,
  }) =>
      ListAppareilConnectState(
        isLoading: isLoading ?? this.isLoading,
        data: data ?? this.data,
      );

}