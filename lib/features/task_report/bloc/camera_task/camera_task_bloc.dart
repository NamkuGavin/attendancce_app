import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'camera_task_event.dart';

part 'camera_task_state.dart';

class CameraTaskBloc extends Bloc<CameraTaskEvent, CameraTaskState> {
  CameraTaskBloc() : super(CameraInitial()) {
    on<InitializeCameraEvent>(_initializeCameraEventHandler);
    on<ToggleCameraEvent>(_toggleCameraEventHandler);
    on<TakePictureEvent>(_takePictureEventHandler);
  }

  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  int _selectedCameraIndex = 1;

  @override
  Future<void> close() {
    _cameraController.dispose();
    return super.close();
  }

  Future<void> _initializeCameraEventHandler(
    InitializeCameraEvent event,
    Emitter<CameraTaskState> emit,
  ) async {
    try {
      _cameras = await availableCameras();

      _cameraController = CameraController(
        _cameras[_selectedCameraIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController.initialize();

      emit(
        CameraLoaded(
          cameraController: _cameraController,
          cameraDescription: _cameras[_selectedCameraIndex],
          selectedCameraIndex: _selectedCameraIndex,
        ),
      );
    } on CameraException catch (e) {
      emit(
        CameraFailure(message: e.description!),
      );
    }
  }

  Future<void> _toggleCameraEventHandler(
    ToggleCameraEvent event,
    Emitter<CameraTaskState> emit,
  ) async {
    try {
      emit(CameraLoading());

      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;

      await _cameraController.dispose();
      _cameraController = CameraController(
        _cameras[_selectedCameraIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _cameraController.initialize();

      emit(
        CameraLoaded(
          cameraController: _cameraController,
          cameraDescription: _cameras[_selectedCameraIndex],
          selectedCameraIndex: _selectedCameraIndex,
        ),
      );
    } on CameraException catch (e) {
      emit(
        CameraFailure(message: e.description!),
      );
    }
  }

  Future<void> _takePictureEventHandler(
    TakePictureEvent event,
    Emitter<CameraTaskState> emit,
  ) async {
    try {
      // await _cameraController.setFlashMode(FlashMode.off);
      // await _cameraController.setFocusMode(FocusMode.locked);
      XFile image = await _cameraController.takePicture();

      emit(
        CameraPictureTaken(imagePath: image.path),
      );
    } on CameraException catch (e) {
      emit(
        CameraFailure(message: e.description!),
      );
    }
  }
}
