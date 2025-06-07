import '../domain/car.dart';
import '../domain/cars.dart';
import '../domain/random_number_generator.dart';
import '../reader/input_reader.dart';
import '../reader/result_printer.dart';

class RacingGameController {
  final InputReader inputReader;
  final ResultPrinter resultPrinter;
  final RandomNumberGenerator randomNumberGenerator;

  const RacingGameController(
    this.inputReader,
    this.resultPrinter,
    this.randomNumberGenerator,
  );

  void start() {
    final List<String> carNames = inputReader.readCarNames();
    final int tryCount = inputReader.readTryCount();

    resultPrinter.printStart();

    final List<Car> carValues = carNames.map((name) => Car(name)).toList();
    final cars = Cars(carValues);

    for (var count = 0; count < tryCount; count++) {
      var movedCars = cars.randomlyMove(randomNumberGenerator);
      resultPrinter.printResult(movedCars);
    }

    final List<Car> winners = cars.winners();
    resultPrinter.printWinners(winners);
  }
}
