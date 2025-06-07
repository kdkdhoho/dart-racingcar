import 'package:dart_racingcar/domain/car.dart';
import 'package:dart_racingcar/domain/cars.dart';
import 'package:dart_racingcar/domain/random_number_generator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'cars_test.mocks.dart';

@GenerateMocks([RandomNumberGenerator])
void main() {
  late List<Car> carValues;
  late Cars cars;
  late RandomNumberGenerator randomNumberGenerator;

  setUp(() {
    carValues = [
      Car('a'),
      Car('b'),
      Car('c'),
    ];
    cars = Cars(carValues);
    randomNumberGenerator = MockRandomNumberGenerator();
  });

  test('자동차를 이동시킨다.', () {
    // given
    when(randomNumberGenerator.generate()).thenReturn(1);

    // when
    cars.randomlyMove(randomNumberGenerator);

    // then
    verify(randomNumberGenerator.generate()).called(carValues.length);
  });

  group('우승자 반환 테스트', () {
    test('우승자를 반환한다', () {
      // given
      carValues[0].conditionalMove(9);

      carValues[1].conditionalMove(9);
      carValues[1].conditionalMove(9);

      // when
      final List<Car> result = cars.winners();

      // then
      expect(result.length, 1);
      expect(result[0], carValues[1]);
    });

    test('우승자는 둘 이상일 수 있다', () {
      // given
      carValues[0].conditionalMove(9);
      carValues[0].conditionalMove(9);

      carValues[1].conditionalMove(9);
      carValues[1].conditionalMove(9);

      // when
      final List<Car> result = cars.winners();

      // then
      expect(result.length, 2);
      expect(result, containsAll([carValues[0], carValues[1]]));
    });
  });
}
