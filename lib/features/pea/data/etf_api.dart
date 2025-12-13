import 'package:dio/dio.dart';
import 'package:monn/features/pea/domain/etf_quote.dart';
import 'package:retrofit/retrofit.dart';

part 'etf_api.g.dart';

@RestApi(baseUrl: 'https://www.alphavantage.co/')
// ignore: one_member_abstracts
abstract class EtfApi {
  factory EtfApi(Dio dio) = _EtfApi;

  @GET('/query')
  Future<EtfQuoteResponse> getQuote(
    @Query('function') String function,
    @Query('symbol') String symbol,
    @Query('apikey') String apiKey,
  );
}
