import '../index.dart';

class NoDataFoundWidgets extends StatelessWidget {
  final Function onRetryPressed;

  const NoDataFoundWidgets({Key key, this.onRetryPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.not_listed_location),
            iconSize: 100,
            onPressed:onRetryPressed,
          ),
          // SizedBox(height: 8),
          // RaisedButton(
          //   color: Colors.white,
          //   child: Text(AppLocalizations.of(context).translate('key_retry'),
          //       style: TextStyle(color: Colors.black)),
          //   onPressed: onRetryPressed,
          // )
        ],
      ),
    );
  }
}