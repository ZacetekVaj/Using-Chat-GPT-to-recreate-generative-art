int numCells = 30; // Number of cells in the grid
float cellSize; // Size of each cell
color lightBlue, lightPink, grayBG; // Colors

void setup() {
  size(600, 600);
  lightBlue = color(173, 216, 230); // Define pastel blue
  lightPink = color(255, 182, 193); // Define pastel pink
  grayBG = color(200); // Define gray background
  cellSize = width / numCells;
  background(grayBG);
  drawPlaid();
}

void drawPlaid() {
  for (int y = 0; y < height; y += cellSize) {
    for (int x = 0; x < width; x += cellSize) {
      if (random(1) > 0.5) {
        fill(lightBlue);
      } else {
        fill(lightPink);
      }
      rect(x, y, cellSize, cellSize);
    }
  }
}
