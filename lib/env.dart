import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev')
abstract class Env {
  @EnviedField(varName: 'ACCOUNTID')
  static String account_id = _Env.account_id;

  @EnviedField(varName: 'BEARER')
  static String bearer = _Env.bearer;

  @EnviedField(varName: 'TMDB_API_KEY')
  static String api_key = _Env.api_key;
}
