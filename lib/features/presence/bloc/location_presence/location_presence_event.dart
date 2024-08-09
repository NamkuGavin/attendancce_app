import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocationPresenceEvent extends Equatable {
  const LocationPresenceEvent();
}

class CheckLocation extends LocationPresenceEvent {
  final BuildContext context;
  const CheckLocation(this.context);

  @override
  List<Object> get props => [context];
}