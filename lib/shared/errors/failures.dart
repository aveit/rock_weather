import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorTitle;
  final String errorMessage;

  const Failure({
    this.errorTitle,
    this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage, errorTitle];
}

class ServerFailure extends Failure {
  const ServerFailure({
    String errorTitle,
    String errorMessage,
  }) : super(
          errorTitle: errorTitle,
          errorMessage: errorMessage,
        );
}

class CacheFailure extends Failure {
  const CacheFailure({
    String errorTitle,
    String errorMessage,
  }) : super(
          errorTitle: errorTitle,
          errorMessage: errorMessage,
        );
}
