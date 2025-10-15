enum RouteScreen {
  login('login'),
  register('register'),
  forgotPassword('forgot-password'),
  home('home'),
  service('service'),
  profile('profile');

  final String name;
  const RouteScreen(this.name);
}
