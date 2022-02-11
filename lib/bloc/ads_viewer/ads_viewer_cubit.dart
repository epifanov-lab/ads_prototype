import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ads_prototype/bloc/ads_viewer/ads_viewer_state.dart';


class AdsViewerCubit extends Cubit<AdsViewerState> {

  AdsViewerCubit() : super(const AdsViewerState.initial());

}
