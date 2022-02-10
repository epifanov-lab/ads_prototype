import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ads_prototype/bloc/hls_resources/ads_state.dart';


class AdsCubit extends Cubit<HlsResourcesState> {

  AdsCubit() : super(const HlsResourcesState.initial());

}
