import 'package:space_x/app/domain/entities/rocket.dart';

abstract class UseCaseGetRocket {
  Future<List<Rocket>> call();
}