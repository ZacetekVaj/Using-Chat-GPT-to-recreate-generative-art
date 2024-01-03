int numOfShapes = 50;
color bgColor, shapeColor;

void setup() {
  size(600, 600);
  smooth();
  bgColor = color(240); // White or light background
  shapeColor = color(50, 60, 70); // Deep shade of blue-gray
  background(bgColor);
  drawFabric();
}

void drawFabric() {
  float spacing = width / numOfShapes;
  float halfSpacing = spacing / 2.0;
  
  for (float x = 0; x < width; x += spacing) {
    for (float y = 0; y < height; y += spacing) {
      float rand = random(1);
      if (rand > 0.5) {
        drawCircle(x + halfSpacing, y + halfSpacing, spacing * 0.8);
      } else {
        drawRectangle(x, y, spacing, spacing);
      }
    }
  }
}

void drawCircle(float x, float y, float diameter) {
  fill(shapeColor);
  noStroke();
  ellipse(x, y, diameter, diameter);
}

void drawRectangle(float x, float y, float w, float h) {
  fill(shapeColor);
  noStroke();
  rect(x, y, w, h);
}
