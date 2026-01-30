import '../sql/sql_queries.dart';

abstract class SqlQueriesWrapper<ModelSqlQueries extends SqlQueries> {
  ModelSqlQueries sqlQueries();
}
