part of 'camera_task_bloc.dart';

@immutable
abstract class CameraTaskState extends Equatable {}

class CameraInitial extends CameraTaskState {
  @override
  List<Object?> get props => [];
}

class CameraLoading extends CameraTaskState {
  @override
  List<Object?> get props => [];
}

class CameraLoaded extends CameraTaskState {
  CameraLoaded({
    required this.cameraController,
    required this.cameraDescription,
    required this.selectedCameraIndex,
  });

  final CameraController cameraController;
  final CameraDescription cameraDescription;
  final int selectedCameraIndex;

  @override
  List<Object?> get props => [
        cameraController,
        cameraDescription,
        selectedCameraIndex,
      ];
}

class CameraPictureTaken extends CameraTaskState {
  CameraPictureTaken({required this.imagePath});

  final String imagePath;

  @override
  List<Object?> get props => [imagePath];
}

class CameraFailure extends CameraTaskState {
  CameraFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
