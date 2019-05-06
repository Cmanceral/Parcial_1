
float x2;
float y2;

float rotation = 0;

float a = 0;
void setup() {
  size(1000, 1000);
}

void draw() {
  

  background(50);
  
 
  lines(0,0);

  noStroke();
  fill(255);
  //ellipse(mouseX, mouseY, mouseX, mouseX);
  
  rotation += 0.2;
  a += 0.01;
  
  saveFrame("lines-#####.png");
}

void lines(float posX, float posY) {

  int nLines = 10;
  float cellSize = width/nLines;
  x2 = mouseX;
  y2 = mouseY;
  float x;
  float y;

  for (int i = 0; i < nLines; i++) {
    for (int j = 0; j < nLines; j++) {
      x = (cellSize * i) + posX;
      y = (cellSize * j) + posY;
      float offset = cellSize/2;
      
      float sin = sin(a*0.8)*2;
      color from = color(104, 216, 98);
      color to = color(203, 62, 107);
      color gradient = lerpColor(from, to, sin);

      stroke(gradient, 50);
      float weight = map(mouseX, 0, width, 1, 30);
      strokeWeight(weight);
      //stroke(0, 0, 0, 50);
      pushMatrix();
      translate(x + offset, y + offset);
      rotate(radians(rotation*(i+j)));
      line(0,0, cellSize/2, cellSize/2);
      popMatrix();
      noFill();
     
      ellipse(x+offset,y+offset,cellSize*sin,cellSize*sin);
     
     //rect(x, y, cellSize, cellSize);
    }
  }
}
