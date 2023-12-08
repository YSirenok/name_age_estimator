import 'package:name_age_estimator/age_estimate.dart';

abstract class NameAgeState {}

class NameAgeInitial extends NameAgeState {}

class NameAgeLoading extends NameAgeState {}

class NameAgeSuccess extends NameAgeState {
  final AgeEstimate ageEstimate;

  NameAgeSuccess(this.ageEstimate);
}

class NameAgeError extends NameAgeState {
  final String errorMessage;

  NameAgeError(this.errorMessage);
}
