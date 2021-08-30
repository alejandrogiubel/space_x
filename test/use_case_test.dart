import 'package:flutter_test/flutter_test.dart';
import 'package:space_x/app/domain/entities/past_launch.dart';
import 'package:space_x/app/domain/entities/rocket.dart';
import 'package:space_x/app/domain/uses_case/get_past_launches.dart';
import 'package:space_x/app/domain/uses_case/get_rockets.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_past_launches.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_rockets.dart';

main() {
  test('Obtener los 4 cohetes de Space X', () async {
    UseCaseGetRockets getRockets = GetRockets();
    List<Rocket> rockets = await getRockets.call();
    expect(rockets.length, 4);
  });

  test('Obtener los lanzamientos pasados', () async {
    UseCaseGetPastLaunches getPastLaunches = GetPastLaunches();
    List<PastLaunch> pastLaunch = await getPastLaunches.call(10, 0);
    expect(pastLaunch, isInstanceOf<List<PastLaunch>>());
  });
}