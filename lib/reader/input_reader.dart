import 'dart:io';

class InputReader {
  List<String> readCarNames() {
    print('경주할 자동차 이름을 입력하세요.(이름은 쉼표(,) 기준으로 구분)');
    final String input = _read();

    List<String> names = input.split(",").map((name) => name.trim()).toList();
    if (names.length < 2) {
      throw ArgumentError('최소 2명 이상의 이름을 입력해주세요.');
    }

    return names;
  }

  String _read() {
    final String? input = stdin.readLineSync();

    if (input == null) {
      throw ArgumentError('값이 입력되지 않았습니다.');
    }
    return input;
  }

  int readTryCount() {
    print('시도할 횟수는 몇 회 인가요?');
    final String input = _read();
    final int? tryCount = int.tryParse(input);
    if (tryCount == null) {
      throw ArgumentError('숫자를 입력해주세요.');
    }
    return tryCount;
  }
}
