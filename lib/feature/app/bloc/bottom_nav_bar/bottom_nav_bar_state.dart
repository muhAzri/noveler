part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState extends Equatable {
  const BottomNavBarState();

  int get index => 0;

  @override
  List<Object> get props => [index];
}

final class BottomNavBarInitial extends BottomNavBarState {}

final class BottomNavBarChanged extends BottomNavBarState {
  @override
  final int index;

  const BottomNavBarChanged(this.index);

  @override
  List<Object> get props => [index];
}
