# Casey Reas - (Des)Ordres - MiniGPT-4

### MiniGPT-4:
[Models website](https://github.com/daanelson/MiniGPT-4)

**Input image:**
![Prvi poskus](images/image.jpg)

**Prompt:**
This is an image of generative art. Describe this image in very great detail and in such a way that it could be recreated by image generating AI, also include the fact that the small squares are within the larger ones and that the image is not a like a chess board.

**Output:**
The image is a drawing of a grid made up of small squares arranged in a larger square. Each small square is made up of smaller squares, creating a pattern of squares within squares. The drawing is in shades of gray, with the larger squares being darker and the smaller squares being lighter. The overall effect is one of complexity and intricacy, with the small squares creating a pattern that is both visually interesting and aesthetically pleasing.


### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion: The image is a drawing of a grid made up of small squares arranged in a larger square. Each small square is made up of smaller squares, creating a pattern of squares within squares. The drawing is in shades of gray, with the larger squares being darker and the smaller squares being lighter. The overall effect is one of complexity and intricacy, with the small squares creating a pattern that is both visually interesting and aesthetically pleasing.
**Code from the anwser:**
```java
int gridSize = 10; // Change the number of squares per side
int squareSize; // Variable to hold the size of each square

void setup() {
  size(500, 500);
  squareSize = width / gridSize;
  noLoop();
}

void draw() {
  background(255);
  drawSquares(width/2, height/2, squareSize, gridSize);
}

void drawSquares(float x, float y, float size, int level) {
  if (level > 0) {
    float grayValue = map(level, gridSize, 0, 255, 50);
    fill(grayValue);
    rectMode(CENTER);
    rect(x, y, size, size);
    
    float newSize = size / 2;
    level--;

    for (int i = 0; i < 4; i++) {
      float xOffset = (i % 2 == 0) ? newSize : -newSize;
      float yOffset = (i < 2) ? -newSize : newSize;
      drawSquares(x + xOffset, y + yOffset, newSize, level);
    }
  }
}
```
**Resulting image:**
![Prvi poskus](images/image-1.png)

### Conclusion

**Some of the other resulting images:**
These were a couple of images obtained from using slightly diffrent prompts for [MiniGPT-4](https://github.com/daanelson/MiniGPT-4), or by slightly modifiying the generated prompts.

![Prvi poskus](images/image-2.png)
![Prvi poskus](images/image-3.png)
![Prvi poskus](images/image-4.png)

After trying diffrent prompts for [MiniGPT-4](https://github.com/daanelson/MiniGPT-4) all of the images were very far from the original. Images were diffrent enough that it would be easier to describe them without using the model.



