import 'package:graphql/client.dart';
import 'package:harry_likes_sally_example/services/graphql_helper.dart';

import '../test_users_data.dart';
import 'auth_utils.dart';

class GraphQLRestClient {
  final ProfileCredentials currentProfileCredentials;
  late GraphQLClient client;

  GraphQLRestClient(this.currentProfileCredentials);

  Future<GraphQLRestClient> initialize() async {
    // or any of other 2 methods in auth_utils.dart
    final authToken = await getIdTokenFromEmailAndPassword(currentProfileCredentials);

    final httpLink = HttpLink(
      "https://meet-cute-api.com/graphql",
      defaultHeaders: {'Authorization': 'Bearer $authToken'},
    );

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: Link.from([httpLink]),
    );

    return (this);
  }

  Future<void> readAllNotifications() async {
    await GraphQLHelper(client: client).markAllNotificationsAsRead();
  }

  Future<void> likePost(String postId) async {
    await GraphQLHelper(client: client).likePost(postId);
  }

  Future<String> getLastPostId() async {
    final postId = await GraphQLHelper(client: client).getLastPostId();

    return postId;
  }
}
