import '../domain/car.dart';

class ResultPrinter {
  void printStart() {
    print('\n실행 결과');
  }

  void printResult(List<Car> cars) {
    for (final car in cars) {
      print('${car.name} : ${'-' * car.distance}');
    }
    print('\n');
  }

  void printWinners(List<Car> winners) {
    final winnerNames = winners.map((winner) => winner.name).join(", ");
    print('최종 우승자 : ${winnerNames}');
  }
}
