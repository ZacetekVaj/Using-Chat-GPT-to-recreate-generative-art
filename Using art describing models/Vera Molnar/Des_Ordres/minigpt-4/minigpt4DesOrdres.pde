int gridSize = 10; // Change the number of squares per side
int squareSize; // Variable to hold the size of each square

void setup() {
  size(500, 500);
  squareSize = width / gridSize;
  noLoop();
}

void draw() {
  background(255);
  drawSquares(width/2, height/2, squareSize, gridSize);
}

void drawSquares(float x, float y, float size, int level) {
  if (level > 0) {
    float grayValue = map(level, gridSize, 0, 255, 50);
    fill(grayValue);
    rectMode(CENTER);
    rect(x, y, size, size);
    
    float newSize = size / 2;
    level--;

    for (int i = 0; i < 4; i++) {
      float xOffset = (i % 2 == 0) ? newSize : -newSize;
      float yOffset = (i < 2) ? -newSize : newSize;
      drawSquares(x + xOffset, y + yOffset, newSize, level);
    }
  }
}
