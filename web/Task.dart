class Task {
  String title;
  //String output;
  int yearCost;
  List<Task> unlockedTasks;

  static final Task FAFF_ABOUT = new Task("Faff about for a year, doing nothing.", 1, []);

  static final Task BUSINESS = new Task("Manage your own business.", 6, []);
  static final Task COLLEGE = new Task("Go to college.", 4, [BUSINESS, PROGRAMMER, MEDICINE, PREACH]);
  static final Task CLERK = new Task("Become a clerk.", 5, [BUSINESS]);
  static final Task CONSTRUCTION = new Task("Work in construction.", 3, []);
  static final Task PLAY_MUSIC = new Task("Play some music.", 2, [ALBUM, ALBUM]);
  static final Task ALBUM = new Task("Put together some albums.", 4, []);
  static final Task PROGRAMMER = new Task("Get a job in the software industry.", 6, [GAMEDEV]);
  static final Task GAMEDEV = new Task("Make a game.", 2,  []);
  static final Task ARTSCHOOL = new Task("Go to art school.", 4, [PHOTOGRAPHY, PAINTER]);
  static final Task PHOTOGRAPHY = new Task("Set up a photography studio.", 7, []);
  static final Task PAINTER = new Task("Engague in painting.", 5, []);
  static final Task MILLITARY = new Task("Join the millitary.", 3, [COLLEGE, COLLEGE, AGENT]);
  static final Task AGENT = new Task("Work as an undercover agent for the government.", 2, [PENTAGON, ILLUMINATI]);
  static final Task PENTAGON = new Task("Handle classified tasks in the Pentagon.", 5, [ILLUMINATI]);
  static final Task POLICE = new Task("Join the police force.", 3, [AGENT]);
  static final Task CRIMINAL = new Task("Do crimes.", 4, []);
  static final Task ENLIGHTENMENT = new Task("Search for meaning.", 5, [OCCULT, PREACH, PREACH]);
  static final Task PREACH = new Task("Spread the truth.", 4, []);
  static final Task OCCULT = new Task("Summon horrific beings.", 3, [ILLUMINATI]);
  static final Task ILLUMINATI = new Task("Aid the Illuminati and shape society.", 9, []);
  static final Task MEDICINE = new Task("Practice medicine.", 7, []);

  static final Task RESEARCH = new Task("Perform scientific research.", 3, []);
  static final Task SERVICE = new Task("Do charity work.", 5, []);
  static final Task CHEF = new Task("Work as a chef", 3, []);
  static final Task RESTAURANT = new Task("Open your own restaurant", 5, []);
  static final Task CONSPIRACY = new Task("Look for evidence to confirm your conspiracy theories.", 5, []);
  static final Task WATCHMAKER = new Task("Make watches.", 4, []);
  static final Task TEACH = new Task("Teach the youth.", 6, []);
  static final Task AUTHOR = new Task("Write a very long book.", 2, []); //about how long it took for the Homestuck Epilogues, so
  static final Task TAXES = new Task("File other people's taxes.", 3, []);
  static final Task ADVERTISE = new Task("Write ads.", 5, []);
  static final Task SPACESHIP = new Task("Build a spaceship.", 3, []);
  static final Task MARS = new Task("Help colonize mars.", 4, []);
  static final Task ADVENTURER = new Task("Scour the wilds for adventure.", 3, []);
  static final Task ACTIVIST = new Task("Be a political activist.", 2, []);
  static final Task CANDIDACY = new Task("Run for political office.", 4, []); //either 4, 2, or 6. 4 is a good average though. Connie For President.

  static List<Task> defaultTasks = [COLLEGE, CLERK, CONSTRUCTION, PLAY_MUSIC, MILLITARY, POLICE, CRIMINAL, ARTSCHOOL, ENLIGHTENMENT];

  Task(String title, int yearCost, List<Task> unlockedTasks) {
    this.title = title;
    this.yearCost = yearCost;
    this.unlockedTasks = unlockedTasks;
  }

}