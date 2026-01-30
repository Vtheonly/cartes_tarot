import 'base_list_options.dart';

class ListOptions extends BaseListOptions {
  final bool useCache;
  final bool reload;

  const ListOptions({required this.useCache, required this.reload});

  const ListOptions.remoteFetch()
      : useCache = false,
        reload = false;

  const ListOptions.reload()
      : useCache = false,
        reload = true;

  const ListOptions.cacheFetch()
      : useCache = true,
        reload = false;

  @override
  List<Object?> get props => [useCache, reload];
}
