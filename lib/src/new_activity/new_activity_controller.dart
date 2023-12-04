import 'package:flutter/material.dart';
import 'package:unwind_app/dto/activity_dto.dart';
import 'package:unwind_app/model/activity.dart';
import 'package:unwind_app/model/period.dart';
import 'package:unwind_app/src/new_activity/new_activity_service.dart';

class NewActivityController with ChangeNotifier {
  NewActivityController(this._periodDetailsService);

  final NewActivityService _periodDetailsService;

  final Map<int, List<Activity>> _activities = {};
  List<Activity> activities(int periodId) => _activities[periodId] ?? [];

  void initActivities(List<Period> periods) {
    for (final period in periods) {
      _activities[period.id] = period.activities;
    }

    notifyListeners();
  }

  Future<void> createActivity(int periodId, Activity activity) async {
    final dto = activityToDTO(activity);
    final newDTO = await _periodDetailsService.createActivity(periodId, dto);
    activities(periodId).add(Activity.fromDTO(newDTO));
    notifyListeners();
  }

  Future<void> editActivity(int periodId, Activity activity) async {
    final dto = activityToDTO(activity);
    await _periodDetailsService.editActivity(periodId, activity.id, dto);

    final oldActivities = activities(periodId);
    oldActivities[oldActivities.indexWhere((a) => a.id == activity.id)] =
        activity;
    _activities[periodId] = oldActivities;
    notifyListeners();
  }

  Future<void> removeActivity(int periodId, int activityId) async {
    await _periodDetailsService.removeActivity(periodId, activityId);

    final oldActivities =
        activities(periodId).where((a) => a.id != activityId).toList();
    _activities[periodId] = oldActivities;
    notifyListeners();
  }
}
