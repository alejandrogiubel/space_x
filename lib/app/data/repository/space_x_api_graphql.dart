import 'dart:io';
import 'dart:math';

import 'package:graphql/client.dart';
import 'package:space_x/app/domain/entities/past_launch.dart';
import 'package:space_x/app/domain/entities/rocket.dart';
import 'package:space_x/app/domain/repositories_interfaces/space_x_api.dart';

class SpaceXApiGraphqlImplement extends ISpaceXApi {

  GraphQLClient _initGraphqlClient() {
    final _httpLink = HttpLink('https://api.spacex.land/graphql/',);

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );

    return client;
  }

  @override
  Future<List<Rocket>> getRockets() async {
    List<Rocket> rockets = [];
    GraphQLClient client = _initGraphqlClient();
    
    const String readRepositories = r'''
      query getRockets {
        rockets {
          active
          company
          cost_per_launch
          country
          description
          diameter {
            meters
          }
          first_flight
          height {
            meters
          }
          mass {
            kg
          }
          name
          boosters
          engines {
            engine_loss_max
            layout
            number
            propellant_1
            propellant_2
            thrust_sea_level {
              kN
            }
            thrust_to_weight
            thrust_vacuum {
              kN
            }
            type
            version
          }
          stages
          id
        }
      }
    ''';

    QueryOptions queryOptions = QueryOptions(
      document: gql(readRepositories)
    );

    QueryResult queryResult = await client.query(queryOptions);
    List list = queryResult.data!['rockets'];

    list.forEach((element) {
      rockets.add(
        Rocket.fromJson(element)
      );
    });

    return rockets;
  }

  @override
  Future<List<PastLaunch>> getPastLaunches(int limit, int offset) async {
    List<PastLaunch> pastLaunches = [];
    GraphQLClient client = _initGraphqlClient();

    const String readRepositories = r'''
      query getPastLaunches ($limit: Int!, $offset: Int!) {
        launchesPast(limit: $limit, offset: $offset) {
          mission_name
          launch_date_local
          launch_site {
            site_name_long
          }
          links {
            article_link
            video_link
          }
          rocket {
            rocket_name
          }
          ships {
            name
            home_port
            image
          }
        }
      }
    ''';

    QueryOptions queryOptions = QueryOptions(
      document: gql(readRepositories),
      variables: <String, dynamic>{
        'limit': limit,
        'offset': offset,
      },
    );
    
    QueryResult queryResult = await client.query(queryOptions);
    List list = queryResult.data!['launchesPast'];

    list.forEach((element) {
      pastLaunches.add(
        PastLaunch.fromJson(element)
      );
    });

    return pastLaunches;
  }

}