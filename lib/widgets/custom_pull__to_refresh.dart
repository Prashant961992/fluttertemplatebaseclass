import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomPullToRefreshIndicator extends StatefulWidget {
  final Widget child;
  final Function onRefresh;

  const CustomPullToRefreshIndicator({Key key, @required this.child,@required this.onRefresh})
      : super(key: key);

  @override
  _CustomPullToRefreshIndicatorState createState() =>
      _CustomPullToRefreshIndicatorState();
}

class _CustomPullToRefreshIndicatorState
    extends State<CustomPullToRefreshIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _spoonController;
  IndicatorState _prevState;
  static const _indicatorSize = 150.0;

  @override
  void initState() {
    _spoonController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: _indicatorSize,
      builder: (context, child, controller) {
        return Stack(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, Widget _) {
                final currentState = controller.state;
                if (_prevState == IndicatorState.armed &&
                    currentState == IndicatorState.loading) {
                  _spoonController.repeat(reverse: true);
                } else if (_prevState == IndicatorState.loading &&
                    _prevState != currentState) {
                  _spoonController.stop();
                } else if (currentState == IndicatorState.idle &&
                    _prevState != currentState) {
                  _spoonController..value = 0.0;
                }
                _prevState = currentState;
                // Implement pull to refresh code
                return SizedBox(
                  height: controller.value * _indicatorSize,
                  child: AnimatedBuilder(
                    animation: _spoonController,
                    child: Center(
                      child: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_HwQ6Xs.json'),
                      // child: Lottie.asset('lib/view/custompullrefresh/30426-ic-cogs.json'),
                    ),
                    builder: (context, child) {
                      return child;
                    },
                  ),
                );
              },
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value * _indicatorSize),
                  child: child,
                );
              },
              animation: controller,
            ),
            // child
          ],
        );
      },
      child: widget.child,
      onRefresh: widget.onRefresh,
    );
  }
}