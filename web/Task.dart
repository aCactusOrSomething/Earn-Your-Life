class Task {
  String title;
  //String output;
  int yearCost;
  List<Task> unlockedTasks;

  static Task FAFF_ABOUT = new Task("Faff about for a year, doing nothing.", 1, []);

  static Task BUSINESS = new Task("Manage your own business.", 6, [CANDIDACY]);
  static Task COLLEGE = new Task("Go to college.", 4, [TEACH, BUSINESS, PROGRAMMER, MEDICINE, ENVIRONMENTALIST, PREACH, RESEARCH, TAXES]);
  static Task CLERK = new Task("Become a clerk.", 5, [BUSINESS, TAXES]);
  static Task CONSTRUCTION = new Task("Work in construction.", 3, [SPACESHIP]);
  static Task PLAY_MUSIC = new Task("Play some music.", 2, [ALBUM, ALBUM]);
  static Task ALBUM = new Task("Put together some albums.", 4, []);
  static Task PROGRAMMER = new Task("Get a job in the software industry.", 6, [GAMEDEV]);
  static Task GAMEDEV = new Task("Make a game.", 2,  []);
  static Task ARTSCHOOL = new Task("Go to art school.", 4, [PHOTOGRAPHY, PAINTER]);
  static Task PHOTOGRAPHY = new Task("Set up a photography studio.", 7, []);
  static Task PAINTER = new Task("Engague in painting.", 5, []);
  static Task MILLITARY = new Task("Join the millitary.", 3, [COLLEGE, COLLEGE, AGENT, CANDIDACY]);
  static Task AGENT = new Task("Work as an undercover agent for the government.", 2, [PENTAGON, ILLUMINATI]);
  static Task PENTAGON = new Task("Handle classified tasks in the Pentagon.", 5, [ILLUMINATI, CONSPIRACY, SPACESHIP, CANDIDACY]);
  static Task POLICE = new Task("Join the police force.", 3, [AGENT]);
  static Task CRIMINAL = new Task("Do crimes.", 4, [DON]);
  static Task ENLIGHTENMENT = new Task("Search for meaning.", 5, [OCCULT, PREACH, PREACH]);
  static Task PREACH = new Task("Spread the truth.", 4, [CONSPIRACY]);
  static Task OCCULT = new Task("Summon horrific beings.", 3, [ILLUMINATI]);
  static Task ILLUMINATI = new Task("Aid the Illuminati and shape society.", 9, [CONSPIRACY, GENETICS]);
  static Task MEDICINE = new Task("Practice medicine.", 7, [RESEARCH]);
  static Task RESEARCH = new Task("Perform scientific research.", 3, [CONSPIRACY, PENTAGON, SPACESHIP, GENETICS]);
  static Task SERVICE = new Task("Do charity work.", 5, [CANDIDACY]);
  static Task CHEF = new Task("Work as a chef.", 3, [RESTAURANT]);
  static Task RESTAURANT = new Task("Open your own restaurant.", 5, []);
  static Task CONSPIRACY = new Task("Look for evidence to confirm your conspiracy theories.", 5, [ACTIVIST,]);
  static Task WATCHMAKER = new Task("Make watches.", 4, []);
  static Task TEACH = new Task("Teach the youth.", 6, [AUTHOR, ADVENTURER]);
  static Task AUTHOR = new Task("Write a very long book.", 2, []); //about how long it took for the Homestuck Epilogues, so
  static Task TAXES = new Task("File other people's taxes.", 3, []);
  static Task ADVERTISE = new Task("Write ads.", 5, [AUTHOR]);
  static Task SPACESHIP = new Task("Build a spaceship.", 3, [MARS]);
  static Task MARS = new Task("Help colonize mars.", 4, []);
  static Task ADVENTURER = new Task("Scour the wilds for adventure.", 3, []);
  static Task ACTIVIST = new Task("Engage in political activism.", 2, [CANDIDACY]);
  static Task CANDIDACY = new Task("Run for political office.", 4, []); //either 4, 2, or 6. 4 is a good average though. Connie For President.
  static Task ENVIRONMENTALIST = new Task("try to save the whales", 5, [CANDIDACY]);
  static Task GENETICS = new Task("perform advanced gene manipulation", 3, []); //your contribitions to science no know bounds
  static Task MAFIA = new Task("Assist the mafia.", 5, [DON]);
  static Task DON = new Task("Become the head of organized crime.", 5, []);
  static List<Task> defaultTasks = [SERVICE, CHEF, WATCHMAKER, ACTIVIST, COLLEGE, CLERK, CONSTRUCTION, PLAY_MUSIC, MILLITARY, POLICE, CRIMINAL, ARTSCHOOL, ENLIGHTENMENT];

  Task(String title, int yearCost, List<Task> unlockedTasks) {
    this.title = title;
    this.yearCost = yearCost;
    this.unlockedTasks = unlockedTasks;
  }

}