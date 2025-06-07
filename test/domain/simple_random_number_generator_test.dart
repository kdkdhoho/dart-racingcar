import 'package:test/test.dart';

import '../../lib/domain/simple_random_number_generator.dart';

void main() {
  final SimpleRandomNumberGenerator generator = SimpleRandomNumberGenerator();

  test('1부터 최대 n까지의 숫자를 랜덤하게 생성한다.', () {
    // given
    const min = 1;
    const max = 10;

    for (var i = 0; i < 100; i++) {
      // when
      final randomNumber = generator.generate();

      // then
      expect(randomNumber, greaterThanOrEqualTo(min));
      expect(randomNumber, lessThanOrEqualTo(max));
    }
  });
}
