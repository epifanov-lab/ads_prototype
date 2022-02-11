import 'package:equatable/equatable.dart';

class AdsViewerState extends Equatable {

  final dynamic data;

  const AdsViewerState._({
    required this.data,
  });

  const AdsViewerState.initial()
      : this._(data: const []);

  AdsViewerState copyWith({
    dynamic data,
  }) {
    return AdsViewerState._(
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [
    data,
  ];

}