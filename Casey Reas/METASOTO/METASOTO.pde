int numLines = 90; // Number of black lines
float[] initialYWhite = new float[numLines]; // Initial Y coordinates for white lines
float[] initialAngle = new float[numLines]; // Initial angles for white lines
float[] speedsWhite = new float[numLines]; // Speed for each white line

float[][] initialCoordinatesBlack; // Initial coordinates for black lines
float[][] initialAnglesBlack; // Initial angles for black lines

void setup() {
  size(800, 800);
  background(0); // Set background to black
  stroke(255); // Set stroke color to white

  initialCoordinatesBlack = new float[numLines][2]; // Storing initial coordinates for black lines
  initialAnglesBlack = new float[numLines][1]; // Storing initial angles for black lines
  
  // Initialize white lines
  for (int i = 0; i < numLines; i++) {
    initialYWhite[i] = random(height);
    initialAngle[i] = random(TWO_PI); // Random initial angles for white lines
    
    // Assigning varied speed ranges to different lines
    if (i % 3 == 0) {
      speedsWhite[i] = random(0.5, 1.5); // Slower speed for lines with index divisible by 3
    } else if (i % 3 == 1) {
      speedsWhite[i] = random(1.5, 3); // Moderate speed for lines with index remainder 1
    } else {
      speedsWhite[i] = random(3, 5); // Faster speed for lines with index remainder 2
    }
  }

  // Initialize black lines
  for (int i = 0; i < numLines; i++) {
    initialCoordinatesBlack[i][0] = random(width); // Random initial x-coordinate for black lines
    initialCoordinatesBlack[i][1] = random(height); // Random initial y-coordinate for black lines
    initialAnglesBlack[i][0] = random(TWO_PI); // Random initial angles for black lines
  }
}

void draw() {
  // Move white lines
  background(0); // Clear the canvas on each frame

  // Draw moving white lines
  for (int i = 0; i < numLines; i++) {
    stroke(255);
    float x1 = width; // Start of line at right edge
    float x2 = map(frameCount % (width * 10), 0, width * 10, width, -width * 9); // End of line extended indefinitely beyond the left edge
    float speedAdjustedX2 = x2 - speedsWhite[i] * (frameCount % (width * 10)); // Adjust speed for slower/faster movement
    float adjustedY = initialYWhite[i] - 20 * tan(initialAngle[i]); // Use initial angle and position
    
    line(x1, initialYWhite[i], speedAdjustedX2, adjustedY); // Draw white lines moving from right to left at their initial angle
  }

  // Draw static black lines (web-like arrangement)
  stroke(0); // Set stroke color to black
  for (int i = 0; i < numLines; i++) {
    float x1 = initialCoordinatesBlack[i][0];
    float y1 = initialCoordinatesBlack[i][1];
    float x2 = x1 + 320 * cos(initialAnglesBlack[i][0]); // Longer black lines in x-direction
    float y2 = y1 + 320 * sin(initialAnglesBlack[i][0]); // Longer black lines in y-direction
    
    line(x1, y1, x2, y2);
  }
}

void mousePressed() {
  // Reset white lines
  for (int i = 0; i < numLines; i++) {
    initialYWhite[i] = random(height);
    
    // Assigning varied speed ranges to different lines
    if (i % 3 == 0) {
      speedsWhite[i] = random(0.5, 1.5); // Slower speed for lines with index divisible by 3
    } else if (i % 3 == 1) {
      speedsWhite[i] = random(1.5, 3); // Moderate speed for lines with index remainder 1
    } else {
      speedsWhite[i] = random(3, 5); // Faster speed for lines with index remainder 2
    }
  }
  

  
}
