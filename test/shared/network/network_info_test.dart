import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_weather/shared/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  test('should forward the call to DataConnectionChecker.hasConnection', () {
    //? Arrange
    final tHasConnectionFuture = Future.value(true);
    when(mockDataConnectionChecker.hasConnection).thenAnswer(
      (_) => tHasConnectionFuture,
    );

    //* Act
    final result = networkInfo.isConnected;

    //! Assert
    verify(mockDataConnectionChecker.hasConnection);
    expect(result, tHasConnectionFuture);
  });
}
