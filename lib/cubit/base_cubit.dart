abstract class BaseState{}

class InitialState extends BaseState{}

class LoadingState extends BaseState{}

class ErrorState extends BaseState{
  final String error;

  ErrorState({required this.error});
}
