import 'package:space_x/app/domain/entities/rocket.dart';

abstract class UseCaseGetRockets {
  Future<List<Rocket>> call();
}