import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:seedbot/users/business/interactors/UserInteractor.dart';

import 'NotificationState.dart';

part 'NotificationCtrl.g.dart';



@riverpod
class NotificationCtrl extends _$NotificationCtrl {

  @override
  NotificationState build() {
    return NotificationState();
  }
  notification() async{

    state = state.copyWith(isLoading: true);
    var  usecase  = ref.watch(userInteractorProvider).notificationUseCase;
    var res =  await  usecase.run('d');
    print('bnotificationctrl res $res');
    state = state.copyWith(isLoading: false, data: res );


  }
}