int minNumSquares = 5; // Minimum number of concentric squares inside each square
int maxNumSquares = 8; // Maximum number of concentric squares inside each square
float maxRotationOuter = PI / 64; // Maximum rotation angle for outer squares (reduced)
float maxRotationInner = PI / 128; // Maximum rotation angle for inner squares (reduced further)
int gridSize = 20; // Number of squares in the grid
float squareSpacing = 0; // Spacing between squares

void setup() {
  size(800, 800);
  background(255);
  smooth();
  noFill();
  stroke(0);
  rectMode(CENTER);
  
  float squareSize = width / gridSize; // Size for each square
  
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      float posX = (j + 0.5) * (squareSize + squareSpacing);
      float posY = (i + 0.5) * (squareSize + squareSpacing);
      int numSquares = int(random(minNumSquares, maxNumSquares + 1));
      float rotation = random(-maxRotationOuter, maxRotationOuter);
      drawConcentricSquares(posX, posY, squareSize, numSquares, rotation);
    }
  }
}

void drawConcentricSquares(float x, float y, float size, int numSquares, float rotation) {
  float stepSize = size / numSquares;
  
  for (int i = 0; i < numSquares; i++) {
    float newSize = stepSize * (i + 1);
    float newRotation = random(-maxRotationInner, maxRotationInner);
    drawConcentricSquare(x, y, newSize, newRotation);
  }
}

void drawConcentricSquare(float x, float y, float size, float rotation) {
  pushMatrix();
  translate(x, y);
  rotate(rotation);
  rect(0, 0, size, size);
  popMatrix();
}
