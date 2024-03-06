part of 'changes_cubit.dart';

@immutable
sealed class ChangesState {}

final class ChangesInitial extends ChangesState {}

final class ChangesModeState extends ChangesState {}
