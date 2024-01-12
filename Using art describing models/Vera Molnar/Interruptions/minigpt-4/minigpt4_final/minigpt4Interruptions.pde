void setup() {
  size(600, 400); // Adjust the canvas size as needed
  background(255); // Set background to white
  
  int numLines = 1000; // Number of lines to draw
  int lineLength = 50; // Length of each line
  int lineThickness = 2; // Thickness of each line
  
  for (int i = 0; i < numLines; i++) {
    float startX = random(width); // Random starting X coordinate
    float startY = random(height); // Random starting Y coordinate
    float angle = random(TWO_PI); // Random angle in radians
    
    float endX = startX + cos(angle) * lineLength; // Calculate end X coordinate
    float endY = startY + sin(angle) * lineLength; // Calculate end Y coordinate
    
    stroke(0); // Set line color to black
    strokeWeight(lineThickness); // Set line thickness
    
    line(startX, startY, endX, endY); // Draw a line from start to end coordinates
  }
}
