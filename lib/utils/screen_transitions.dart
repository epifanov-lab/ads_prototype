import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ScreenTransitionType {
  inFromLeft,
  inFromRight,
  inFromBottom,
  inFromTop,
  fadeIn,

  native,
  nativeModal,
  material,
  materialFullScreenDialog,
  cupertino,
  cupertinoFullScreenDialog,
  transparent,
  transparentFullScreenDialog,
  enterExitRoute,
}

class ScreenTransitions {

  static RouteTransitionsBuilder _standardTransitionsBuilder(
      ScreenTransitionType transitionType) {
    return (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      if (transitionType == ScreenTransitionType.fadeIn) {
        return FadeTransition(opacity: animation, child: child);

      } else {
        const Offset topLeft = const Offset(0.0, 0.0);
        const Offset topRight = const Offset(1.0, 0.0);
        const Offset bottomLeft = const Offset(0.0, 1.0);
        const Offset bottomRight = const Offset(1.0, 1.0);

        Offset startOffset = bottomLeft;
        Offset endOffset = topLeft;
        if (transitionType == ScreenTransitionType.inFromLeft) {
          startOffset = const Offset(-1.0, 0.0);
          endOffset = topLeft;

        } else if (transitionType == ScreenTransitionType.inFromRight) {
          startOffset = topRight;
          endOffset = topLeft;

        } else if (transitionType == ScreenTransitionType.inFromBottom) {
          startOffset = bottomRight;
          endOffset = topLeft;

        } else if (transitionType == ScreenTransitionType.inFromTop) {
          startOffset = const Offset(0.0, -1.0);
          endOffset = topLeft;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: startOffset,
            end: endOffset,
          ).animate(animation),
          child: child,
        );
      }
    };
  }

  static getTransition(
      ScreenTransitionType transition, RouteSettings routeSettings, Widget widget,
      [Duration transitionDuration = const Duration(milliseconds: 250)]) {

    bool isNativeTransition =
        transition == ScreenTransitionType.native ||
        transition == ScreenTransitionType.nativeModal;

    if (isNativeTransition) {
      if (Platform.isIOS) {
        return CupertinoPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == ScreenTransitionType.nativeModal,
            builder: (BuildContext context) {
              return widget;
            });
      } else {
        return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog: transition == ScreenTransitionType.nativeModal,
            builder: (BuildContext context) {
              return widget;
            });
      }

    } else if (transition == ScreenTransitionType.material ||
        transition == ScreenTransitionType.materialFullScreenDialog) {
      return MaterialPageRoute<dynamic>(
          settings: routeSettings,
          fullscreenDialog:
              transition == ScreenTransitionType.materialFullScreenDialog,
          builder: (BuildContext context) {
            return widget;
          });

    } else if (transition == ScreenTransitionType.cupertino ||
        transition == ScreenTransitionType.cupertinoFullScreenDialog) {
      return CupertinoPageRoute<dynamic>(
          settings: routeSettings,
          fullscreenDialog: transition == ScreenTransitionType.cupertinoFullScreenDialog,
          builder: (BuildContext context) => widget);

    } else if (transition == ScreenTransitionType.transparent ||
        transition == ScreenTransitionType.transparentFullScreenDialog) {
      return TransparentRoute<dynamic>(
          settings: routeSettings,
          fullscreenDialog: transition == ScreenTransitionType.transparentFullScreenDialog,
          builder: (BuildContext context) => widget);

    } else {
      var routeTransitionsBuilder = _standardTransitionsBuilder(transition);
      return PageRouteBuilder<dynamic>(
        settings: routeSettings,
        pageBuilder:
            (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) => widget,
        transitionDuration: transitionDuration,
        transitionsBuilder: routeTransitionsBuilder,
      );
    }
  }
}

class TransparentRoute<T> extends PageRoute<T> {
  /// Construct a MaterialPageRoute whose contents are defined by [builder].
  ///
  /// The values of [builder], [maintainState], and [fullScreenDialog] must not
  /// be null.
  TransparentRoute({
    required this.builder,
    required RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : super(settings: settings, fullscreenDialog: fullscreenDialog);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  final bool maintainState;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return previousRoute is MaterialPageRoute ||
        previousRoute is CupertinoPageRoute;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    // Don't perform outgoing animation if the next route is a fullscreen dialog.
    return (nextRoute is MaterialPageRoute && !nextRoute.fullscreenDialog) ||
        (nextRoute is CupertinoPageRoute && !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('The builder for route "${settings.name}" returned null.'),
          ErrorDescription('Route builders must never return null.')
        ]);
      }
      return true;
    }());
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return theme.buildTransitions<T>(
        this, context, animation, secondaryAnimation, child);
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}

class TransparentRouteC<T> extends PageRoute<T> {
  /// Construct a MaterialPageRoute whose contents are defined by [builder].
  ///
  /// The values of [builder], [maintainState], and [fullScreenDialog] must not
  /// be null.
  TransparentRouteC({
    required this.builder,
    required RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : super(settings: settings, fullscreenDialog: fullscreenDialog);

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  final bool maintainState;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return previousRoute is MaterialPageRoute ||
        previousRoute is CupertinoPageRoute;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    // Don't perform outgoing animation if the next route is a fullscreen dialog.
    return (nextRoute is MaterialPageRoute && !nextRoute.fullscreenDialog) ||
        (nextRoute is CupertinoPageRoute && !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
              'The builder for route "${settings.name}" returned null.'),
          ErrorDescription('Route builders must never return null.')
        ]);
      }
      return true;
    }());
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return theme.buildTransitions<T>(
        this, context, animation, secondaryAnimation, child);
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  EnterExitRoute({
    required this.exitPage,
    required this.enterPage,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) => Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
