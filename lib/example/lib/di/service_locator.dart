import 'package:base_app/example/lib/di/data_service_locator/data_soruce_locator.dart';
import 'package:base_app/example/lib/di/domain_service_locator/domain_service_locator.dart';
import 'package:get_it/get_it.dart';


abstract class InjectionService {

  static final locator = GetIt.I;

  static injectAll() {
    DomainService.inject();
    DataService.inject();
  }
}


