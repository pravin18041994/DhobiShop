import 'package:real_washer/repositories/Repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  Repository repository = Repository();

  final userContactNumber = BehaviorSubject<String>();
  final userPassword = BehaviorSubject<String>();

  Function(String) get getUserContact => userContactNumber.sink.add;
  Function(String) get getUserPassord => userPassword.sink.add;

  Future<String> login() async {
    return repository.login(userContactNumber.value, userPassword.value);
  }

  dispose() {
    userPassword.close();
    userContactNumber.close();
  }
}

final loginBloc = LoginBloc();
