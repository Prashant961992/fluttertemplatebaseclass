import 'dart:ui';
import '../index.dart';

class LoginScreen extends BaseView {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseViewState<LoginScreen> with BasePage {
  LoginBloc _loginBloc = LoginBloc();

  @override
  void initBaseState() {
    // this.titleScreen = 'key_title_login';
    this.isSafeAreaRequire = false;
    this.isHiddenNavigationBar = true;
    this.leftAppBarButton = LeftAppBarButton.Empty;

    _loginBloc.errorSubject.listen((error) {
      showErrorMessage(error, scaffoldKey.currentState);
    });

    _loginBloc.isLoading.listen((value) {
      if (value) {
        showIndicator("Loading...", scaffoldKey.currentState);
      } else {
        hideIndicator(scaffoldKey.currentState);
      }
    });

    _loginBloc.loginResponse.listen((response) {
      if (response.data.id != null) {
        AppManager.instance.sharedPreferenceRepository.saveLoggedIn(true);
        AppManager.instance.sharedPreferenceRepository
            .saveLoginResponse(response);
        Navigator.pushReplacementNamed(context, homeScreen);
      }
    });
  }

  @override
  Widget body() {
    final AppLocalizations _localizations = AppLocalizations.of(context);

    return Stack(
      children: [
        CurvedShape(),
        Align(
          alignment: Alignment(0,-.75),
                  child: Text(
            'LOGIN',
            style: TextStyle(
              color: white,
              fontSize: 60,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(21),
              child: Form(
                key: _loginBloc.formKey,
                child: Column(
                  children: <Widget>[
                    // Image.asset(
                    //   ImagePath.logo,
                    //   width: 300,
                    //   height: 300,
                    // ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: skyBlue,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[200],
                                ),
                              ),
                            ),
                            child: CustomTextFormField(
                              hintText: _localizations
                                  .translate('key_enter_email_id'),
                              // label: _localizations.translate('key_email_id'),
                              controller: _loginBloc.emailController,
                              validator: (value) {
                                return _loginBloc.validator
                                    .validateEmail(value);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[200],
                                ),
                              ),
                            ),
                            child: CustomPasswordTextFormField(
                              hintText: _localizations
                                  .translate('key_enter_password'),
                              // label: _localizations.translate('key_password'),
                              obscureText: true,
                              showPasswordToggleIcon: true,
                              controller: _loginBloc.passwordController,
                              validator: (value) {
                                return _loginBloc.validator
                                    .validatePassword(value);
                              },
                              autoValidate: _loginBloc.autoValidate,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    CustomRaisedButton(
                      text: _localizations.translate('key_sign_in'),
                      fontSize: 15,
                      textColor: white,
                      onCustomButtonPressed: () {
                        setState(() {
                          _loginBloc.autoValidate = true;
                        });
                        if (_loginBloc.formKey.currentState.validate()) {
                          // print("You have successfully logged in");
                          _loginBloc.login();
                        }
                      },
                      buttonColor: poloBlue,
                    ),
                    CustomFlatButton(
                      padding: EdgeInsets.all(0),
                      textStyle: black16TextFieldStyle(),
                      onButtonPressed: () {
                        _onForgotPwdPressed(context);
                      },
                      text: _localizations.translate('forgot_password'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _onForgotPwdPressed(BuildContext context) {
    Navigator.pushNamed(context, forgotPasswordScreen);
  }
}

class CurvedShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MyPainter(),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double point1 = height * .18;
    double point2 = height * 0.25;
    double point3W = width * 0.5;
    double point3H = height * .3;
    double point4 = height * .82;
    double point5 = height * 0.9;
    double point6W = width * 0.6;
    double point6H = height * .8;

    Paint paint1 = Paint();
    Paint paint2 = Paint();
    Path path1 = Path();
    Path path2 = Path();

    path1.lineTo(0, point1);
    path1.quadraticBezierTo(point3W, point3H, width, point2);
    path1.lineTo(width, 0);
    path1.close();
    paint1.shader = LinearGradient(colors: [
      skyBlue,
      pinkLace,
    ], begin: Alignment.bottomLeft, end: Alignment.topRight)
        .createShader(Rect.fromLTWH(0, 0, width, height - point3H));
    canvas.drawPath(path1, paint1);

    // path.moveTo(0, size.height);
    path2.moveTo(0, point4);
    path2.lineTo(0, height);
    path2.lineTo(width, height);
    path2.lineTo(width, point5);
    path2.quadraticBezierTo(point6W, point6H, 0, point4);
    path2.close();
    paint2.shader = LinearGradient(colors: [
      skyBlue,
      pinkLace,
    ], begin: Alignment.bottomLeft, end: Alignment.topRight)
        .createShader(Rect.fromLTWH(0, point6H, size.width, height - point6H));
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
