enum RouteScreen {
  login('login'),
  register('register'),
  forgotPassword('forgot-password'),
  home('home'),
  profile('profile'),
  timelineService('timeline-service');

  final String name;
  const RouteScreen(this.name);
}
