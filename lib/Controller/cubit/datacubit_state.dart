part of 'datacubit_cubit.dart';

@immutable
abstract class DatacubitState {}

class DatacubitInitial extends DatacubitState {}

class datafetchedstate extends DatacubitState {}

class Loadingstate extends DatacubitState {}
