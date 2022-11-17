part of 'test_cubit.dart';

class TestState extends Equatable{
  final List<String>? testString;
  final List<String>? testString2;
  String? text;

  TestState({this.testString, this.testString2, this.text});

  TestState copyWith(
      {List<String>? testString, List<String>? testString2, String? text}) {
    return TestState(
        testString: testString ?? this.testString,
        text: text ?? this.text,
        testString2: testString2 ?? this.testString2);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [testString, testString2, text];
}

