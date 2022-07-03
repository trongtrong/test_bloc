import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestState(testString: []));

  void testCopy(value, value2) {
    emit(state.copyWith(testString: [value], testString2: [value2]));
    print('value ==   ${state.testString}    ====    value2 ==   ${state.testString2}');
  }

}
