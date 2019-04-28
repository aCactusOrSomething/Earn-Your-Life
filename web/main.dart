import 'dart:html';
import 'dart:math';
import 'displays/Display.dart';
import 'Task.dart';

final int START_AGE = 18; //high school graduation.

int yearMax; //the yeaar you will die. increases with some events.
int age; //your age. start at end of high school.

DivElement ageDisp;
DivElement yearsLeftDisp;
DivElement previousOutputDisp;
DivElement optionsHolderDisp;

List<Task> allowedEvents;
List<Task> lifetimeEvents;

Random rand;
final String INTRO_TEXT =
    "The alarm clock blares, and you shut it off instantly. It is the day of your high school graduation. You are free to make whatever decisions you want with your life now, and you are determined to not waste a single second. <br>Your name is Connie Swift. What will you do now?";

void main() {
  rand = new Random();

  age = 18;
  yearMax = 80;
  lifetimeEvents = [];

  allowedEvents = [
    Task.COLLEGE,
    Task.CONSTRUCTION,
    Task.CLERK,
  ];//start small but it grows over time.


  ageDisp = document.querySelector("#age");
  yearsLeftDisp = document.querySelector("#yearsLeft");
  previousOutputDisp = document.querySelector("#previousOutput");
  optionsHolderDisp = document.querySelector('#optionsHolder');

  updateAgeDisplay();
  updateYearsLeftDisplay();

  previousOutputDisp.children.clear();
  previousOutputDisp.appendHtml(INTRO_TEXT);
  buildOptions();
}

void updateAgeDisplay() {
  ageDisp.children.clear();
  ageDisp.text = "Your AGE: ";
  SevenSegmentDisplay display = new SevenSegmentDisplay(age, 99, "AGE");
  ageDisp.append(display.graphicalDisplay());
}

void updateYearsLeftDisplay() {
  yearsLeftDisp.children.clear();
  yearsLeftDisp.text = "YEARS REMAINING: ";
  SevenSegmentDisplay display = new SevenSegmentDisplay(yearMax - age, 99, "YEARS LEFT");
  yearsLeftDisp.append(display.graphicalDisplay());
}

void buildOptions() {
  optionsHolderDisp.children.clear();
  List<Task> taskPile = [];
  taskPile.addAll(allowedEvents);

  for(int i = 0; i <= 2; i++) {
    DivElement option = new DivElement();
    Task myTask = taskPile.removeAt(rand.nextInt(taskPile.length));
    option.appendText(myTask.title);
    option.setAttribute("id", "option");
    option.onClick.listen((e) => chosenOption(myTask));
    optionsHolderDisp.append(option);
  }
  //you always have the option to be lazy, and it shuffles your cards.
  DivElement faffOption = new DivElement();
  faffOption.appendText(Task.FAFF_ABOUT.title);
  faffOption.setAttribute("id", "option");
  faffOption.onClick.listen((e) => chosenOption(Task.FAFF_ABOUT));
  optionsHolderDisp.append(faffOption);

}

void chosenOption(Task task) {
  lifetimeEvents.add(task);
  for(int i = 0; i < task.unlockedTasks.length; i++) {
    allowedEvents.add(task.unlockedTasks[i]);
  }
  previousOutputDisp.children.clear();
  addDescForTask(task);

  age += task.yearCost;

  if(age >= yearMax) {
    age = yearMax;
    previousOutputDisp.appendHtml("<br> You have died. <br> <br>Are you satisfied with your life?");
    optionsHolderDisp.children.clear();

    DivElement yes = new DivElement();
    yes.text = "Yes (end game.)";
    yes.setAttribute("id", "option");
    yes.onClick.listen((e) => retellMyLife());

    DivElement no = new DivElement();
    no.text = "No (wake up from your dream.)";
    no.setAttribute("id", "option");
    no.onClick.listen((e) => main()); //i feel so dirty for this

    optionsHolderDisp.append(yes);
    optionsHolderDisp.append(no);
  } else {
    buildOptions();
  }
  updateAgeDisplay();
  updateYearsLeftDisplay();

}

void retellMyLife() {
  previousOutputDisp.children.clear();
  optionsHolderDisp.children.clear();
  previousOutputDisp.appendHtml("A retelling of the events of your life:<br>");
  for(int i = 0; i < lifetimeEvents.length; i++) {
    Task task = lifetimeEvents[i];
    addDescForTask(task);
    previousOutputDisp.appendHtml("<br>");
  }
  previousOutputDisp.appendHtml("Connie Swift died satisfied with their life.<br>"
      "<h1>The End.</h1><br>"
      "<h3>Code by Hudson Miller<h3>");
}

void addDescForTask(Task task) {
  SevenSegmentDisplay years = new SevenSegmentDisplay(task.yearCost, task.yearCost, "");
  previousOutputDisp.appendText("You ${task.title.substring(0, task.title.length - 1).toLowerCase()} for ");
  previousOutputDisp.append(years.graphicalDisplay());
  previousOutputDisp.appendText("years.");
}