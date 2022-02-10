import 'package:equatable/equatable.dart';

class HlsResourcesState extends Equatable {

  final dynamic data;

  const HlsResourcesState._({
    required this.data,
  });

  const HlsResourcesState.initial()
      : this._(data: const []);

  HlsResourcesState copyWith({
    dynamic data,
  }) {
    return HlsResourcesState._(
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [
    data,
  ];

}