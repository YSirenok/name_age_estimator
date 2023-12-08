import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_age_estimator/agify_service.dart';
import 'package:name_age_estimator/name_age_state.dart';

class NameAgeBloc extends Bloc<String, NameAgeState> {
  final AgifyService agifyService = AgifyService();

  NameAgeBloc() : super(NameAgeInitial()) {
    // Register an event handler for the String event type
    on<String>((event, emit) async {
      // Your logic to handle the event goes here
      // For example, fetching age estimate and updating the state
      await addEventLogic(event, emit);
    });
  }

  Future<void> addEventLogic(String event, Emitter<NameAgeState> emit) async {
    try {
      // Simulate an asynchronous operation (e.g., API call)
      emit(NameAgeLoading()); // Update state to loading

      // Replace this with your actual logic to get age estimate
      final ageEstimate = await agifyService.getAgeEstimate(event);

      // Update the state with the age estimate
      emit(NameAgeSuccess(ageEstimate));
    } catch (e) {
      // Handle errors and update the state accordingly
      emit(NameAgeError('Failed to fetch age estimate.'));
    }
  }
}
