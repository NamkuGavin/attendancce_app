abstract class NavigationState {}

class InitialState extends NavigationState {}

class PageLoaded extends NavigationState {
  final int pageIndex;

  PageLoaded(this.pageIndex);
}
