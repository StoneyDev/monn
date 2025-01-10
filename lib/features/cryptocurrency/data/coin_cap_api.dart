import 'dart:async';

import 'package:dio/dio.dart';
import 'package:monn/features/cryptocurrency/domain/coin_cap.dart';
import 'package:retrofit/retrofit.dart';

part 'coin_cap_api.g.dart';

@RestApi(baseUrl: 'https://api.coincap.io/v2/')
// ignore: one_member_abstracts (Remove when there are more api calls)
abstract class CoinCapApi {
  factory CoinCapApi(Dio dio) = _CoinCapApi;

  @GET('/assets/{id}')
  Future<CoinCapResponse> getCryptoPriceMarket(@Path() String id);
}
