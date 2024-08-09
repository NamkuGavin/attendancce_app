import 'package:attendance_app/features/task_report/bloc/camera_task/camera_task_bloc.dart';
import 'package:attendance_app/features/task_report/presentation/pages/preview.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/widget/snackbar/snackbar_item.dart';
import '../../../../../core/widget/transparent_appbar/transparent_appbar.dart';
import '../../../../../injection_container.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  void initState() {
    super.initState();
    context.read<CameraTaskBloc>().add(InitializeCameraEvent());
  }

  @override
  void dispose() {
    context.read<CameraTaskBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: transparentAppBarWidget(isDarkStyle: false),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<CameraTaskBloc, CameraTaskState>(
          listener: (context, state) {
            if (state is CameraPictureTaken) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreviewPage(imagePath: state.imagePath),
                ),
              ).then((useImage) {
                if (useImage != null) {
                  Navigator.pop(context, state.imagePath);
                } else {
                  Navigator.pop(context, null);
                  context.read<CameraTaskBloc>().add(InitializeCameraEvent());
                }
              });
            } else if (state is CameraFailure) {
              showSnackBar(context, title: state.message);
            }
          },
          builder: (context, state) {
            if (state is CameraLoaded) {
              return Stack(
                children: [
                  CameraPreview(state.cameraController),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.20,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: Colors.black,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: IconButton(
                              iconSize: 30,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                context
                                    .read<CameraTaskBloc>()
                                    .add(ToggleCameraEvent());
                              },
                              icon: Icon(
                                state.selectedCameraIndex == 1
                                    ? Icons.switch_camera
                                    : Icons.switch_camera_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              iconSize: 70,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                context
                                    .read<CameraTaskBloc>()
                                    .add(TakePictureEvent());
                              },
                              icon: const Icon(
                                Icons.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return _buildLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
