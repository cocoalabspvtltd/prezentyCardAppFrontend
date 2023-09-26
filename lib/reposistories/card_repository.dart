import 'package:flutter/material.dart';
import 'package:prezenty_card_app/models/card_fetch_reponse.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';
import 'package:prezenty_card_app/utils/user.dart';


class CardRepository {
  late ApiProvider apiClient;

  CardRepository() {
    apiClient = ApiProvider();
  }

  Future<CardFetchResponse> cardFetchDetails(String card_number) async {
    final response =
    await apiClient.getJsonInstanceAuth(UserDetails.apiToken).post(Apis.cardFetchDetails, data: {"card_number":card_number});
    print("Response->${response.data }");
    return CardFetchResponse.fromJson(response.data);
  }

}