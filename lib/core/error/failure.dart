import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UnhandledFailure extends Failure {}

final class ServerFailure extends Failure {}

final class ConnectionFailure extends Failure {}
