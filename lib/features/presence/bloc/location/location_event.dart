import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class CheckLocation extends LocationEvent {
  final BuildContext context;
  const CheckLocation(this.context);

  @override
  List<Object> get props => [context];
}