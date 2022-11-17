import 'package:equatable/equatable.dart';

class TestState2 extends Equatable{
  final List<String>? testString;
  final List<String>? testString2;

  TestState2({this.testString, this.testString2});

  TestState2 copyWith(
      {List<String>? testString, List<String>? testString2}) {
    return TestState2(
        testString: testString ?? this.testString,
        testString2: testString2 ?? this.testString2);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [testString, testString2];
}

