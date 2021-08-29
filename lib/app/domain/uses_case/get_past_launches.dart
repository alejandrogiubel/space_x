import 'package:space_x/app/data/repository/space_x_api_graphql.dart';
import 'package:space_x/app/domain/entities/past_launch.dart';
import 'package:space_x/app/domain/repositories_interfaces/space_x_api.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_past_launches.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_rockets.dart';

class GetPastLaunches extends UseCaseGetPastLaunches {
  final ISpaceXApi _spaceXApi = SpaceXApiGraphqlImplement();
  @override
  Future<List<PastLaunch>> call(int limit, int offset) {
    return _spaceXApi.getPastLaunches(limit, offset);
  }

}