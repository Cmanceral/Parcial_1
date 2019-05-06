float a = 0;


void setup() {
  size(1000, 1000);
  smooth();
}

void draw() {
  background(0);
  int nLines = 50;
  int offset = height/nLines;
  int y = 0;
  int x = 0;



  for (int i = 0; i < nLines; i++) {
    float sine = sin(a+(i*0.01));
    sine = map(sine, -1, 1, -width*0.1, width*0.1);
    color end = color(31, 196, 227);
    color start = color(11, 80, 152);
    color grade = lerpColor(start, end, sine*0.3);
    y = offset * i;
    noFill();
    stroke(grade);
    //fill(0);
    bezier(x, y, x+(sine*i), y+(sine*i), width-(sine*i), y-(sine*i), width, y);
  }

  a+=0.01;
  saveFrame("sineCurves-#####.png");
}
