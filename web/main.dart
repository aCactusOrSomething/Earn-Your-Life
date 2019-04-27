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

Random rand;
final String INTRO_TEXT =
    "The alarm clock blares, and you shut it off instantly. It is the day of your high school graduation. You are free to make whatever decisions you want with your life now, and you are determined to not waste a single second. <br>Your name is Connie Swift. What will you do now?";

void main() {
  rand = new Random();

  age = 18;
  yearMax = 80;
  allowedEvents = [
    Task.UNDERGRAD,
    Task.CONSTRUCTION,
    Task.CLERK,
  ];

  ageDisp = document.querySelector("#age");
  yearsLeftDisp = document.querySelector("#yearsLeft");
  previousOutputDisp = document.querySelector("#previousOutput");
  optionsHolderDisp = document.querySelector('#optionsHolder');

  updateAgeDisplay();
  updateYearsLeftDisplay();

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
  previousOutputDisp.children.clear();
  previousOutputDisp.appendText("You ${task.title}");

  age += task.yearCost;

  if(age >= yearMax) {
    age = yearMax;
    previousOutputDisp.appendHtml("<br> You have died.");
    optionsHolderDisp.children.clear();
  } else {
    buildOptions();
  }
  updateAgeDisplay();
  updateYearsLeftDisplay();

}