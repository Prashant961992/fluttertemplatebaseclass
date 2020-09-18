import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  // BehaviorSubject<Response<String>> subject = new BehaviorSubject<Response<String>>();
  /// relays error information
  /// 
  BehaviorSubject<String> errorSubject = new BehaviorSubject<String>();
  BehaviorSubject<bool> isLoading = new BehaviorSubject<bool>();
  // final _errorSubject = PublishSubject<String>();

  // Sink<String> get errorSink => _errorSubject.sink;

  // Stream<String> get errorStream => _errorSubject.stream;

  void dispose() {
    isLoading.close();
    errorSubject.close();
  }
}

