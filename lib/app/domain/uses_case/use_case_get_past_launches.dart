import 'package:space_x/app/domain/entities/past_launch.dart';

abstract class UseCaseGetPastLaunches {
  Future<List<PastLaunch>> call(int limit, int offset);
}