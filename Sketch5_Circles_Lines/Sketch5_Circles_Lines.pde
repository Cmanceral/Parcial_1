float rotation = 0;
float start;
float end;
void setup(){
  frameRate(23.97);
  size(1000,1000);
  background(0);
}

void draw(){
  //background(255);
  noFill();
  //fill(255,0,0,10);
  stroke(255,30);
  start = map(mouseX, 0, width, 0, PI);
  end = map(mouseY, 0, height, PI, TWO_PI);
  
  
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(rotation));
   arc(0, 0, mouseX, mouseY, start, end);
  popMatrix();
  
  rotation+=1;
  
  saveFrame("Circles_Lines-#####.png");
}
