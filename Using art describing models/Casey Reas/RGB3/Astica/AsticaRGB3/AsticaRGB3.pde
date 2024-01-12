void setup() {
  size(800, 600);
  background(200); // Set background color to a light gray

  // Drawing the fabric-like pattern
  drawFabricPattern(width / 2, height / 2, 400, 300);
}

void draw() {
  // Sky with fluffy clouds
  drawClouds(width / 2, height / 2, 600, 200, 10);
}

void drawFabricPattern(float x, float y, float w, float h) {
  // Drawing the fabric-like pattern using rectangles and ellipses
  float rectSize = 20;
  float ellipseSize = 30;
  int rows = int(h / rectSize);
  int cols = int(w / rectSize);

  // Loop to create the fabric pattern
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float xPos = x - w / 2 + j * rectSize;
      float yPos = y - h / 2 + i * rectSize;

      if ((i + j) % 2 == 0) {
        fill(255); // White color
      } else {
        fill(100, 120, 140); // Blue-gray color
      }

      rect(xPos, yPos, rectSize, rectSize);

      // Adding ellipses for intricate details
      ellipse(xPos + rectSize / 2, yPos + rectSize / 2, ellipseSize, ellipseSize);
    }
  }
}

void drawClouds(float x, float y, float width, float height, int numClouds) {
  // Draw random fluffy clouds in the sky
  noStroke();
  for (int i = 0; i < numClouds; i++) {
    float cloudX = random(x - width / 2, x + width / 2);
    float cloudY = random(y - height / 2, y + height / 2);
    float cloudSize = random(50, 150);

    fill(255, 240); // White with transparency for clouds
    ellipse(cloudX, cloudY, cloudSize, cloudSize * 0.6);
    ellipse(cloudX + cloudSize * 0.3, cloudY - cloudSize * 0.3, cloudSize * 0.8, cloudSize * 0.6);
    ellipse(cloudX + cloudSize * 0.6, cloudY, cloudSize * 0.8, cloudSize * 0.6);
  }
}
