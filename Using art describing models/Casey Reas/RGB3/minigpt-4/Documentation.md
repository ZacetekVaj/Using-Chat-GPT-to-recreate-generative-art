# Casey Reas - RGB3 - MiniGPT-4

### MiniGPT-4:
[Models website](https://github.com/daanelson/MiniGPT-4)

**Input image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/minigpt-4/Images/image.png)

**Prompt:**
This is an image of generative art. Describe this image in very great detail and in such a way that it could be recreated by image generating AI, also include the fact that some of the lines are randomly skipped.

**Output:**
The image appears to be a plaid pattern made up of horizontal and vertical lines in shades of blue, pink, and gray. The lines are not perfectly aligned, with some lines appearing to be slightly offset or skipped. The overall effect is a slightly rustic, handmade appearance.

### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion:The image appears to be a plaid pattern made up of horizontal and vertical lines in shades of blue, pink, and gray. The lines are not perfectly aligned, with some lines appearing to be slightly offset or skipped. The overall effect is a slightly rustic, handmade appearance.
**Code from the anwser:**
```java
int gridSize = 20; // Change this value to adjust the grid size
color blue = color(30, 60, 200);
color pink = color(240, 100, 150);
color gray = color(150);

void setup() {
  size(400, 400);
  background(255);
  drawPlaid();
}

void drawPlaid() {
  for (int y = 0; y < height; y += gridSize) {
    for (int x = 0; x < width; x += gridSize) {
      boolean drawHorizontal = random(1) > 0.5; // Randomly decide whether to draw horizontal or vertical line
      
      if (drawHorizontal) {
        drawHorizontalLine(x, y);
      } else {
        drawVerticalLine(x, y);
      }
    }
  }
}

void drawHorizontalLine(int x, int y) {
  strokeWeight(2);
  stroke(randomColor());
  line(x, y, x + gridSize, y);
}

void drawVerticalLine(int x, int y) {
  strokeWeight(2);
  stroke(randomColor());
  line(x, y, x, y + gridSize);
}

color randomColor() {
  int rand = int(random(3));
  if (rand == 0) {
    return blue;
  } else if (rand == 1) {
    return pink;
  } else {
    return gray;
  }
}


```
**Resulting image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/minigpt-4/Images/image-1.png)

### Conclusion

**Some of the other resulting images:**
These were a couple of images obtained from using slightly diffrent prompts for [MiniGPT-4](https://github.com/daanelson/MiniGPT-4).

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/minigpt-4/Images/image-2.png)
![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/minigpt-4/Images/image-3.png)
![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/minigpt-4/Images/image-4.png)
![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/minigpt-4/Images/image-5.png)

After trying diffrent prompts for [MiniGPT-4](https://github.com/daanelson/MiniGPT-4) all of the images were very far from the original, so much so that it was easier trying to describe the image without using the model from the start.



