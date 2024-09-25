import '../service/userService.dart';

class NotificationUseCase {
  UserService service;
  NotificationUseCase(this.service);

  Future<dynamic?> run(data){
    return service.Notification(data);
}}