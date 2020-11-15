import 'package:real_washer/providers/ApiProvider.dart';
import 'package:real_washer/repositories/Repository.dart';
import 'package:rxdart/subjects.dart';

class SignupBloc {
  ApiProvider apiProvider = ApiProvider();
  Repository repository = Repository();
  final userName = BehaviorSubject<String>();
  final userEmail = BehaviorSubject<String>();
  final userContactNumber = BehaviorSubject<String>();
  final userPassword = BehaviorSubject<String>();

  Function(String) get getUserName => userContactNumber.sink.add;
  Function(String) get getUserEmail => userEmail.sink.add;
  Function(String) get getUserContactNumber => userContactNumber.sink.add;
  Function(String) get getUserPassword => userPassword.sink.add;

  Future<String> signup() async {
    return await repository.signup(userName.value, userEmail.value,
        userContactNumber.value, userPassword.value);
  }

  dispose() {
    userName.close();
    userEmail.close();
    userPassword.close();
    userContactNumber.close();
  }
}

final signupBloc = SignupBloc();
