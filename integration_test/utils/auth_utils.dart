import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../test_users_data.dart';

const String AUTH_CRED_ENDPOINT =
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=YOUR_API_KEY";

Future<String> getIdTokenFromEmailAndPassword(ProfileCredentials profile) async {
  http.Response response;

  debugPrint(
    "Retrieving JWT-token for an authenticated user with credentials: ${profile.email}...",
  );

  response = await http.post(
    Uri.parse(AUTH_CRED_ENDPOINT),
    headers: {"some": "headers"},
    body: json.encode({
      'email': profile.email,
      'password': profile.password,
      'returnSecureToken': true,
    }),
  );

  return json.decode(response.body)['idToken'];
}

const String AUTH_CUSTOM_ENDPOINT =
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=YOUR_API_KEY";

Future<String> getIdTokenFromCustom(String customToken) async {
  http.Response response;

  debugPrint(
    "Retrieving JWT-token for an authenticated user with custom token: ${customToken}...",
  );

  response = await http.post(
    Uri.parse(AUTH_CUSTOM_ENDPOINT),
    headers: {"some": "headers"},
    body: json.encode({
      'token': customToken,
      'returnSecureToken': true,
    }),
  );

  return json.decode(response.body)['idToken'];
}

const String AUTH_ANON_ENDPOINT =
    "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=YOUR_API_KEY";

Future<String> getIdTokenFromApiKey(String customToken) async {
  http.Response response;

  debugPrint(
    "Retrieving JWT-token for a new authenticated anonymous user ...",
  );

  response = await http.post(
    Uri.parse(AUTH_CUSTOM_ENDPOINT),
    headers: {"some": "headers"},
    body: json.encode({
      'returnSecureToken': true,
    }),
  );

  return json.decode(response.body)['idToken'];
}
