import 'package:details/domain/get_details_usecase.dart';
import 'package:foundation/foundation.dart';
import 'package:home/domain/usecases/get_home_usecase.dart';

class UsecaseInjection {
  static void setUp() {
    getIt.registerFactory<GetHomeUsecase>(
      () => GetHomeUsecase(homeRepository: getIt.get()),
    );
    getIt.registerFactory<GetDetailsUsecase>(
      () => GetDetailsUsecase(
        detailsRepository: getIt.get(),
      ),
    );
  }
}
