import '../index.dart';

class HomeScreenArguments {
  final String title;
  final String message;

  HomeScreenArguments({this.title, this.message});
}

class HomeScreen extends BaseView {
  final HomeScreenArguments arguments;

  HomeScreen({this.arguments});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends BaseViewState<HomeScreen> with BasePage {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  void initBaseState() {
    this.titleScreen = 'key_title_home';
    this.leftAppBarButton = LeftAppBarButton.Empty;
    // this.leftbuilder = Builder(
    //   builder: (BuildContext context) {
    //     return CustomAppBarIconButton(
    //       icon: Icons.plus_one,
    //       onPressed: () {
    //         print("Press Button");
    //       },
    //     );
    //   },
    // );

    _load();
  }

  Future<void> _getData() async {
    await Future.delayed(const Duration(seconds: 5), () {
      // setState(() {});
    });
    setState(() {});
  }

  @override
  Widget body() {
    return _homeBloc.users.length == 0
        ? Center(
            child: Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_M1JAO6.json'))
        : CustomPullToRefreshIndicator(
            child: Container(
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
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(8),
                  itemCount: _homeBloc.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: ClipOval(
                              child: CircleAvatar(
                                radius: 20,
                                  child: PPNetworkImage(
                                      imageUrl: _homeBloc.users[index].url)),
                            ),
                            title: Text(_homeBloc.users[index].name),
                            subtitle: Text(_homeBloc.users[index].age),
                            // trailing: Text(_homeBloc.users[index].age),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            onRefresh: _getData,
          );
  }

  void _load() {
    // _homeBloc.add(HomeRequestEvent("", ""));
  }
}
