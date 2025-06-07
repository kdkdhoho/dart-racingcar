import 'package:dart_racingcar/reader/result_printer.dart';

import 'controller/racing_game_controller.dart';
import 'domain/random_number_generator.dart';
import 'domain/simple_random_number_generator.dart';
import 'reader/input_reader.dart';

void main() {
  final InputReader inputReader = InputReader();
  final ResultPrinter resultPrinter = ResultPrinter();
  final RandomNumberGenerator randomNumberGenerator =
      SimpleRandomNumberGenerator();

  final racingGameController = RacingGameController(
    inputReader,
    resultPrinter,
    randomNumberGenerator,
  );
  racingGameController.start();
}
