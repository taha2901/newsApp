part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsBottomNav  extends NewsState {}

final class GetBusinessLoaded extends NewsState {}

final class GetBusinessSucess extends NewsState {}

final class GetBusinessFailure extends NewsState {
  final String errMessage;

  GetBusinessFailure(this.errMessage);
}


final class GetSportsLoaded extends NewsState {}

final class GetSportsSucess extends NewsState {}

final class GetSportsFailure extends NewsState {
  final String errMessage;

  GetSportsFailure(this.errMessage);
}


final class GetScienceLoaded extends NewsState {}

final class GetScienceSucess extends NewsState {}

final class GetScienceFailure extends NewsState {
  final String errMessage;

  GetScienceFailure(this.errMessage);
}


final class GetSearchLoaded extends NewsState {}

final class GetSearchSucess extends NewsState {}

final class GetSearchFailure extends NewsState {
  final String errMessage;

  GetSearchFailure(this.errMessage);
}




