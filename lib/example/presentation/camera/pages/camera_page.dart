

import 'package:base_app/components/fade_transition_widget.dart';
import 'package:base_app/example/presentation/camera/bloc/camera_bloc.dart';
import 'package:base_app/example/presentation/camera/bloc/camera_event.dart';
import 'package:base_app/example/presentation/camera/bloc/camera_state.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../../../../architecture/presentation/pages/base_page.dart';


class CameraPage extends BasePage<CameraPageEvent, CameraState> {
  

  const CameraPage({super.key});

  @override
  State<StatefulWidget> createState() => _CameraStatePage();
}


class _CameraStatePage extends BasePageState<CameraPageEvent, CameraState, CameraBloc>{

  late List<CameraDescription> _cameras;
  CameraController? controller;

  _CameraStatePage() : super(CameraBloc());

  @override
  void initState() {
    super.initState();
    init();
    bloc.add(Initialize());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  init() async{
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }




  @override
  Widget buildContent(BuildContext context, CameraState state) {
    var condition = controller != null ? controller!.value.isInitialized : false;
    return FadeTransitionWidget(
      firstChild: Expanded(child: Container(color: Colors.black),),
      secondChild: controller!= null ? Expanded(child: CameraPreview(controller!)) : const SizedBox(),
      condition: condition,
      duration: const Duration(milliseconds: 400),
    );
  }
}