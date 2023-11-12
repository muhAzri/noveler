import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'readed_chapter_state.dart';

class ReadedChapterCubit extends Cubit<ReadedChapterState> {
  ReadedChapterCubit() : super(ReadedChapterInitial()) {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final ids = prefs.getStringList('readedChaptersIds') ?? [];
      emit(ReadedChapterLoaded(ids));
    } catch (e) {
      emit(const ReadedChapterLoaded([]));
    }
  }

  Future<void> _saveData(List<String> ids) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('readedChaptersIds', ids);
    } catch (e) {
      rethrow;
    }
  }

  void addIDtoCubit(String id) {
    try {
      final currentState = state;
      if (currentState is ReadedChapterLoaded) {
        final updatedIDs = List<String>.from(currentState.ids);
        updatedIDs.add(id);
        emit(ReadedChapterLoaded(updatedIDs));
        _saveData(updatedIDs);
      } else {
      }
    } catch (e) {
      rethrow;
    }
  }

  bool isIdAlreadyAdded(String id) {
    try {
      final currentState = state;
      if (currentState is ReadedChapterLoaded) {
        return currentState.ids.contains(id);
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
