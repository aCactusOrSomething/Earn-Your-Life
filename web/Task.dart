class Task {
  String title;
  //String output;
  int yearCost;
  List<Task> unlockedTasks;

  static final Task FAFF_ABOUT = new Task("Faff about for a year, doing nothing.", 1, []);

  static final Task BUSINESS = new Task("Manage your own business.", 6, []);
  static final Task COLLEGE = new Task("Go to college.", 4, [BUSINESS]);
  static final Task CLERK = new Task("Become a clerk.", 5, []);
  static final Task CONSTRUCTION = new Task("Work in construction.", 3, []);


  static List<Task> defaultTasks = [COLLEGE, CLERK, CONSTRUCTION];

  Task(String title, int yearCost, List<Task> unlockedTasks) {
    this.title = title;
    this.yearCost = yearCost;
    this.unlockedTasks = unlockedTasks;
  }

}