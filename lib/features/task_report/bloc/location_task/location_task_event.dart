import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocationTaskEvent extends Equatable {
  const LocationTaskEvent();
}

class CheckLocation extends LocationTaskEvent {
  final BuildContext context;
  const CheckLocation(this.context);

  @override
  List<Object> get props => [context];
}