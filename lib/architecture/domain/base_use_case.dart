import 'package:base_app/architecture/domain/result.dart';

abstract class  BaseUseCase<Params,Type>{

    Future<Result<Type>> invoke(Params params);

}