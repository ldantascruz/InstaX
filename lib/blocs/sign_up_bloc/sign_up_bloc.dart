import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpInProgress());
      try {
        MyUser user = await _userRepository.signUp(
          myUser: event.myUser,
          password: event.password,
        );
        await _userRepository.setUserData(myUser: user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(const SignUpFailure());
      }
    });
  }
}
