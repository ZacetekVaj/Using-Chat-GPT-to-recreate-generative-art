# Casey Reas - RGB3 - Clip-interrogator

### Clip-interrogator:
[Models website](https://github.com/pharmapsychotic/clip-interrogator)

**Input image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/Clip-interrogator/Images/image.png)

**Output:**
a close up of a plaid pattern on a piece of fabric, pastel blues and pinks, inspired by Charles Hinman, high resolution product photo, on a gray background, inspired by Yamaguchi Kayo, diagonal, highly detailed product photo, trio, by Peter Alexander Hay, chiffon, 6, border pattern, patchwork-streak style, high detail product photo


### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion:a close up of a plaid pattern on a piece of fabric, pastel blues and pinks, inspired by Charles Hinman, high resolution product photo, on a gray background, inspired by Yamaguchi Kayo, diagonal, highly detailed product photo, trio, by Peter Alexander Hay, chiffon, 6, border pattern, patchwork-streak style, high detail product photo
**Code from the anwser:**
```java
int numCells = 30; // Number of cells in the grid
float cellSize; // Size of each cell
color lightBlue, lightPink, grayBG; // Colors

void setup() {
  size(600, 600);
  lightBlue = color(173, 216, 230); // Define pastel blue
  lightPink = color(255, 182, 193); // Define pastel pink
  grayBG = color(200); // Define gray background
  cellSize = width / numCells;
  background(grayBG);
  drawPlaid();
}

void drawPlaid() {
  for (int y = 0; y < height; y += cellSize) {
    for (int x = 0; x < width; x += cellSize) {
      if (random(1) > 0.5) {
        fill(lightBlue);
      } else {
        fill(lightPink);
      }
      rect(x, y, cellSize, cellSize);
    }
  }
}
```
**Resulting image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Casey%20Reas/RGB3/Clip-interrogator/Images/image-1.png)

### Conclusion

Since the model is optimized for stable diffusion i have not tried changing the describtion since its very diffrent than a standard prompt for chat-gpt, because of that, it is easier just describing the image yourself from the begining.



