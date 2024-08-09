import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationChecking extends LocationState {}

class LocationValid extends LocationState {}

class LocationInvalid extends LocationState {}

class LocationError extends LocationState {
  final String message;
  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}
