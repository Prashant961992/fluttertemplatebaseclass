import '../index.dart';

class ForgotPasswordScreen extends BaseView {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseViewState<ForgotPasswordScreen>
    with BasePage {
  final _emailController = TextEditingController();

  @override
  LeftAppBarButton leftAppBarButtonType() {
    return LeftAppBarButton.Back;
  }

  @override
  void initBaseState() {
    this.titleScreen = "key_title_forgot_password";
  }

  @override
  Widget body() {
    final AppLocalizations _localizations = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            iceBurg,
            poloBlue,
            steelBlue,
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width / 4,
            backgroundColor: white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImagePath.imageDir + '/forgot_password.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Image.asset(ImagePath.imageDir+'/forgot_password.png'),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(margin),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(
                          //     color: Colors.grey[200],
                          //   ),
                          // ),
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: skyBlue.withOpacity(.8),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: CustomTextFormField(
                          // label: _localizations.translate("email"),
                          // labelStyle: black16TextFieldStyle(),
                          hintText: _localizations.translate("email"),
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          controller: _emailController,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: CustomRaisedButton(
                          text: _localizations.translate("send_email"),
                          buttonColor: skyBlue,
                          textColor: white,
                          fontSize: 20.0,
                          onCustomButtonPressed: () {
                            _onSendEmailPressed(context);
                          },
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSendEmailPressed(BuildContext context) {
    print("Send Email button is clicked!: $context");
  }
}
