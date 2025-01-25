import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'google_finance_api.g.dart';

@RestApi(baseUrl: 'https://www.google.com/finance/')
// ignore: one_member_abstracts (Remove when there are more api calls)
abstract class GoogleFinanceApi {
  factory GoogleFinanceApi(Dio dio) = _GoogleFinanceApi;

  @GET('/quote/{stock}?hl=fr')
  Future<String> getEftPriceMarket(@Path() String stock);
}
