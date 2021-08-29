import 'package:space_x/app/data/repository/space_x_api_graphql.dart';
import 'package:space_x/app/domain/entities/rocket.dart';
import 'package:space_x/app/domain/repositories_interfaces/space_x_api.dart';
import 'package:space_x/app/domain/uses_case/use_case_get_rockets.dart';

class GetRockets extends UseCaseGetRocket {
  final ISpaceXApi _spaceXApi = SpaceXApiGraphqlImplement();
  @override
  Future<List<Rocket>> call() {
    return _spaceXApi.getRockets();
  }

}