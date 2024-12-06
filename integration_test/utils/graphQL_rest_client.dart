import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../test_users_data.dart';
import 'auth_utils.dart';

class GraphQLRestClient {
  final ProfileCredentials currentProfileCredentials;
  late GraphQLClient client;

  GraphQLRestClient(this.currentProfileCredentials);

  Future<GraphQLRestClient> initialize() async {
    // or any of the other 2 methods provided in code snippets above
    final authToken = await getIdTokenFromEmailAndPassword(currentProfileCredentials);

    // below is the basic example on how to create a GraphQL client

    final httpLink = HttpLink(
      "https://meetcute.app/graphql",
      // authorization in action,
      defaultHeaders: {'Authorization': 'Bearer $authToken'},
    );

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: Link.from([httpLink]),
    );

    return (this);
  }

  Future<void> ensureInitialized() async {
    if (client == null) {
      await initialize();
    }
  }

  Future<void> readAllNotifications() async {
    await ensureInitialized();

    final MutationOptions options = MutationOptions(
      document: gql(
        r'''
        mutation ReadAllNotifications {
          readAllNotifications {
            success
          }
        }
        ''',
      ),
    );

    final QueryResult result = await client.mutate(options);

    debugPrint('${result.data}');
  }

  Future<void> likePost(String postId) async {
    await ensureInitialized();
    // Add mutation logic here
  }

  Future<String> getLastPostId() async {
    await ensureInitialized();
    // Add query logic here
    return ('12345');
  }
}
