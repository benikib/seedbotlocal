import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/user/seedbot/business/interactor/seedbotInteractor.dart';
import 'package:seedbot/user/seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectState.dart';



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
    state = state.copyWith(isLoading: false, data: value);

  }

}