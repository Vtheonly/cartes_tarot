import 'base_retrieve_options.dart';

class RetrieveOptions extends BaseRetrieveOptions {
  final bool useCache;
  final bool reload;

  const RetrieveOptions({required this.useCache, required this.reload});

  const RetrieveOptions.remoteFetch()
      : useCache = false,
        reload = false;

  const RetrieveOptions.reload()
      : useCache = false,
        reload = true;

  const RetrieveOptions.cacheFetch()
      : useCache = true,
        reload = false;

  @override
  List<Object?> get props => [useCache, reload];
}
