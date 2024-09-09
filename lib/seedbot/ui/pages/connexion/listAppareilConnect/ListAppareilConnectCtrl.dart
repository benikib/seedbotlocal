import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../business/interactor/seedbotInteractor.dart';
import 'ListAppareilConnectState.dart';



part 'ListAppareilConnectCtrl.g.dart';

@riverpod
class ListAppareilConnectCtrl extends _$ListAppareilConnectCtrl{
  @override
  ListAppareilConnectState build(){
    return ListAppareilConnectState();
  }

  void recuperAppareilConnect() async{
    state = state.copyWith(isLoading: true);

   var usecase   = ref.watch(seedbotInteractorProvider).recupereAppareilUseCase;
   var value = await usecase.run();
    print("valueeeeeeeeeeeeeee $value");
    state = state.copyWith(isLoading: false, data: value);


  }
   void connectId(String id) async{
     var usecase   = ref.watch(seedbotInteractorProvider).connectIdUSeCase;
     var value = await usecase.run(id);
     print("ListAppareillConnectID $value");}


}