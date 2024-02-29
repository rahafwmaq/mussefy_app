import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authintcation_event.dart';
part 'authintcation_state.dart';

class AuthintcationBloc extends Bloc<AuthintcationEvent, AuthintcationState> {
  AuthintcationBloc() : super(AuthintcationInitial()) {
    on<AuthintcationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
