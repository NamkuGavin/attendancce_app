import 'package:equatable/equatable.dart';

abstract class LocationPresenceState extends Equatable {
  const LocationPresenceState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationPresenceState {}

class LocationChecking extends LocationPresenceState {}

class LocationValid extends LocationPresenceState {}

class LocationInvalid extends LocationPresenceState {}

class LocationError extends LocationPresenceState {
  final String message;
  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}
