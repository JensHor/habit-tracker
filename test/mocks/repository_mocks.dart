import 'package:habit_tracker/repositories/habit_repository.dart';
import 'package:habit_tracker/repositories/habit_template_repository.dart';
import 'package:mockito/mockito.dart';

//ignore: must_be_immutable
class MockHabitTemplateRepository extends Mock
    implements HabitTemplateRepository {}

//ignore: must_be_immutable
class MockHabitRepository extends Mock implements HabitRepository {}
