import 'package:por2/domain/entities/response/beach.dart';

abstract class FavoritesStates {}

class FavoritesInitialState extends FavoritesStates {}

class FavoritesLoadingState extends FavoritesStates {}

class FavoritesSuccessState extends FavoritesStates {
  final List<Beach> favorites;
  FavoritesSuccessState({required this.favorites});
}

class FavoritesErrorState extends FavoritesStates {
  final String message;
  FavoritesErrorState({required this.message});
}

class FavoriteToggleLoadingState extends FavoritesStates {
  final String beachId;
  FavoriteToggleLoadingState({required this.beachId});
}

class FavoriteToggleSuccessState extends FavoritesStates {
  final String beachId;
  FavoriteToggleSuccessState({required this.beachId});
}

class FavoriteToggleErrorState extends FavoritesStates {
  final String message;
  FavoriteToggleErrorState({required this.message});
}
