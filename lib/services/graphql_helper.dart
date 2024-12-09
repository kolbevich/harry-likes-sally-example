import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLHelper {
  late final GraphQLClient _client;
  bool _isInitialized = false;

  GraphQLHelper({GraphQLClient? client}) {
    if (client != null) {
      _client = client;
      _isInitialized = true;
    }
  }

  Future<void> initialize() async {
    if (!_isInitialized) {
      final String authToken = await _getFirebaseAuthToken();

      final HttpLink httpLink = HttpLink(
        "https://meet-cute-api.com/graphql",
        defaultHeaders: {'Authorization': 'Bearer $authToken'},
      );

      _client = GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      );
      _isInitialized = true;
    }
  }

  Future<void> ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }

  // this method gets token for current instance,
  // it depends on the app runtime
  Future<String> _getFirebaseAuthToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      await FirebaseAuth.instance.signInAnonymously();
      user = FirebaseAuth.instance.currentUser;
    }

    final token = await user?.getIdToken() ?? '0';

    return token;
  }

  Future<int> getUnreadNotificationsCount() async {
    await ensureInitialized();

    // final QueryOptions options = QueryOptions(
    //   document: gql('''
    //     query GetUnreadNotificationsCount {
    //       unreadNotificationsCount
    //     }
    //   '''),
    // );

    // final QueryResult result = await _client.query(options);
    // if (result.hasException) {
    //   throw Exception(result.exception.toString());
    // }

    // return result.data?['unreadNotificationsCount'] ?? 0;

    return 1;
  }

  Future<void> likePost(String postId) async {
    await ensureInitialized();

    // final MutationOptions options = MutationOptions(
    //   document: gql('''
    //     mutation LikePost(\$postId: String!) {
    //       likePost(postId: \$postId) {
    //         success
    //       }
    //     }
    //   '''),
    //   variables: {'postId': postId},
    // );

    // final QueryResult result = await _client.mutate(options);
    // if (result.hasException) {
    //   throw Exception(result.exception.toString());
    // }
  }

  Future<void> markAllNotificationsAsRead() async {
    await ensureInitialized();

    // final MutationOptions options = MutationOptions(
    //   document: gql('''
    //     mutation MarkAllNotificationsAsRead {
    //       markAllNotificationsAsRead {
    //         success
    //       }
    //     }
    //   '''),
    // );

    // final QueryResult result = await _client.mutate(options);
    // if (result.hasException) {
    //   throw Exception(result.exception.toString());
    // }
  }

  Future<String> getLastPostId() async {
    // Add query logic here
    return ('12345');
  }
}
