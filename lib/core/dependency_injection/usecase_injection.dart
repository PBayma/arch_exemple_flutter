import 'package:details/domain/usecases/get_details_usecase.dart';
import 'package:foundation/foundation.dart';
import 'package:home/domain/usecases/get_home_usecase.dart';
import 'package:registration/domain/usecases/get_cep_search_usecase.dart';
import 'package:registration/domain/usecases/get_lenght_validator_usecase.dart';
import 'package:registration/domain/usecases/get_number_validator_usecase.dart';
import 'package:registration/domain/usecases/get_special_char_validator_usecase.dart';
import 'package:registration/domain/usecases/get_uppercase_validator_usecase.dart';

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
    getIt.registerFactory<GetCepSearchUseCase>(
      () => GetCepSearchUseCase(
        cepRepository: getIt.get(),
      ),
    );
    getIt.registerFactory<GetLengthValidatorUseCase>(
      () => GetLengthValidatorUseCase(),
    );
    getIt.registerFactory<GetNumberValidatorUseCase>(
      () => GetNumberValidatorUseCase(),
    );
    getIt.registerFactory<GetSpecialCharValidatorUseCase>(
      () => GetSpecialCharValidatorUseCase(),
    );
    getIt.registerFactory<GetUppercaseValidatorUseCase>(
      () => GetUppercaseValidatorUseCase(),
    );
  }
}
