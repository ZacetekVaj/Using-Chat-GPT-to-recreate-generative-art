# Casey Reas - Process 14 (software 3)
**Komentar:**
Ker je v nekaterih korakih zelo malo sprememb ali pa so komaj opazne, so dokumentirani le pomembnejši koraki.
### Pogovor s chat - gpt:
**Vprašanje:**
Could you write code in processing for E4 with the following describtion (it should use the definition of E4 written below):

Forms
F1: Circle
F2: Line


Behaviors
B1: Move in a straight line
B2: Constrain to surface
B3: Change direction while touching another Element
B4: Move away from an overlapping Element
B5: Enter from the opposite edge after moving off the surface
B6: Orient toward the direction of an Element that is touching
B7: Deviate from the current direction


Elements
E1: F1 + B1 + B2 + B3 + B4
E2: F1 + B1 + B5
E3: F2 + B1 + B3 + B5
E4: F1 + B1 + B2 + B3
E5: F2 + B1 + B5 + B6 + B7
**Koda iz odgovora in rezultat:**
```java
float x, y; // Position of the circle
float speedX, speedY; // Speed of movement

void setup() {
  size(400, 400); // Canvas size
  x = random(width);
  y = random(height);
  speedX = random(-2, 2); // Random initial speed
  speedY = random(-2, 2);
}

void draw() {
  background(255); // Clear the screen

  // Move the circle
  x += speedX;
  y += speedY;

  // Constrain the circle within the canvas
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);

  // Display the circle
  fill(0);
  ellipse(x, y, 20, 20);

  // Check for wall collisions and change direction
  if (x <= 0 || x >= width) {
    speedX *= -1;
  }
  if (y <= 0 || y >= height) {
    speedY *= -1;
  }
}

void mousePressed() {
  // Change direction if clicked within the canvas
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    speedX = random(-2, 2);
    speedY = random(-2, 2);
  }
}


```
**Slika:**
![Prvi poskus](image.png)

**Vprašanje:**
Now use E4, code you wrote and this describtion to create a code in processing for it: A rectangular surface filled with instances of E4, each with a different size and direction. Display the intersections of E4 by drawing a circle at each point of contact. Set the size of each circle relative to the distance between the centers of the overlapping E4's. Draw the smallest possible circle as white and the largest as black, with varying grays representing sizes in between. E4 needs to still be defined by the code as previously
**Koda iz odgovora in rezultat:**
```java
ArrayList<E4Instance> elements = new ArrayList<E4Instance>(); // List to store instances of E4
ArrayList<PVector> intersections = new ArrayList<PVector>(); // List to store intersection points

void setup() {
  size(600, 400);
  
  // Create a rectangular surface filled with instances of E4
  for (int i = 0; i < 8; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(20, 60);
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
        intersections.add(intersection);
      }
    }
  }
  
  // Draw circles at intersection points with varying sizes and colors
  for (PVector intersection : intersections) {
    float maxDistance = sqrt(sq(width) + sq(height));
    float distance = dist(0, 0, intersection.x, intersection.y);
    float grayValue = map(distance, 0, maxDistance, 255, 0);
    fill(grayValue);
    ellipse(intersection.x, intersection.y, grayValue / 10, grayValue / 10);
  }
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
    fill(0);
    ellipse(x, y, size, size);
  }

  PVector checkIntersection(E4Instance other) {
    float distance = dist(x, y, other.x, other.y);
    if (distance < (size + other.size) / 2) {
      return new PVector((x + other.x) / 2, (y + other.y) / 2);
    }
    return null;
  }
}
```
**Slika:**
![Drugi poskus](image-1.png)

**Vprašanje:**
Add more colors, biggest circle should be black, color should go from black to camo green, gray, gray blue, pink and at the end smallest circles should be white. Remove the outline for circles.
**Koda iz odgovora in rezultat:**
```java
ArrayList<E4Instance> elements = new ArrayList<E4Instance>(); // List to store instances of E4
ArrayList<PVector> intersections = new ArrayList<PVector>(); // List to store intersection points

void setup() {
  size(600, 400);
  
  // Create a rectangular surface filled with instances of E4
  for (int i = 0; i < 8; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(20, 60);
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
        intersections.add(intersection);
      }
    }
  }
  
  // Draw circles at intersection points with varying sizes and colors
  noStroke(); // Remove outline
  for (PVector intersection : intersections) {
    float maxDistance = sqrt(sq(width) + sq(height));
    float distance = dist(0, 0, intersection.x, intersection.y);
    float sizeGradient = map(distance, 0, maxDistance, 255, 0);
    fill(getCircleColor(sizeGradient));
    ellipse(intersection.x, intersection.y, sizeGradient / 10, sizeGradient / 10);
  }
}

color getCircleColor(float sizeGradient) {
  color c;
  if (sizeGradient < 40) {
    c = color(0); // Black
  } else if (sizeGradient >= 40 && sizeGradient < 85) {
    c = color(50, 100 + (sizeGradient - 40) * 1.75, 80); // Camo green
  } else if (sizeGradient >= 85 && sizeGradient < 130) {
    c = color(sizeGradient - 85); // Gray
  } else if (sizeGradient >= 130 && sizeGradient < 170) {
    c = color(100, 100 + (sizeGradient - 130) * 1.5, 150); // Gray blue
  } else if (sizeGradient >= 170 && sizeGradient < 210) {
    c = color(255, 180 - (sizeGradient - 170) * 1.5, 220); // Darker pink
  } else {
    c = color(255, 255 - sizeGradient * 1.75, 255); // White
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
    float sizeGradient = map(size, 20, 60, 255, 0); // Mapping size to color gradient
    fill(getCircleColor(sizeGradient));
    ellipse(x, y, size, size);
  }

  PVector checkIntersection(E4Instance other) {
    float distance = dist(x, y, other.x, other.y);
    if (distance < (size + other.size) / 2) {
      return new PVector((x + other.x) / 2, (y + other.y) / 2);
    }
    return null;
  }
}

```
**Slika:**
![Tretji poskus](image-2.png)

**Vprašanje:**
When  circles intersect the circle created by intersection should stay on the screen


**Koda iz odgovora in rezultat:**
```java
ArrayList<E4Instance> elements = new ArrayList<E4Instance>(); // List to store instances of E4
ArrayList<PVector> intersections = new ArrayList<PVector>(); // List to store intersection points
ArrayList<PVector> intersectionDisplay = new ArrayList<PVector>(); // List to store displayed intersection points
int numberOfElements = 200; // Number of E4 instances

void setup() {
  size(300, 300);
  
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
    float maxDistance = sqrt(sq(width) + sq(height));
    float distance = dist(0, 0, intersection.x, intersection.y);
    float sizeGradient = map(distance, 0, maxDistance, 255, 0);
    fill(getCircleColor(sizeGradient));
    ellipse(intersection.x, intersection.y, sizeGradient / 8, sizeGradient / 8); // Adjusted circle size
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
      return new PVector((x + other.x) / 2, (y + other.y) / 2);
    }
    return null;
  }
}


```
**Slika:**
![Četrti poskus](image-3.png)
**Dodatno:**
Na sliki lahko opazimo, da so velikosti narisanih krogov odvisne od položaja, ker nisem uspel sestaviti vprašanja, s katerim bi bile velikosti narisanih krogov pravilne, sem v naslednjem koraku prosil, če napiše kodo tako, da bodo velikosti narisanih krogov naključne, da dobimo vsaj malo bolj podobno razporeditev kot je pri originalni sliki.
**Vprašanje:**
Make it so that the created circle sizes are random

**Koda iz odgovora in rezultat:**
```java
ArrayList<E4Instance> elements = new ArrayList<E4Instance>(); // List to store instances of E4
ArrayList<PVector> intersections = new ArrayList<PVector>(); // List to store intersection points
ArrayList<PVector> intersectionDisplay = new ArrayList<PVector>(); // List to store displayed intersection points
int numberOfElements = 200; // Number of E4 instances
float maxCircleSize = 50; // Maximum circle size

void setup() {
  size(300, 300);
  
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

```
**Slika:**
![Peti poskus](image-4.png)

**Vprašanje:**
Lines still dont start on the edge of canvas
**Koda iz odgovora in rezultat:**
```java
void setup() {
  size(500, 500);
  background(255);
  plotRGB3(71, 13, 68);
}

void plotRGB3(int redAngle, int greenAngle, int blueAngle) {
  strokeWeight(2);
  int red = color(255, 0, 0);
  int green = color(0, 255, 0);
  int blue = color(0, 0, 255);
  
  // Red lines
  stroke(red);
  drawLines(0, height, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(0, height, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(0, height, radians(blueAngle));
}

void drawLines(float start, float end, float angle) {
  float step = 10; // Adjust this for spacing between lines
  for (float y = start; y < end; y += step) {
    if (random(1) > 0.2) { // Adjust this probability for skipping lines
      float x1 = 0;
      float y1 = y;
      float x2 = width;
      float y2 = y + (width * tan(angle));
      line(x1, y1, x2, y2);
    }
  }
}

```
**Slika:**
![Šesti poskus](image-5.png)

**Vprašanje:**
Try using diffrent angles

**Koda iz odgovora in rezultat:**
```java
void setup() {
  size(500, 500);
  background(255);
  plotRGB3(45, 90, 135); // Example angles: 45°, 90°, 135°
}

void plotRGB3(int redAngle, int greenAngle, int blueAngle) {
  strokeWeight(2);
  int red = color(255, 0, 0);
  int green = color(0, 255, 0);
  int blue = color(0, 0, 255);
  
  // Red lines
  stroke(red);
  drawLines(0, height, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(0, height, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(0, height, radians(blueAngle));
}

void drawLines(float start, float end, float angle) {
  float step = 10; // Adjust this for spacing between lines
  for (float y = start; y < end; y += step) {
    if (random(1) > 0.2) { // Adjust this probability for skipping lines
      float x1 = 0;
      float y1 = y;
      float x2 = width;
      float y2 = y + (width * tan(angle));
      line(x1, y1, x2, y2);
    }
  }
}

```
**Slika:**
![Sedmi poskus](image-6.png)

**Vprašanje:**
His lines are thinner and softer colored

**Koda iz odgovora in rezultat:**
```java
void setup() {
  size(500, 500);
  background(255);
  plotRGB3(45, 90, 135); // Example angles: 45°, 90°, 135°
}

void plotRGB3(int redAngle, int greenAngle, int blueAngle) {
  strokeWeight(1); // Adjust this for thinner lines
  int red = color(255, 0, 0, 50); // Adjust alpha (last parameter) for softer colors
  int green = color(0, 255, 0, 50);
  int blue = color(0, 0, 255, 50);
  
  // Red lines
  stroke(red);
  drawLines(0, height, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(0, height, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(0, height, radians(blueAngle));
}

void drawLines(float start, float end, float angle) {
  float step = 10; // Adjust this for spacing between lines
  float lineLength = dist(0, 0, width, height) + dist(0, height, width, 0); // Diagonal length of canvas
  
  for (float y = start; y < end; y += step) {
    if (random(1) > 0.2) { // Adjust this probability for skipping lines
      float x1 = -lineLength / 2; // Extend beyond canvas width
      float y1 = y - (lineLength / 2) * tan(angle); // Match y-coordinates for angle continuity
      float x2 = width + lineLength / 2; // Extend beyond canvas width
      float y2 = y + (lineLength / 2) * tan(angle); // Match y-coordinates for angle continuity
      line(x1, y1, x2, y2);
    }
  }
}
```
**Slika:**
![Osmi poskus](image-7.png)

**Vprašanje:**
Make it so the lines extend to the whole canvas 

**Koda iz odgovora in rezultat:**
```java
void setup() {
  size(500, 500);
  background(255);
  plotRGB3(45, 90, 135); // Example angles: 45°, 90°, 135°
}

void plotRGB3(int redAngle, int greenAngle, int blueAngle) {
  strokeWeight(1); // Adjust this for thinner lines
  int red = color(255, 0, 0, 50); // Adjust alpha (last parameter) for softer colors
  int green = color(0, 255, 0, 50);
  int blue = color(0, 0, 255, 50);
  
  // Red lines
  stroke(red);
  drawLines(radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(radians(blueAngle));
}

void drawLines(float angle) {
  float diagonal = sqrt(sq(width) + sq(height)); // Diagonal length of canvas
  
  for (float y = -diagonal; y < height + diagonal; y += 10) {
    float x1 = -diagonal * cos(angle); // Extend beyond canvas width
    float y1 = y - diagonal * sin(angle); // Match y-coordinates for angle continuity
    float x2 = width + diagonal * cos(angle); // Extend beyond canvas width
    float y2 = y + diagonal * sin(angle); // Match y-coordinates for angle continuity
    line(x1, y1, x2, y2);
  }
}

```
**Slika:**
![Deveti poskus](image-8.png)
**Vprašanje:**
Now make the lines closer together aswell

**Koda iz odgovora in rezultat:**
```java
void setup() {
  size(500, 500);
  background(255);
  plotRGB3(45, 90, 135); // Example angles: 45°, 90°, 135°
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
    float x1 = -diagonal * cos(angle); // Extend beyond canvas width
    float y1 = y - diagonal * sin(angle); // Match y-coordinates for angle continuity
    float x2 = width + diagonal * cos(angle); // Extend beyond canvas width
    float y2 = y + diagonal * sin(angle); // Match y-coordinates for angle continuity
    line(x1, y1, x2, y2);
  }
}

```
**Slika:**
![Deseti poskus](image-9.png)
**Vprašanje:**
There should be a random period of lines not being drawn

**Koda iz odgovora in rezultat:**
```java
int lineCount = 0;
int period = 0;

void setup() {
  size(500, 500);
  background(255);
  plotRGB3(45, 90, 135); // Example angles: 45°, 90°, 135°
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
    if (lineCount < 50) { // Draw 50 lines
      if (random(1) > 0.2) { // Adjust this probability for lines not being drawn
        float x1 = -diagonal * cos(angle); // Extend beyond canvas width
        float y1 = y - diagonal * sin(angle); // Match y-coordinates for angle continuity
        float x2 = width + diagonal * cos(angle); // Extend beyond canvas width
        float y2 = y + diagonal * sin(angle); // Match y-coordinates for angle continuity
        line(x1, y1, x2, y2);
      }
      lineCount++;
    } else {
      if (period < 100) { // Period without drawing lines
        period++;
      } else {
        lineCount = 0; // Reset line counter
        period = 0; // Reset period counter
      }
    }
  }
}


```
**Slika:**
![Enajsti poskus](image-10.png)
**Vprašanje:**
The chance of no draw period should be random, not after 50 lines

**Koda iz odgovora in rezultat:**
```java
int lineCount = 0;
int period = 0;
int noDrawPeriod = 0;

void setup() {
  size(500, 500);
  background(255);
  plotRGB3(45, 90, 135); // Example angles: 45°, 90°, 135°
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
        if (random(1) > 0.2) { // Adjust this probability for lines not being drawn
          float x1 = -diagonal * cos(angle); // Extend beyond canvas width
          float y1 = y - diagonal * sin(angle); // Match y-coordinates for angle continuity
          float x2 = width + diagonal * cos(angle); // Extend beyond canvas width
          float y2 = y + diagonal * sin(angle); // Match y-coordinates for angle continuity
          line(x1, y1, x2, y2);
        }
        lineCount++;
      } else {
        if (random(1) > 0.5) { // Random chance for no-draw period
          noDrawPeriod = int(random(50, 150)); // Random no-draw period between 50 and 150 iterations
        }
        lineCount = 0; // Reset line counter
      }
    }
  }
}
```
**Slika:**
![Dvanajsti poskus](image-11.png)
**Dodatno:**
V vrstici 625 sem ročno nadomestil if(random(1)>0.2) z if(true), dobil sem bolj primerno sliko.
**Slika za kote 71°-13°-68°:**
![Končen poskus](image-12.png)