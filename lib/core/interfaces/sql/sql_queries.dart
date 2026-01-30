import '../../entities/sql_database/helper/sql_query_args_v1.dart';
import '../../entities/sql_database/helper/sql_query_raw_v1.dart';

abstract class SqlQueries {
  QueryArgs generateQueryArgs();
  QueryRaw generateQueryRaw();
  QueryRaw generateCountQueryRaw();
}
