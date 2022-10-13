
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soli/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(Unauthenticated()) {
    on<LoginRequested>((event, emit) async {
      emit(Loading()); // this is where you SET the state..
      try {
        await authRepository.logIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(Unauthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(Unauthenticated());
      }
    });

    on<LogoutRequested>((event, emit) async {
      // try {
        emit(Loading());
        await authRepository.logOut();
        emit(Unauthenticated());
      // } catch (e) {
      //   emit(AuthError(e.toString()));
      //   emit(Authenticated());
      // }
    });
  }
}
