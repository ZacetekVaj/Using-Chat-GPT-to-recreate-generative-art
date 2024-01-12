# Casey Reas - (Des)Ordres - Clip-interrogator

### Clip-interrogator:
[Models website](https://github.com/pharmapsychotic/clip-interrogator)

**Input image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Vera%20Molnar/Des_Ordres/Clip-interrogator/Images/image.jpg)

**Output:**
a close up of a drawing of a square pattern with squares, kimitake yoshioka, by Ai Weiwei, benjamin vnuk, contemporary art, iranian, mingei, many small details, box, throw, ashy, 62 x 47 inches, maze-like, wall, hut, in a square, excitement, volume

### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion:a close up of a drawing of a square pattern with squares, kimitake yoshioka, by Ai Weiwei, benjamin vnuk, contemporary art, iranian, mingei, many small details, box, throw, ashy, 62 x 47 inches, maze-like, wall, hut, in a square, excitement, volume

**Code from the anwser:**
```java
int rows = 10; // Number of rows
int cols = 10; // Number of columns
int squareSize = 40; // Size of each square

void setup() {
  size(620, 470); // Size of the canvas
  background(255); // White background
  drawSquares();
}

void drawSquares() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float x = j * squareSize;
      float y = i * squareSize;
      
      // Random grayscale fill for an ashy appearance
      fill(random(100, 200));
      // Draw a square
      rect(x, y, squareSize, squareSize);
    }
  }
}
```
**Resulting image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Vera%20Molnar/Des_Ordres/Clip-interrogator/Images/image-1.png)

### Conclusion

Since the model is optimized for stable diffusion i have not tried changing the describtion since its very diffrent than a standard prompt for chat-gpt, because of that, it is easier just describing the image yourself from the begining.



