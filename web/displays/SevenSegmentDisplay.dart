import 'Display.dart';
import 'dart:svg';



class SevenSegmentDisplay extends Display {
  static final int WIDTH_CONSTANT = 2;
  //static final
  //todo visually: make segments thicker, make unused ones more dull.
  static final Map<int, List<int>> SEGMENT_MAP = {
    -1: [], //nothing for this value
    0 : [0, 2, 3, 5, 6, 7, 8, 9],
    1 : [0, 4, 5, 6, 8, 9],
    2 : [0, 1, 2, 3, 4, 7, 8, 9],
    3 : [2, 3, 4, 5, 6, 8, 9],
    4 : [0, 2, 6, 8],
    5 : [0, 1, 3, 4, 5, 6, 7, 8, 9],
    6 : [0, 2, 3, 5, 6, 8, 9]
  };
  int value;
  int maxValue;
  String label;

  @override
  int getTypeId(){
    return SEVEN_SEGMENT_ID;
  }

  SevenSegmentDisplay(int value, int maxValue, String label){
    this.value = value;
    this.maxValue = maxValue;
    this.label = label;
  }

  @override
  int getValue(){
    return value;
  }

  @override
  int getMaxValue(){
    return maxValue;
  }

  @override
  String getLabel() {
    return label;
  }

  @override
  SvgSvgElement graphicalDisplay() {


    SvgSvgElement ret = new SvgSvgElement();
    ret.setAttribute("height", "56");
    ret.setAttribute("width", "${33 * getNumOfDigits(maxValue)}");

    //setup for glow
    DefsElement defs = new DefsElement();
    FilterElement glowFilter = new FilterElement();
    glowFilter.id = "glow";

    FEGaussianBlurElement blurElement = new FEGaussianBlurElement();
    blurElement.setAttribute("stdDeviation", "3");

    glowFilter.append(blurElement);
    defs.append(glowFilter);

    FilterElement transparencyFilter = new FilterElement();
    transparencyFilter.id = "transparent";

    FEColorMatrixElement matrixElement = new FEColorMatrixElement();
    matrixElement.setAttribute("values",
        "1 0 0 0 0 "
            "0 1 0 0 0 "
            "0 0 1 0 0 "
            "0 0 0 0.3 0 ");
    transparencyFilter.append(matrixElement);
    defs.append(transparencyFilter);

    ret.append(defs);

    //add back panel
    /*RectElement panel = new RectElement();
    panel.setAttribute("x", "0");
    panel.setAttribute("y", "0");
    panel.setAttribute("height", "56");
    panel.setAttribute("width", "${31 * getNumOfDigits(maxValue)}");
    panel.setAttribute("fill", "#FFFFFF");
    ret.append(panel);
    */
    for(int i = 0; i < getNumOfDigits(maxValue); i++) {
      int digit = -1; //not a digit, so if the below conditions aren't met no segment will be lit
      if(getNumOfDigits(maxValue) - i > getNumOfDigits(maxValue) - getNumOfDigits(value)) {
        //print("${getNumOfDigits(maxValue)} - $i > ${getNumOfDigits(maxValue)} - ${getNumOfDigits(value)}");
        digit = int.parse(value.toString().substring(i, i + 1));
        //print(digit);
      }else if(getNumOfDigits(maxValue) - i == getNumOfDigits(maxValue) - getNumOfDigits(value) && getNumOfDigits(value) != 1){
        //print("${getNumOfDigits(maxValue)} - $i == ${getNumOfDigits(maxValue)} - ${getNumOfDigits(value)}");
        if(value == 0) {
          digit = 0;
        } else {
          digit = int.parse(value.toString().substring(0));
        }
        //print(digit);
      }

      int absX = 34 * i;
      for(int j = 0; j < 7; j++) {
        Segment segment;
        segment = Segment.makeSegmentForPortion(j, absX);
        bool isLit = false;
        if(SEGMENT_MAP[j].contains(digit)) {
          isLit = true;
        }
        RectElement rect = segment.makeGraphical(isLit, false);
        ret.append(rect);
        if(isLit) {
          RectElement glow = segment.makeGraphical(isLit, true);
          ret.append(glow);
        }
      }
    }


    return ret;
  }

  int getNumOfDigits(int number) {

    if(number.toString().length > 0) {
      return number.toString().length;
    }
    return 1;
  }
}

/*
    AA
   B  C
    DD
   E  F
    GG
    segments are 22 * 4, whole digit is 30 * 54.
 */
class Segment {
  bool isVertical;
  int startX;
  int startY;

  Segment(int startX, int startY, bool isVertical) {
    this.startX = startX;
    this.startY = startY;
    this.isVertical = isVertical;
  }

  RectElement makeGraphical(bool isLit, bool makeGlow) {
    RectElement ret = new RectElement();
    ret.setAttribute("x", "$startX");
    ret.setAttribute("y", "$startY");

    if(isVertical) {
      ret.setAttribute("width", "4");
      ret.setAttribute("height", "22");
    } else {
      ret.setAttribute("width", "22");
      ret.setAttribute("height", "4");
    }

    if(makeGlow) {
      ret.setAttribute("fill", "#FF8888");
      ret.setAttribute("filter", "url(#glow)");
    }else if(isLit) {
      ret.setAttribute("fill", "#FF0000");
    } else {
      ret.setAttribute("fill", "#AAAAAA");
    }

    return ret;
  }

  static Segment make0(int startX) {
    return new Segment(startX + 4, 0, false);
  }

  static Segment make1(int startX) {
    return new Segment(startX, 4, true);
  }

  static Segment make2(int startX) {
    return new Segment(startX + 26, 4, true);
  }

  static Segment make3(int startX) {
    return new Segment(startX + 4, 26, false);
  }

  static Segment make4(int startX) {
    return new Segment(startX, 30, true);
  }

  static Segment make5(int startX) {
    return new Segment(startX + 26, 30, true);
  }

  static Segment make6(int startX) {
    return new Segment(startX + 4, 52, false);
  }

  static Segment makeSegmentForPortion(int segmentId, int startX) {
    Segment ret;
    if(segmentId == 0)
      ret = make0(startX);
    if(segmentId == 1)
      ret = make1(startX);
    if(segmentId == 2)
      ret = make2(startX);
    if(segmentId == 3)
      ret = make3(startX);
    if(segmentId == 4)
      ret = make4(startX);
    if(segmentId == 5)
      ret = make5(startX);
    if(segmentId == 6)
      ret = make6(startX);
    return ret;
  }


}