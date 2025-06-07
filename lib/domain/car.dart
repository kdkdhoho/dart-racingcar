import 'dart:core';

class Car {
  static const _MOVE_CONDITION_VALUE = 4;

  final String _name;
  int _distance = 0;

  Car(this._name) {
    if (_name.isEmpty || _name.length > 5) {
      throw new ArgumentError('이름은 5자 이하만 가능합니다.');
    }
  }

  void conditionalMove(int number) {
    if (number >= _MOVE_CONDITION_VALUE) {
      this._distance++;
    }
  }

  get name => _name;
  get distance => _distance;
}
