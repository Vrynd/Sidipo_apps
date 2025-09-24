enum RouteScreen {
  login('login'),
  register('register'),
  forgotPassword('forgot_password'),
  home('home'),
  profile('profile');

  final String name;
  const RouteScreen(this.name);
}