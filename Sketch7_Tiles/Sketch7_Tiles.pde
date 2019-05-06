float rotation = 0;
void setup() {
  size(1000, 1000);
}

void draw() {
  background(0);

  int nCells = 40;
  int cellSize = width/nCells;
  float x;
  float y;
  randomSeed(257);
  for (int i = 0; i < nCells; i++) {
    for (int j = 0; j < nCells; j++) {
      float offset = cellSize/2;
      x = (cellSize * i)  ;
      y = (cellSize * j);
      float weight = j;
      weight = map(weight, 0, nCells*2, 1, 3);

      pushMatrix();
      translate(x, y);
      fill(0);
      stroke(255);
      strokeWeight(weight);
      drawTiles(0, 0, cellSize);

      popMatrix();
      fill(255);
      noFill();
      stroke(255, 0, 0);
    }
  }

  rotation += 0.1;
}

void tile1( float x, float y, float size) {
  arc(x, y+size, size*2, size*2, PI*1.5, TWO_PI);
  arc(x, y+size, size, size, PI*1.5, TWO_PI);
  arc(x, y+size, size*0.5, size*0.5, PI*1.5, TWO_PI);

}

void tile2 (float x, float y, float size) {
 
  arc( x+ size, y+size, size*2, size*2, PI, PI*1.5);
  arc( x+ size, y+size, size, size, PI, PI*1.5);  
  arc( x+ size, y+size, size*0.5, size*0.5, PI, PI*1.5);

}

void drawTiles(float x, float y, float size) {

  int coin = floor(random(2));
  if (coin == 0) {
    tile1(x, y, size);
  } else {
    tile2(x, y, size);
  }  
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    saveFrame("Circles-####.png");
  }
}
