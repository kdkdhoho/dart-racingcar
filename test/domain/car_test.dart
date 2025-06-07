import 'package:dart_racingcar/domain/car.dart';
import 'package:test/test.dart';

void main() {
  test('최대 이름 길이를 넘을 수 없다.', () {
    // given
    String validName = "abcde";
    String invalidName1 = "abcdef";
    String invalidName2 = "";

    // when, then
    expect(() => Car(validName), returnsNormally);
    expect(() => Car(invalidName1), throwsA(isA<ArgumentError>()));
    expect(() => Car(invalidName2), throwsA(isA<ArgumentError>()));
  });

  test('전달되는 숫자에 따라 이동한다.', () {
    // given
    final car = Car('test');
    expect(car.distance, 0);

    // when, then
    car.conditionalMove(3);
    expect(car.distance, 0);

    car.conditionalMove(4);
    expect(car.distance, 1);
  });
}
