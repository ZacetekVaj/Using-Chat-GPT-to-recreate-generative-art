int gridSize = 20; // Change this value to adjust the grid size
color blue = color(30, 60, 200);
color pink = color(240, 100, 150);
color gray = color(150);

void setup() {
  size(400, 400);
  background(255);
  drawPlaid();
}

void drawPlaid() {
  for (int y = 0; y < height; y += gridSize) {
    for (int x = 0; x < width; x += gridSize) {
      boolean drawHorizontal = random(1) > 0.5; // Randomly decide whether to draw horizontal or vertical line
      
      if (drawHorizontal) {
        drawHorizontalLine(x, y);
      } else {
        drawVerticalLine(x, y);
      }
    }
  }
}

void drawHorizontalLine(int x, int y) {
  strokeWeight(2);
  stroke(randomColor());
  line(x, y, x + gridSize, y);
}

void drawVerticalLine(int x, int y) {
  strokeWeight(2);
  stroke(randomColor());
  line(x, y, x, y + gridSize);
}

color randomColor() {
  int rand = int(random(3));
  if (rand == 0) {
    return blue;
  } else if (rand == 1) {
    return pink;
  } else {
    return gray;
  }
}
