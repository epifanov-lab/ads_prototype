import 'package:ads_prototype/bloc/ads_viewer/ads_viewer_cubit.dart';
import 'package:ads_prototype/bloc/greetings/greetings_cubit.dart';
import 'package:ads_prototype/core/global_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
bool isLocatorInitialized = false;

Future setupLocator(GlobalKey<NavigatorState> navigatorKey) async {
  await locator.reset();
  locator.registerSingleton(GlobalNavigator(navigatorKey: navigatorKey));
  _setupServices();
  _setupBlocs();
  isLocatorInitialized = true;
  return isLocatorInitialized;
}

void _setupServices() {

}

void _setupBlocs() {
  locator.registerSingleton(GreetingsCubit());
  locator.registerSingleton(AdsViewerCubit());
}

void resetLocator() {
  locator.resetLazySingleton<GreetingsCubit>();
  locator.resetLazySingleton<AdsViewerCubit>();
}