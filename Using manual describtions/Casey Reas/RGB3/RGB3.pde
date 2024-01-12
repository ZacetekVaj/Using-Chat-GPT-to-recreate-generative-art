int lineCount = 0;
int period = 0;
int noDrawPeriod = 0;

void setup() {
  size(500, 500);
  background(255);
  plotRGB3(-71, -13, -68); // Example angles: 45°, 90°, 135°
}

void plotRGB3(int redAngle, int greenAngle, int blueAngle) {
  strokeWeight(1); // Adjust this for thinner lines
  int red = color(255, 0, 0, 50); // Adjust alpha (last parameter) for softer colors
  int green = color(0, 255, 0, 50);
  int blue = color(0, 0, 255, 50);
  
  // Red lines
  stroke(red);
  drawLines(radians(redAngle), 5); // Adjust step size for closer lines
  
  // Green lines
  stroke(green);
  drawLines(radians(greenAngle), 5); // Adjust step size for closer lines
  
  // Blue lines
  stroke(blue);
  drawLines(radians(blueAngle), 5); // Adjust step size for closer lines
}

void drawLines(float angle, int stepSize) {
  float diagonal = sqrt(sq(width) + sq(height)); // Diagonal length of canvas
  
  for (float y = -diagonal; y < height + diagonal; y += stepSize) {
    if (noDrawPeriod > 0) { // During no-draw period
      noDrawPeriod--;
    } else {
      if (lineCount < 50) { // Draw 50 lines
        if (true) { // Adjust this probability for lines not being drawn
          float x1 = -diagonal * cos(angle); // Extend beyond canvas width
          float y1 = y - diagonal * sin(angle); // Match y-coordinates for angle continuity
          float x2 = width + diagonal * cos(angle); // Extend beyond canvas width
          float y2 = y + diagonal * sin(angle); // Match y-coordinates for angle continuity
          line(x1, y1, x2, y2);
        }
        lineCount++;
      } else {
        noDrawPeriod = int(random(10, 20)); // Random no-draw period between 50 and 150 iterations
        lineCount = 0; // Reset line counter
      }
    }
  }
}
