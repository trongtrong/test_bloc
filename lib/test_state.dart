part of 'test_cubit.dart';

class TestState extends Equatable{
  final List<String>? testString;
  final List<String>? testString2;

  TestState({this.testString, this.testString2});

  TestState copyWith(
      {List<String>? testString, List<String>? testString2}) {
    return TestState(
        testString: testString ?? this.testString,
        testString2: testString2 ?? this.testString2);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [testString, testString2];
}

