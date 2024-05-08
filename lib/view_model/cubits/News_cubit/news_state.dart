part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {

}
final class SearchNewsInitial extends NewsState {

}
final class RecommendedNewsInitial extends NewsState {}
final class GetNewsLoadingState extends NewsState{}
final class GetNewsSuccessState extends NewsState{}
final class GetNewsFieldState extends NewsState{}
final class SelectedFilterState extends NewsState{}
