abstract final class Routes {
  static const splash = '/';
  static const search = '/$searchRelative';
  static const searchRelative = 'search';
  static const history = '/$historyRelative';
  static const historyRelative = 'history';
  static const profile = '/$profileRelative';
  static const profileRelative = 'profile';
  static const repository = '/$repositoryRelative';
  static const repositoryRelative = 'repository';
  static String profileWithId(int id) => '$profile/$id';
}