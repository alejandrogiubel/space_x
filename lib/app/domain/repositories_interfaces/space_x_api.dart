import 'package:space_x/app/domain/entities/past_launch.dart';
import 'package:space_x/app/domain/entities/rocket.dart';

abstract class ISpaceXApi {
  Future<List<Rocket>> getRockets ();
  Future<List<PastLaunch>> getPastLaunches (int limit, int offset);
}