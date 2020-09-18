import '../index.dart';

enum LeftAppBarButton {
  Logout,
  Back,
  Empty,
}

enum RightAppBarButton {
  Logout,
  Back,
  Empty,
}

abstract class BaseView<Bloc extends BaseBloc> extends StatefulWidget {
  final Bloc bloc;
  BaseView({Key key, this.bloc}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  LeftAppBarButton leftAppBarButtonType();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  // GlobalKey<State> keyLoader = new GlobalKey<State>();
  void initBaseState();
}

mixin BasePage<Page extends BaseView> on BaseViewState<Page> {
  bool isSafeAreaRequire = true;
  bool isHiddenNavigationBar = false;
  String titleScreen = "";

  @override
  void initState() {
    super.initState();
    initBaseState();
  }

  void showErrorMessage(String event, ScaffoldState context) {
    if (event != null) {
      context.showSnackBar(new SnackBar(
        content: new Text(event),
      ));
    }
  }

  void showIndicator(String event, ScaffoldState sContext) {
    if (event != null) {
      showProgressDialog(event, sContext.context);
    } else {
      showProgressDialog(AppLocalizations.of(context).translate('please_wait'),
          sContext.context);
    }
  }

  void hideIndicator(ScaffoldState sContext) {
    hideProgressDialog(sContext.context);
  }

  List<CustomAppBarIconButton> actionsAppBar() {
    if (leftAppBarButtonType() == LeftAppBarButton.Logout) {
      return [
        CustomAppBarIconButton(
          icon: Icons.exit_to_app,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(loginScreen);
          },
        )
      ];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: !isHiddenNavigationBar
            ? AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(
                  color: darkBlue, //change your color here
                ),
                leading: leftAppBarButtonType() == LeftAppBarButton.Empty
                    ? null
                    : Builder(
                        builder: (BuildContext context) {
                          if (leftAppBarButtonType() == LeftAppBarButton.Back) {
                            return CustomAppBarIconButton(
                              icon: Icons.arrow_back_ios,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                          } else {
                            return CustomAppBarIconButton(
                              icon: Icons.arrow_back_ios,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                      ),
                backgroundColor: Colors.white,
                title: Text(
                  AppLocalizations.of(context).translate(titleScreen),
                  style: appBarTitleText(),
                ),
                actions: actionsAppBar(),
              )
            : null,
        body: isSafeAreaRequire
          ? SafeArea(
              child: Container(
                child: body(),
                color: Colors.white,
              ),
            )
          : Container(
              child: body(),
              color: Colors.white,
            ),
      ),
    );
  }

  Widget body();
}
