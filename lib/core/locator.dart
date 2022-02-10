import 'package:get_it/get_it.dart';
import 'package:ads_prototype/bloc/hls_resources/ads_cubit.dart';

final GetIt locator = GetIt.instance;

Future setupLocator() async {
  await locator.reset();
  _setupServices();
  _setupBlocs();
  return true;
}

void _setupServices() {

}

void _setupBlocs() {
  locator.registerLazySingleton(() => AdsCubit());
}

void resetLocator() {
  locator.resetLazySingleton<AdsCubit>();
}