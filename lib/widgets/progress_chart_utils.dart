import 'package:weight_tracker/model/weight_entry.dart';

/// Removes entries that are before beginningDate
/// Adds an entry at the beginning of list if there is one before and after beginningDate
List<WeightEntry> prepareEntryList(
    List<WeightEntry> initialEntries, DateTime beginningDate) {
  List<WeightEntry> entries = initialEntries
      .where((entry) =>
          entry.dateTime.isAfter(beginningDate) ||
          copyDateWithoutTime(entry.dateTime)
              .isAtSameMomentAs(copyDateWithoutTime(beginningDate)))
      .toList();
  if (entries.isNotEmpty &&
      _isMissingEntryFromBeginningDate(beginningDate, entries) &&
      _isAnyEntryBeforeBeginningDate(beginningDate, initialEntries)) {
    _addFakeEntryOnTheChartBeginning(initialEntries, entries, beginningDate);
  }
  return entries;
}

