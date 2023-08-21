import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigatiom_state.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);
  void onChnage(int index){
    emit(index);
  }
}
