class Task {
  String title;
  //String output;
  int yearCost;

  static final Task FAFF_ABOUT = new Task("Faff about for a year, doing nothing.", 1);

  static final Task UNDERGRAD = new Task("Go to college as an undergraduate.", 4);
  static final Task CLERK = new Task("Become a clerk.", 5);
  static final Task CONSTRUCTION = new Task("Work in construction.", 3);

  static List<Task> defaultTasks = [UNDERGRAD, CLERK, CONSTRUCTION];

  Task(String title, int yearCost) {
    this.title = title;
    this.yearCost = yearCost;
  }

}