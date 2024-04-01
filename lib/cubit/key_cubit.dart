import 'package:flutter_bloc/flutter_bloc.dart';

//Maintaining KEY throughout the session
class KeyCubit extends Cubit<String> {
  KeyCubit() : super('');

  void update(String value) {
    emit(value);
  }
}
