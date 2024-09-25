import 'package:seedbot/users/business/models/CategoriesModel.dart';

class IntroState {
  bool isLoading = false;
  List<Datum> data = const [] ;

  IntroState(
      {this.isLoading = false, this.data  = const []});
  IntroState copyWith({bool? isLoading, List<Datum>? data}) => IntroState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data
      );
}