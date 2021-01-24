import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker/models/habit_template.dart';
import 'package:habit_tracker/models/id.dart';
import 'package:habit_tracker/repositories/habit_template_repository.dart';
import 'package:meta/meta.dart';
part 'habit_template_event.dart';
part 'habit_template_state.dart';

class HabitTemplateBloc extends Bloc<HabitTemplateEvent, HabitTemplateState> {
  HabitTemplateRepository repository;

  HabitTemplateBloc({
    @required this.repository,
    HabitTemplateState state,
  }) : super(
          state ?? HabitTemplateState.uninitialized(),
        );

  @override
  Stream<HabitTemplateState> mapEventToState(
    HabitTemplateEvent event,
  ) async* {
    if (event is HabitTemplateLoading) {
      _mapHabitTemplateLoadingToState();
    }
    if (event is HabitTemplateLoaded) {
      yield* _mapHabitTemplateLoadedToState(event);
    }
    if (event is HabitTemplateAdded) {
      yield* _mapHabitTemplateAddedToState(event);
    }
    if (event is HabitTemplateDeleted) {
      yield* _mapHabitTemplateDeletedToState(event);
    }
  }

  void _mapHabitTemplateLoadingToState() {
    repository.getStreamOfItems().forEach(
          (List<HabitTemplate> habitTemplates) => add(
            HabitTemplateLoaded(habitTemplates),
          ),
        );
  }

  Stream<HabitTemplateState> _mapHabitTemplateLoadedToState(
      HabitTemplateLoaded event) async* {
    yield HabitTemplateState.loaded(
      HashMap<String, HabitTemplate>.fromIterable(
        event.habitTemplates,
        key: (k) => k.id.value,
        value: (v) => v,
      ),
    );
  }

  Stream<HabitTemplateState> _mapHabitTemplateDeletedToState(
      HabitTemplateDeleted event) async* {
    repository.deleteItem(event.habitTemplate);
  }

  Stream<HabitTemplateState> _mapHabitTemplateAddedToState(
      HabitTemplateAdded event) async* {
    await repository.addItem(event.habitTemplate);
  }
}
