abstract class NameAgeEvent {}

class GetAgeEstimate extends NameAgeEvent {
  final String name;

  GetAgeEstimate(this.name);
}
