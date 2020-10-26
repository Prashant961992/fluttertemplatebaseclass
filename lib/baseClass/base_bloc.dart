import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  BehaviorSubject<String> errorSubject = new BehaviorSubject<String>();
  BehaviorSubject<bool> isLoading = new BehaviorSubject<bool>();

  void dispose() {
    isLoading.close();
    errorSubject.close();
  }
}

