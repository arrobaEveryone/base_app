
// Definición del estado genérico del BLoC
import 'base_state.dart';
import '../../domain/base_use_case.dart';
import '../../domain/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



// Definición de los eventos genéricos del BLoC
abstract class BaseEvent {
  const BaseEvent();
}

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(super.initialState);

}

extension BaseBlocExtensions on BaseBloc<BaseEvent, BaseState>  {
  Future<void> execute<P,T>(
    BaseUseCase<P,T> useCase,
    P params,
    Function(T) onSuccess,
    Function(Exception) onError
  ) async {
    try{
      Result<T> result = await useCase.invoke(params);
      if(result is Success){
        onSuccess((result as Success).data);
      }else{
        onError((result as Error).error);
      }
    }on Exception catch (e){
       onError(e);
    }
  }
}

