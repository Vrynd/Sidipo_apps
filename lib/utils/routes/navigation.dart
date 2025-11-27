enum RouteScreen {
  login('login'),
  register('register'),
  forgotPassword('forgot-password'),
  home('home'),
  profile('profile'),
  detailService('detail-service');

  final String name;
  const RouteScreen(this.name);
}
