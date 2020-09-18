import 'package:rxdart/rxdart.dart';
import '../index.dart';

class LoginBloc extends BaseBloc {
  LoginRepository _loginRepository = LoginRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validator validator = Validator();
  bool autoValidate = false;
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BehaviorSubject<LoginResponse> loginResponse = BehaviorSubject<LoginResponse>();

  void login() async {
    isLoading.add(true);
    
    try {
      LoginRequest request = LoginRequest();
      request.rememberMe = true;
      request.clientType = 0;
      request.deviceId = DateTime.now().millisecondsSinceEpoch.toString();
      request.email = emailController.text;
      request.password = passwordController.text;

      LoginResponse response = await _loginRepository.login(request);
      isLoading.add(false);
      loginResponse.add(response);
    } catch (e) {
      isLoading.add(false);
      errorSubject.add(e.toString());
    }
  }

  dispose() {
    loginResponse.close();
  }
}