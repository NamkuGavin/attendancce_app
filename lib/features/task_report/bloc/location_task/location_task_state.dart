import 'package:equatable/equatable.dart';

abstract class LocationTaskState extends Equatable {
  const LocationTaskState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationTaskState {}

class LocationChecking extends LocationTaskState {}

class LocationValid extends LocationTaskState {}

class LocationInvalid extends LocationTaskState {}

class LocationError extends LocationTaskState {
  final String message;
  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}
