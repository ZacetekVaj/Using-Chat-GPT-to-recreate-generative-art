# Casey Reas - Interruptions- Clip-interrogator

### Clip-interrogator:
[Models website](https://github.com/pharmapsychotic/clip-interrogator)

**Input image:**
![Prvi poskus](images/image.jpg)
[Interruptions](https://dam.org/museum/artists_ui/artists/molnar-vera/interruptions/)

**Output:**
Create code in processing to replicate an image with the following describtion: a close up of a drawing of a square with lines, shinichi fukuda, puzzling, 7 7 7 7, hedge, on white paper, intricate ”, in oil”, made of notation, very long, very detailed”

### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion:Create code in processing to replicate an image with the following describtion: a close up of a drawing of a square with lines, shinichi fukuda, puzzling, 7 7 7 7, hedge, on white paper, intricate ”, in oil”, made of notation, very long, very detailed”

**Code from the anwser:**
```java
void setup() {
  size(400, 400);
  background(255); // White background
  
  stroke(0); // Black lines
  strokeWeight(1);
  
  // Drawing a square
  float squareSize = 300;
  float startX = (width - squareSize) / 2;
  float startY = (height - squareSize) / 2;
  float endX = startX + squareSize;
  float endY = startY + squareSize;
  float step = squareSize / 7;
  
  for (float x = startX; x <= endX; x += step) {
    line(x, startY, x, endY); // Vertical lines
  }
  
  for (float y = startY; y <= endY; y += step) {
    line(startX, y, endX, y); // Horizontal lines
  }
}

```
**Resulting image:**
![Prvi poskus](images/image.png)

### Conclusion

Since the model is optimized for stable diffusion i have not tried changing the describtion since its very diffrent than a standard prompt for chat-gpt, because of that, it is easier just describing the image yourself from the begining.



