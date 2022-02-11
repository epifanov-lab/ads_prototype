import 'package:equatable/equatable.dart';

class GreetingsState extends Equatable {

  final bool isPlayAdsButtonShown;

  const GreetingsState._({
    required this.isPlayAdsButtonShown,
  });

  const GreetingsState.initial()
      : this._(isPlayAdsButtonShown: false);

  GreetingsState copyWith({
    dynamic isPlayAdsButtonShown,
  }) {
    return GreetingsState._(
      isPlayAdsButtonShown: isPlayAdsButtonShown ?? this.isPlayAdsButtonShown,
    );
  }

  @override
  List<Object> get props => [
    isPlayAdsButtonShown,
  ];

}