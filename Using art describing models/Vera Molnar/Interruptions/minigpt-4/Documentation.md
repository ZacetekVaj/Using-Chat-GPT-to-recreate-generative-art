# Casey Reas - Interruptions - MiniGPT-4

### MiniGPT-4:
[Models website](https://github.com/daanelson/MiniGPT-4)

**Input image:**
![Prvi poskus](images/image.jpg)
[Interruptions](https://dam.org/museum/artists_ui/artists/molnar-vera/interruptions/)

**Prompt:**
This is generative art image, describe it in great detail, do not miss the fact that there are some parts of the lines which are missing.

**Output:**
The image is a geometric pattern made up of lines of different lengths and widths. The lines are arranged in a grid-like pattern, with some lines crossing over each other and some lines running along the edges of the image. The lines are made up of small, jagged shapes that are connected to each other. The overall effect is a complex and intricate pattern that appears to be constantly moving and changing.

### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion: The image is a geometric pattern made up of lines of different lengths and widths. The lines are arranged in a grid-like pattern, with some lines crossing over each other and some lines running along the edges of the image. The lines are made up of small, jagged shapes that are connected to each other. The overall effect is a complex and intricate pattern that appears to be constantly moving and changing.
**Code from the anwser:**
```java
int cols = 20; // Number of columns
int rows = 20; // Number of rows
float spacing = 30; // Spacing between lines

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(2);
  stroke(0);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * spacing;
      float y = j * spacing;
      float len = random(10, 50); // Varying line lengths
      float thickness = random(1, 5); // Varying line thickness
      
      // Draw lines with small, jagged shapes
      drawJaggedLine(x, y, len, thickness);
    }
  }
}

void drawJaggedLine(float x, float y, float len, float thickness) {
  float halfLen = len / 2;
  float halfThick = thickness / 2;
  
  // Start drawing lines with small jagged shapes
  for (float i = -halfLen; i < halfLen; i += 2) {
    float noiseVal = noise(i * 0.1, y * 0.01, millis() * 0.001); // Generating noise for variation
    
    float offsetX = map(noiseVal, 0, 1, -halfThick, halfThick);
    float offsetY = map(noiseVal, 0, 1, -halfThick, halfThick);
    
    line(x + i + offsetX, y - halfThick + offsetY, x + i + offsetX, y + halfThick + offsetY);
  }
}

```
**Resulting image:**
![Prvi poskus](images/image-1.png)

After changing the prompt to [MiniGPT-4](https://github.com/daanelson/MiniGPT-4) to:
>This is generative art image, describe it in great detail, do not miss the fact that there are some parts of the lines which are missing, lines are randomly spread out without any patterns. 

The given output was:
>The image appears to be a piece of generative art made up of randomly placed lines of varying thickness and length. The lines appear to be drawn with a black pen or marker on a white background. There are no discernible patterns or shapes in the image, just a random arrangement of lines.

With this output we have obtained much better starting result. Which will be shown in the next section.
**New code from the second prompt:**
```java
void setup() {
  size(600, 400); // Adjust the canvas size as needed
  background(255); // Set background to white
  
  int numLines = 1000; // Number of lines to draw
  
  for (int i = 0; i < numLines; i++) {
    float startX = random(width); // Random starting X coordinate
    float startY = random(height); // Random starting Y coordinate
    float endX = startX + random(-50, 50); // Random ending X coordinate
    float endY = startY + random(-50, 50); // Random ending Y coordinate
    float thickness = random(1, 5); // Random thickness of the line
    
    stroke(0); // Set line color to black
    strokeWeight(thickness); // Set line thickness
    
    line(startX, startY, endX, endY); // Draw a line from start to end coordinates
  }
}
```
**Resulting image from the second prompt:**
![Drugi poskus](images/image-2.png)

Because the starting image was this good, we made some more prompts to chat-gpt to try to change it so it is more simular to the original image.
The next prompt was:
> Could you make the lines equally thick and equally long?

After just this one prompt we have obtained a good image which was pretty close to the original one, with slight modifications on the size of blank spaces the image would come even closer to the original. 
**Resulting code from next prompt:**
```java
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

```
**Resulting image from next prompt:**
![Prvi poskus](images/image-3.png)
### Conclusion
Suprisingly in this case [MiniGPT-4](https://github.com/daanelson/MiniGPT-4) has made it much easier for us to replicate the original image. Because of such a good original image the number of prompts to chat-gpt has been reduced from 5 (without using [MiniGPT-4](https://github.com/daanelson/MiniGPT-4)) to 2 with using [MiniGPT-4](https://github.com/daanelson/MiniGPT-4). In conclusion this model could be used to describe the image for you, atleast if the image is simple enough.




