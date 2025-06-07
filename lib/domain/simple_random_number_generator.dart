import 'dart:math';

import 'random_number_generator.dart';

class SimpleRandomNumberGenerator implements RandomNumberGenerator {
  @override
  int generate() {
    return Random.secure().nextInt(9) + 1;
  }
}
