import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapi/helper/cach.dart';

part 'changes_state.dart';

class ChangesCubit extends Cubit<ChangesState> {
  ChangesCubit() : super(ChangesInitial());

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangesModeState());
    } else {
      isDark = !isDark;
      ChachHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangesModeState());
      });
    }
  }
}
