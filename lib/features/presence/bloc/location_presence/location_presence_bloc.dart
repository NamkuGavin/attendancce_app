import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/widget/snackbar/snackbar_item.dart';
import '../../../presence/presentation/widgets/show_dialog_error.dart';
import 'location_presence_event.dart';
import 'location_presence_state.dart';

class LocationPresenceBloc extends Bloc<LocationPresenceEvent, LocationPresenceState> {
  LocationPresenceBloc() : super(LocationInitial()) {
    on<CheckLocation>(_onCheckLocation);
  }

  Future<void> _onCheckLocation(
      CheckLocation event, Emitter<LocationPresenceState> emit) async {
    emit(LocationChecking());

    try {
      const double officeLatitude = -3.0036102855215603;
      const double officeLongitude = 104.82480163552061;
      const double radius = 25; // in meters

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showDialog(
          context: event.context,
          builder: (_) => showDialogError(
            event.context,
            isServiceDisabled: true,
          ),
        );
        emit(const LocationError("Location services are disabled."));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showSnackBar(event.context, title: 'Location permit denied');
          emit(const LocationError("Location permissions are denied."));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showDialog(
          context: event.context,
          builder: (_) => showDialogError(
            event.context,
            isServiceDisabled: true,
          ),
        );
        emit(const LocationError(
            "Location permissions are permanently denied."));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double distance = Geolocator.distanceBetween(position.latitude,
          position.longitude, officeLatitude, officeLongitude);

      if (distance <= radius) {
        emit(LocationValid());
      } else {
        emit(LocationInvalid());
      }
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
