import 'dart:math';

import 'car.dart';
import 'random_number_generator.dart';

class Cars {
  final List<Car> _cars;

  Cars(List<Car> cars) : _cars = List.from(cars);

  List<Car> randomlyMove(final RandomNumberGenerator randomNumberGenerator) {
    _cars.forEach((car) {
      int randomNumber = randomNumberGenerator.generate();
      car.conditionalMove(randomNumber);
    });

    return List.from(_cars);
  }

  List<Car> winners() {
    int maxDistance = 0;
    for (var car in _cars) {
      maxDistance = max(maxDistance, car.distance);
    }

    List<Car> result = [];
    for (var car in _cars) {
      if (car.distance == maxDistance) {
        result.add(car);
      }
    }

    return result;
  }
}
