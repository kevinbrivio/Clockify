import 'package:clockify/features/activity/business/entities/activity_entity.dart';

abstract class ActivityRepository {
  Future<void> saveActivity(ActivityEntity activity);
  Future<List<ActivityEntity>> getAllActivities();
  Future<ActivityEntity?> getActivityById(String id);
  Future<void> deleteActivity(String id);
}