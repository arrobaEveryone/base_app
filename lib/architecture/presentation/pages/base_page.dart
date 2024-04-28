import 'package:base_app/architecture/presentation/bloc/base_bloc.dart';
import 'package:base_app/architecture/presentation/bloc/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// Clase abstracta para la pantalla base
abstract class BasePage<E extends BaseEvent, S extends BaseState> extends StatefulWidget {
  
  const BasePage({Key? key}) : super(key: key);

}

abstract class BasePageState<E extends BaseEvent, S extends BaseState, 
    B extends BaseBloc<E, S>> extends State<BasePage<E, S>> {

      
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
  
  final BaseBloc<E, S> bloc;

  BasePageState(this.bloc);

  Widget buildContent(BuildContext context, S state) => Container();

  Widget buildDialog(BuildContext context, S state) => const SizedBox();

  Widget buildBottomModal(BuildContext context, S state) => const SizedBox();

  Widget buildSnackBar(BuildContext context, S state) => const SizedBox();

  void  blocListener(BuildContext context, S state) {}

  Future<void> openDialog(BuildContext context, S state) {
    return showDialog(
      context: context,
      builder:  (BuildContext context) {
        return buildDialog(context, state);
      }
    );
  }    

  Future<void> openBottomModal(BuildContext context, S state) {
    return showModalBottomSheet<void>(
      context: context,
      builder:  (BuildContext context) {
        return buildBottomModal(context, state);
      }
    );
  }   

  void showSnackBar(BuildContext context, S state, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: buildSnackBar(context, state),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      )
    );
  }

  bool blocListenWhen(S previous, S current){return true;}

  bool blocBuildWhen(S previous, S current){return true;}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BaseBloc<E, S>, S>(
      bloc: bloc,
      listenWhen: (previous, current) => blocListenWhen(previous,current),
      buildWhen: (previous, current) => blocBuildWhen(previous,current),
      listener: (context, state) => blocListener(context,state),
      builder: (context, state) {
        return  buildContent(context, state);
      },
    );
  }
  
}