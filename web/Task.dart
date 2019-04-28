class Task {
  String title;
  //String output;
  int yearCost;
  List<Task> unlockedTasks;

  static Task FAFF_ABOUT = new Task("Faff about for a year, doing nothing.", 1, []);

  static Task BUSINESS = new Task("Manage your own business.", 6, []);
  static Task COLLEGE = new Task("Go to college.", 4, [BUSINESS, PROGRAMMER, MEDICINE, PREACH, RESEARCH, TAXES]);
  static Task CLERK = new Task("Become a clerk.", 5, [BUSINESS, TAXES]);
  static Task CONSTRUCTION = new Task("Work in construction.", 3, [SPACESHIP]);
  static Task PLAY_MUSIC = new Task("Play some music.", 2, [ALBUM, ALBUM]);
  static Task ALBUM = new Task("Put together some albums.", 4, []);
  static Task PROGRAMMER = new Task("Get a job in the software industry.", 6, [GAMEDEV]);
  static Task GAMEDEV = new Task("Make a game.", 2,  []);
  static Task ARTSCHOOL = new Task("Go to art school.", 4, [PHOTOGRAPHY, PAINTER]);
  static Task PHOTOGRAPHY = new Task("Set up a photography studio.", 7, []);
  static Task PAINTER = new Task("Engague in painting.", 5, []);
  static Task MILLITARY = new Task("Join the millitary.", 3, [COLLEGE, COLLEGE, AGENT]);
  static Task AGENT = new Task("Work as an undercover agent for the government.", 2, [PENTAGON, ILLUMINATI]);
  static Task PENTAGON = new Task("Handle classified tasks in the Pentagon.", 5, [ILLUMINATI, CONSPIRACY, SPACESHIP]);
  static Task POLICE = new Task("Join the police force.", 3, [AGENT]);
  static Task CRIMINAL = new Task("Do crimes.", 4, []);
  static Task ENLIGHTENMENT = new Task("Search for meaning.", 5, [OCCULT, PREACH, PREACH]);
  static Task PREACH = new Task("Spread the truth.", 4, []);
  static Task OCCULT = new Task("Summon horrific beings.", 3, [ILLUMINATI]);
  static Task ILLUMINATI = new Task("Aid the Illuminati and shape society.", 9, [CONSPIRACY]);
  static Task MEDICINE = new Task("Practice medicine.", 7, [RESEARCH]);

  static Task RESEARCH = new Task("Perform scientific research.", 3, [CONSPIRACY, PENTAGON, SPACESHIP]);
  static Task SERVICE = new Task("Do charity work.", 5, []);
  static Task CHEF = new Task("Work as a chef", 3, [RESTAURANT]);
  static Task RESTAURANT = new Task("Open your own restaurant", 5, []);
  static Task CONSPIRACY = new Task("Look for evidence to confirm your conspiracy theories.", 5, []);
  static Task WATCHMAKER = new Task("Make watches.", 4, []);
  static Task TEACH = new Task("Teach the youth.", 6, [AUTHOR, ADVENTURER]);
  static Task AUTHOR = new Task("Write a very long book.", 2, []); //about how long it took for the Homestuck Epilogues, so
  static Task TAXES = new Task("File other people's taxes.", 3, []);
  static Task ADVERTISE = new Task("Write ads.", 5, [AUTHOR]);
  static Task SPACESHIP = new Task("Build a spaceship.", 3, [MARS]);
  static Task MARS = new Task("Help colonize mars.", 4, []);
  static Task ADVENTURER = new Task("Scour the wilds for adventure.", 3, []);
  static Task ACTIVIST = new Task("Be a political activist.", 2, [CANDIDACY]);
  static Task CANDIDACY = new Task("Run for political office.", 4, []); //either 4, 2, or 6. 4 is a good average though. Connie For President.

  static List<Task> defaultTasks = [COLLEGE, CLERK, CONSTRUCTION, PLAY_MUSIC, MILLITARY, POLICE, CRIMINAL, ARTSCHOOL, ENLIGHTENMENT];

  Task(String title, int yearCost, List<Task> unlockedTasks) {
    this.title = title;
    this.yearCost = yearCost;
    this.unlockedTasks = unlockedTasks;
  }

  /*static void buildDefinitions() {
    FAFF_ABOUT = new Task("Faff about for a year, doing nothing.", 1, []);

    BUSINESS = new Task("Manage your own business.", 6, []);
    COLLEGE = new Task("Go to college.", 4, [BUSINESS, PROGRAMMER, MEDICINE, PREACH, RESEARCH, TAXES]);
    CLERK = new Task("Become a clerk.", 5, [BUSINESS, TAXES]);
    CONSTRUCTION = new Task("Work in construction.", 3, [SPACESHIP]);
    PLAY_MUSIC = new Task("Play some music.", 2, [ALBUM, ALBUM]);
    ALBUM = new Task("Put together some albums.", 4, []);
    PROGRAMMER = new Task("Get a job in the software industry.", 6, [GAMEDEV]);
    GAMEDEV = new Task("Make a game.", 2,  []);
    ARTSCHOOL = new Task("Go to art school.", 4, [PHOTOGRAPHY, PAINTER]);
    PHOTOGRAPHY = new Task("Set up a photography studio.", 7, []);
    PAINTER = new Task("Engague in painting.", 5, []);
    MILLITARY = new Task("Join the millitary.", 3, [COLLEGE, COLLEGE, AGENT]);
    AGENT = new Task("Work as an undercover agent for the government.", 2, [PENTAGON, ILLUMINATI]);
    PENTAGON = new Task("Handle classified tasks in the Pentagon.", 5, [ILLUMINATI, CONSPIRACY, SPACESHIP]);
    POLICE = new Task("Join the police force.", 3, [AGENT]);
    CRIMINAL = new Task("Do crimes.", 4, []);
    ENLIGHTENMENT = new Task("Search for meaning.", 5, [OCCULT, PREACH, PREACH]);
    PREACH = new Task("Spread the truth.", 4, []);
    OCCULT = new Task("Summon horrific beings.", 3, [ILLUMINATI]);
    ILLUMINATI = new Task("Aid the Illuminati and shape society.", 9, [CONSPIRACY]);
    MEDICINE = new Task("Practice medicine.", 7, [RESEARCH]);

    RESEARCH = new Task("Perform scientific research.", 3, [CONSPIRACY, PENTAGON, SPACESHIP]);
    SERVICE = new Task("Do charity work.", 5, []);
    CHEF = new Task("Work as a chef", 3, [RESTAURANT]);
    RESTAURANT = new Task("Open your own restaurant", 5, []);
    CONSPIRACY = new Task("Look for evidence to confirm your conspiracy theories.", 5, [RESEARCH]);
    WATCHMAKER = new Task("Make watches.", 4, []);
    TEACH = new Task("Teach the youth.", 6, [AUTHOR, ADVENTURER]);
    AUTHOR = new Task("Write a very long book.", 2, []); //about how long it took for the Homestuck Epilogues, so
    TAXES = new Task("File other people's taxes.", 3, []);
    ADVERTISE = new Task("Write ads.", 5, [AUTHOR]);
    SPACESHIP = new Task("Build a spaceship.", 3, [MARS]);
    MARS = new Task("Help colonize mars.", 4, []);
    ADVENTURER = new Task("Scour the wilds for adventure.", 3, []);
    ACTIVIST = new Task("Be a political activist.", 2, [CANDIDACY]);
    CANDIDACY = new Task("Run for political office.", 4, []); //either 4, 2, or 6. 4 is a good average though. Connie For President.
  }*/

}