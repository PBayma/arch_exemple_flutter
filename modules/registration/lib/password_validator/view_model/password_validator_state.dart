sealed class PasswordValidatorState {}

class PasswordValidatorStateLoading extends PasswordValidatorState {}

class PasswordValidatorStateLoaded extends PasswordValidatorState {
  final bool hasNumber;
  final bool hasSpecialChar;
  final bool hasUppercase;
  final bool hasMinLength;

  PasswordValidatorStateLoaded copyWith({
    bool? hasNumber,
    bool? hasSpecialChar,
    bool? hasUppercase,
    bool? hasMinLength,
  }) {
    return PasswordValidatorStateLoaded(
      hasNumber: hasNumber ?? this.hasNumber,
      hasSpecialChar: hasSpecialChar ?? this.hasSpecialChar,
      hasUppercase: hasUppercase ?? this.hasUppercase,
      hasMinLength: hasMinLength ?? this.hasMinLength,
    );
  }

  PasswordValidatorStateLoaded({
    this.hasNumber = false,
    this.hasSpecialChar = false,
    this.hasUppercase = false,
    this.hasMinLength = false,
  });
}
