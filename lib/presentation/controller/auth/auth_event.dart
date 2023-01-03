
abstract class AuthEvent {}
class SignInAnonymouslyEvent extends AuthEvent{
  final String name;

  SignInAnonymouslyEvent({required this.name});
}
class SignOutEvent extends AuthEvent{}
