import 'dart:async';

import 'package:dio/dio.dart';
import 'package:monn/features/cryptocurrency/domain/coin_market_cap.dart';
import 'package:retrofit/retrofit.dart';

part 'coin_market_cap_api.g.dart';

@RestApi(baseUrl: 'https://pro-api.coinmarketcap.com/')
// ignore: one_member_abstracts (Remove when there are more api calls)
abstract class CoinMarketCapApi {
  factory CoinMarketCapApi(Dio dio) = _CoinMarketCapApi;

  @GET('/v2/cryptocurrency/quotes/latest')
  Future<CoinMarketCapResponse> getCryptoPriceMarket(
    @Query('slug') String slug,
  );
}
