int rows = 10; // Number of rows
int cols = 10; // Number of columns
int squareSize = 40; // Size of each square

void setup() {
  size(620, 470); // Size of the canvas
  background(255); // White background
  drawSquares();
}

void drawSquares() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float x = j * squareSize;
      float y = i * squareSize;
      
      // Random grayscale fill for an ashy appearance
      fill(random(100, 200));
      // Draw a square
      rect(x, y, squareSize, squareSize);
    }
  }
}
