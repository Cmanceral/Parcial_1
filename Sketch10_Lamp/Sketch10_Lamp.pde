float rotation = 0;
float increment = 0.1;
void setup() {
  size(1000, 1000);
  smooth();
}

void draw() {
  background(174, 150, 196);

  translate(width/2, 0);
  rotate(radians(rotation));
  if (rotation < -40|| rotation > 40) {
    increment *= -1;
  }
  
  lamp(0, 0);
  rotation += (increment*9.8);

  saveFrame("lamp-####.png");

}

void lamp( float x, float y) {

  stroke(100);
  strokeWeight(2);
  float xSwing = 0;
  line(x, 0, xSwing, height*0.4);
  
  noStroke();
  fill(127);
  beginShape();
  vertex(-100, height*0.4);
  vertex(100, height*0.4);
  vertex(150, height*0.6);
  vertex(-150, height*0.6);
  endShape(CLOSE);

  fill(245, 233, 129);
  beginShape();
  vertex(-150, height*0.6);
  vertex(150, height*0.6);
  vertex(450, height*2);
  vertex(-450, height*2);
  endShape(CLOSE);
}
