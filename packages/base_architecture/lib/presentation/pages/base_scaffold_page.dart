import '../bloc/base_bloc.dart';
import '../bloc/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// Clase abstracta para la pantalla base
abstract class BaseScaffoldPage<E extends BaseEvent, S extends BaseState> extends StatefulWidget {
  
  const BaseScaffoldPage({super.key});

}

abstract class BaseScaffoldPageState<E extends BaseEvent, S extends BaseState, 
    B extends BaseBloc<E, S>> extends State<BaseScaffoldPage<E, S>> {

  bool get closeBlocOnDispose => true;
      
  @override
  void dispose() {
    if(closeBlocOnDispose){
      bloc.close();
    }
    super.dispose();
  }
  
  BaseBloc<E, S> bloc;

  BaseScaffoldPageState(this.bloc);


  PreferredSizeWidget? buildTopBar(BuildContext context, S state) => AppBar();

  Widget buildBottomBar(BuildContext context, S state) => const SizedBox();

  Widget buildContent(BuildContext context, S state) => Container();

  Widget buildDialog(BuildContext context, S state) => const SizedBox();

  Widget buildBottomModal(BuildContext context, S state) => const SizedBox();

  Widget buildSnackBar(BuildContext context, S state) => const SizedBox();

  Widget buildFabButton(BuildContext context, S state) => const SizedBox();

  void  blocListener(BuildContext context, S state) {}

  bool blocListenWhen(S previous, S current){return true;}

  bool blocBuildWhen(S previous, S current){return true;}

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


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BaseBloc<E, S>, S>(
      bloc: bloc,
      listener: (context, state) => blocListener(context,state),
      listenWhen: (previous, current) => blocListenWhen(previous,current),
      buildWhen: (previous, current) => blocBuildWhen(previous,current),
      builder: (context, state) {
        return Scaffold(
          appBar: buildTopBar(context, state),
          bottomNavigationBar: buildBottomBar(context,state),
          body: buildContent(context, state),
          floatingActionButton: buildFabButton(context,state),
        );
      },
    );
  }
  
}