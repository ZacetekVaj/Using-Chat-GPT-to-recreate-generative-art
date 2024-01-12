ArrayList<Line> lines; // Arraylist to store lines
ArrayList<PVector> interruptions; // Arraylist to store interrupted areas

void setup() {
  size(900, 900);
  background(255);
  
  lines = new ArrayList<Line>();
  int numLines = 10000; // Number of lines
  
  // Create the initial grid of straight lines
  for (int i = 0; i < numLines; i++) {
    Line line = new Line(random(width), random(height), random(TWO_PI)); // Random x, y, and angle
    lines.add(line);
  }
  
  // Apply rotations
  applyRotations();
  
  // Create interrupted areas
  interruptions = createInterruptions();
  
  // Draw the lines
  for (Line line : lines) {
    line.display();
  }
  
  // Draw interrupted areas
  noStroke();
  fill(255);
  for (PVector interrupt : interruptions) {
    rect(interrupt.x, interrupt.y, 50, 50); // Adjust size of the interrupted areas
  }
}

void applyRotations() {
  // Apply random rotations to each line
  for (Line line : lines) {
    line.rotate(random(-PI/4, PI/4)); // Random rotation within a range
  }
}

ArrayList<PVector> createInterruptions() {
  ArrayList<PVector> interrupts = new ArrayList<PVector>();
  
  // Create interrupted areas by defining regions without lines
  for (int i = 0; i < width; i += 100) {
    for (int j = 0; j < height; j += 100) {
      if (random(1) > 0.9) { // Adjust the probability for interruptions
        interrupts.add(new PVector(i, j));
      }
    }
  }
  
  return interrupts;
}

class Line {
  float x, y, angle;
  float length = 20; // Shorter length of the line
  
  Line(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }
  
  void rotate(float rotation) {
    angle += rotation; // Apply rotation to the angle of the line
  }
  
  boolean isInsideInterruption(float x1, float y1, float x2, float y2) {
    // Check if the line segment intersects with any of the interruptions
    for (PVector interrupt : interruptions) {
      if (x1 >= interrupt.x && x1 <= interrupt.x + 50 && y1 >= interrupt.y && y1 <= interrupt.y + 50) {
        return true;
      }
      if (x2 >= interrupt.x && x2 <= interrupt.x + 50 && y2 >= interrupt.y && y2 <= interrupt.y + 50) {
        return true;
      }
    }
    return false;
  }
  
  void display() {
    // Display the line
    float xEnd = x + cos(angle) * length;
    float yEnd = y + sin(angle) * length;
    
    boolean insideInterruptionStart = isInsideInterruption(x, y, x, y);
    boolean insideInterruptionEnd = isInsideInterruption(xEnd, yEnd, xEnd, yEnd);
    
    if (!insideInterruptionStart && !insideInterruptionEnd) {
      stroke(0);
      strokeWeight(1);
      line(x, y, xEnd, yEnd);
    }
  }
}
