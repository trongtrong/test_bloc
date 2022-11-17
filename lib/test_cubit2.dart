import 'package:bloc/bloc.dart';
import 'package:bloc_example/test_state2.dart';
import 'package:equatable/equatable.dart';

class TestCubit2 extends Cubit<TestState2> {
  TestCubit2() : super(TestState2(testString: []));

  void testCopy(value, value2) {
    emit(state.copyWith(testString: [value], testString2: [value2]));
    print('value ==   ${state.testString}    ====    value2 ==   ${state.testString2}');
  }

  void clear(){
    emit(TestState2());
  }


}
