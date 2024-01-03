ArrayList<E4Instance> elements = new ArrayList<E4Instance>(); // List to store instances of E4
ArrayList<PVector> intersections = new ArrayList<PVector>(); // List to store intersection points
ArrayList<PVector> intersectionDisplay = new ArrayList<PVector>(); // List to store displayed intersection points
int numberOfElements = 30; // Number of E4 instances
float maxCircleSize = 50; // Maximum circle size

void setup() {
  size(200,200);
  
  // Create a rectangular surface filled with instances of E4 with varying size ranges
  for (int i = 0; i < numberOfElements; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(10, 50); // Adjusted size range
    float speedX = random(-2, 2);
    float speedY = random(-2, 2);
    elements.add(new E4Instance(x, y, size, speedX, speedY));
  }
}

void draw() {
  background(255);
  
  // Move and display each instance of E4
  for (E4Instance e : elements) {
    e.update();
    e.display();
  }
  
  // Check for intersections between E4 instances
  intersections.clear(); // Clear previous intersections
  
  for (int i = 0; i < elements.size(); i++) {
    for (int j = i + 1; j < elements.size(); j++) {
      PVector intersection = elements.get(i).checkIntersection(elements.get(j));
      if (intersection != null) {
        if (!intersectionDisplay.contains(intersection)) {
          intersectionDisplay.add(intersection);
        }
      }
    }
  }
  
  // Draw circles at displayed intersection points
  noStroke(); // Remove outline
  for (PVector intersection : intersectionDisplay) {
    float sizeGradient = intersection.z;
    fill(getCircleColor(sizeGradient));
    ellipse(intersection.x, intersection.y, sizeGradient / 2, sizeGradient / 2); // Adjusted circle size
  }
}

color getCircleColor(float sizeGradient) {
  color c;
  if (sizeGradient < 10) {
    c = color(0); // Black
  } else if (sizeGradient >= 10 && sizeGradient < 30) {
    c = color(50, 150 + (sizeGradient - 10) * 3, 80); // Camo green
  } else if (sizeGradient >= 30 && sizeGradient < 70) {
    c = color(150 + (sizeGradient - 30) * 2, 150 + (sizeGradient - 30) * 1.5, 150 + (sizeGradient - 30) * 1.25); // Gray
  } else if (sizeGradient >= 70 && sizeGradient < 110) {
    c = color(150 + (sizeGradient - 70) * 1.5, 150 + (sizeGradient - 70) * 1.25, 255); // Gray blue
  } else if (sizeGradient >= 110 && sizeGradient < 150) {
    c = color(255, 180 - (sizeGradient - 110) * 1.5, 220); // Darker pink
  } else {
    c = color(255, 255 - sizeGradient * 3, 255); // White
  }
  return c;
}

class E4Instance {
  float x, y;
  float size;
  float speedX, speedY;

  E4Instance(float xPos, float yPos, float s, float sx, float sy) {
    x = xPos;
    y = yPos;
    size = s;
    speedX = sx;
    speedY = sy;
  }

  void update() {
    x += speedX;
    y += speedY;

    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y < 0 || y > height) {
      speedY *= -1;
    }
  }

  void display() {
    float sizeGradient = map(size, 10, 50, 255, 0); // Mapping size to color gradient
    fill(getCircleColor(sizeGradient));
    ellipse(x, y, size, size);
  }

  PVector checkIntersection(E4Instance other) {
    float distance = dist(x, y, other.x, other.y);
    if (distance < (size + other.size) / 2) {
      float newSize = min(size, other.size); // Set the intersecting size to the minimum size
      return new PVector((x + other.x) / 2, (y + other.y) / 2, newSize);
    }
    return null;
  }
}
