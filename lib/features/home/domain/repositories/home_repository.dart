import 'package:dartz/dartz.dart';
import 'package:starter/core/core.dart';

/// Abstract contract for the Home feature's repository.
///
/// A repository acts as a **bridge** between the domain layer (use cases)
/// and the data layer (API, cache, database, etc.).
///
/// - Defines the **operations** that the domain layer can perform
/// - Hides the implementation details (API, DB, etc.)
/// - Returns results wrapped in [Either] to unify success/failure handling
///
/// ### Error handling
/// - On success: returns `Right(result)`
/// - On failure: returns `Left(Failure)`
///
/// Example usage in a UseCase:
/// ```dart
/// class ExampleUseCase extends UseCaseFuture<Failure, bool, NoParams> {
///   final HomeRepository repository;
///
///   ExampleUseCase(this.repository);
///
///   @override
///   Future<Either<Failure, bool>> call(NoParams params) {
///     return repository.example();
///   }
/// }
/// ```
///
/// Example invocation in UI:
/// ```dart
/// final result = await repository.example();
/// result.fold(
///   (failure) => print("Error: ${failure.message}"),
///   (success) => print("Operation success: $success"),
/// );
/// ```
abstract class HomeRepository {
  /// Example repository method.
  ///
  /// Delegates to a data source (e.g., [HomeApiDataSource]),
  /// and wraps the result in [Either] to return
  /// - [Right] with `true`/`false` on success
  /// - [Left] with a [Failure] on error
  Future<Either<Failure, bool>> example();
}
