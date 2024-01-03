# Casey Reas - RGB 3

### Pogovor s chat - gpt:

**Vprašanje:**
Could you create a code in processing to recreate Casey Reas artwork based on this describtion? The RGB-3 series of six drawings was rendered with a plotter using Koh-I-Noor Rapidoplot red, blue, and green archival ink on white 250 gsm Stonehenge paper. The numbers in the titles are the angles of the lines for each color. For instance, the drawing RGB-3-71°-13°-68° orients the red lines at 71°, the green lines at 13°, and the blue at 68°. The lines run to the edges of the torn paper. Unlike the RGB-2 series of drawings, the system used to generate this series has a small probability of skipping a set of lines.

RGB-3-71°-13°-68°
2020
Plotter drawing, ink on paper
18 × 18 in / 45.7 × 45.7 cm

**Koda iz odgovora in rezultat:**
```java
void setup() {
  size(500, 500);
  background(255);
  plotRGB3(250, 250, 200, 71, 13, 68);
}

void plotRGB3(int centerX, int centerY, int size, int redAngle, int greenAngle, int blueAngle) {
  strokeWeight(2);
  int red = color(255, 0, 0);
  int green = color(0, 255, 0);
  int blue = color(0, 0, 255);
  
  // Red lines
  stroke(red);
  drawLine(centerX, centerY, size, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLine(centerX, centerY, size, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLine(centerX, centerY, size, radians(blueAngle));
}

void drawLine(int centerX, int centerY, int size, float angle) {
  float x = centerX + size * cos(angle);
  float y = centerY + size * sin(angle);
  line(centerX, centerY, x, y);
}

```
**Slika:**
![Prvi poskus](image.png)

**Vprašanje:**
The lines should start from one side of the canvas and stretch to the other
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
  drawLine(0, height/4, width, height/4, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLine(0, height/2, width, height/2, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLine(0, height*3/4, width, height*3/4, radians(blueAngle));
}

void drawLine(float x1, float y1, float x2, float y2, float angle) {
  float xEnd = x1 + (x2 - x1) * cos(angle);
  float yEnd = y1 + (x2 - x1) * sin(angle);
  line(x1, y1, xEnd, yEnd);
}

```
**Slika:**
![Drugi poskus](image-1.png)

**Vprašanje:**
He creates many of the same lines, not just one, all are evenly spaced and there is a random chance of a line not being drawn

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
  drawLines(width, height/4, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(width, height/2, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(width, height*3/4, radians(blueAngle));
}

void drawLines(float maxWidth, float y, float angle) {
  float step = 10; // Adjust this for spacing between lines
  float x = 0;
  while (x < maxWidth) {
    if (random(1) > 0.2) { // Adjust this probability for skipping lines
      float xEnd = x + step * cos(angle);
      float yEnd = y + step * sin(angle);
      line(x, y, xEnd, yEnd);
    }
    x += step;
  }
}
```
**Slika:**
![Tretji poskus](image-2.png)

**Vprašanje:**
The lines should still extend from one side of the canvas to the other

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
  drawLines(0, width, height/4, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(0, width, height/2, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(0, width, height*3/4, radians(blueAngle));
}

void drawLines(float start, float end, float y, float angle) {
  float step = 10; // Adjust this for spacing between lines
  float x = start;
  while (x < end) {
    if (random(1) > 0.2) { // Adjust this probability for skipping lines
      float xEnd = x + (end - start) * cos(angle);
      float yEnd = y + (end - start) * sin(angle);
      line(x, y, xEnd, yEnd);
    }
    x += step;
  }
}
```
**Slika:**
![Četrti poskus](image-3.png)

**Vprašanje:**
In your case the lines do not go from one side of the canvas to the other at the desired angle

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
  drawLines(height / 4, radians(redAngle));
  
  // Green lines
  stroke(green);
  drawLines(height / 2, radians(greenAngle));
  
  // Blue lines
  stroke(blue);
  drawLines(height * 3 / 4, radians(blueAngle));
}

void drawLines(float y, float angle) {
  float step = 10; // Adjust this for spacing between lines
  float startX = 0;
  float endX = width;
  
  for (float x = startX; x < endX; x += step) {
    if (random(1) > 0.2) { // Adjust this probability for skipping lines
      float xEnd = x + (endX - startX) * cos(angle);
      float yEnd = y + (endX - startX) * sin(angle);
      line(x, y, xEnd, yEnd);
    }
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