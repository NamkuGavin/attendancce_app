part of 'camera_task_bloc.dart';

@immutable
abstract class CameraTaskEvent extends Equatable {}

class InitializeCameraEvent extends CameraTaskEvent {
  @override
  List<Object?> get props => [];
}

class ToggleCameraEvent extends CameraTaskEvent {
  @override
  List<Object?> get props => [];
}

class TakePictureEvent extends CameraTaskEvent {
  @override
  List<Object?> get props => [];
}
