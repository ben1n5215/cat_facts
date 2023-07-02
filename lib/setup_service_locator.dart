import 'package:cat_facts/data/repository/repository.dart';
import 'package:cat_facts/data/repository/repository_impl.dart';
import 'package:cat_facts/data/services/network_service.dart';
import 'package:cat_facts/data/services/network_service_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  NetworkService service = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<Repository>(RepositoryImpl(service));
}
