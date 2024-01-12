# Vera Molnar - Interruptions - Astica
### Astica:
[Models website](https://www.astica.org/vision/describe/)

**Input image:**
![Prvi poskus](images/image.jpg)
[Interruptions](https://dam.org/museum/artists_ui/artists/molnar-vera/interruptions/)

**Output:**
This image is a black and white photograph of a square piece of paper with lines on it. The paper appears to be slightly crumpled, adding texture to the otherwise flat surface. The lines are thin and evenly spaced, creating a grid-like pattern that covers the entire square. Some of the lines are thicker than others, giving the impression that they were drawn by hand rather than printed. The edges of the paper are slightly frayed, suggesting that it has been handled or used before being photographed.

The dominant colors in this image are white and grey, with accents of dark blue in some areas. These colors give off a vintage or retro vibe, as if this photo was taken many years ago. There is also an overall graininess to the image, further enhancing its old-fashioned aesthetic.

Upon closer inspection, one can see faint handwriting on top of the grid pattern. It appears to be written in cursive and is mostly illegible due to its small size and blurry quality. This adds another layer of intrigue to the image - who wrote these words? What do they say?

Despite its worn appearance, there is still a sense of orderliness in this photograph - from the precise grid lines to the neat handwriting scrawled across them. It almost feels like a page from someone's journal or notebook.

In terms of content recognition technology, this image contains mostly text with some elements classified as "others." However,the model confidently identifies "paper" and "handwriting" as key features within this scene.

Overall,this black-and-white square with intricate patterns evokes nostalgia for simpler times when handwritten notes were more common than digital ones.This could serve as an interesting additionto any caption dataset for training AI models on recognizing different typesof imagesand their corresponding descriptions accurately.

### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion: This image is a black and white photograph of a square piece of paper with lines on it. The paper appears to be slightly crumpled, adding texture to the otherwise flat surface. The lines are thin and evenly spaced, creating a grid-like pattern that covers the entire square. Some of the lines are thicker than others, giving the impression that they were drawn by hand rather than printed. The edges of the paper are slightly frayed, suggesting that it has been handled or used before being photographed.

The dominant colors in this image are white and grey, with accents of dark blue in some areas. These colors give off a vintage or retro vibe, as if this photo was taken many years ago. There is also an overall graininess to the image, further enhancing its old-fashioned aesthetic.

Upon closer inspection, one can see faint handwriting on top of the grid pattern. It appears to be written in cursive and is mostly illegible due to its small size and blurry quality. This adds another layer of intrigue to the image - who wrote these words? What do they say?

Despite its worn appearance, there is still a sense of orderliness in this photograph - from the precise grid lines to the neat handwriting scrawled across them. It almost feels like a page from someone's journal or notebook.

In terms of content recognition technology, this image contains mostly text with some elements classified as "others." However,the model confidently identifies "paper" and "handwriting" as key features within this scene.

Overall,this black-and-white square with intricate patterns evokes nostalgia for simpler times when handwritten notes were more common than digital ones.This could serve as an interesting additionto any caption dataset for training AI models on recognizing different typesof imagesand their corresponding descriptions accurately.

**Code from the anwser:**
```java
void setup() {
  size(400, 400); // Adjust the size as needed
  background(255); // Set background to white

  // Draw a square representing the paper
  float paperSize = 300;
  float margin = (width - paperSize) / 2;
  fill(240); // Grayish color for the paper
  rect(margin, margin, paperSize, paperSize);

  // Draw grid lines on the paper
  int rows = 10; // Number of rows
  int cols = 10; // Number of columns
  float rowHeight = paperSize / rows;
  float colWidth = paperSize / cols;
  stroke(100); // Thin lines for the grid
  for (int i = 0; i < rows + 1; i++) {
    float y = margin + i * rowHeight;
    line(margin, y, margin + paperSize, y);
  }
  for (int j = 0; j < cols + 1; j++) {
    float x = margin + j * colWidth;
    line(x, margin, x, margin + paperSize);
  }

  // Add frayed edges
  float frayAmount = 5; // Adjust fraying amount
  stroke(0); // Black for frayed edges
  strokeWeight(2);
  line(margin - frayAmount, margin - frayAmount, margin + paperSize + frayAmount, margin - frayAmount);
  line(margin - frayAmount, margin - frayAmount, margin - frayAmount, margin + paperSize + frayAmount);
  line(margin - frayAmount, margin + paperSize + frayAmount, margin + paperSize + frayAmount, margin + paperSize + frayAmount);
  line(margin + paperSize + frayAmount, margin - frayAmount, margin + paperSize + frayAmount, margin + paperSize + frayAmount);

  // Add some text or handwriting
  fill(0); // Black for text
  textSize(10); // Adjust text size
  String textContent = "Lorem ipsum dolor sit amet"; // Replace with actual text if needed
  text(textContent, margin + 10, margin + 20); // Adjust text position
}

```
**Resulting image:**
![Prvi poskus](images/image-1.png)

### Conclusion


I have tried trimming down or changing the prompt from [Astica](https://www.astica.org/vision/describe/) to only include relevant information, after each trim i got some of diffrent images. I could not get a good starting image without completely removing the original text and rewriting it. In this case it would be better to start without using this model.

**Some of the other resulting images:**
![Prvi poskus](images/image-2.png)
We can obtain good starting code (and therefore image) by changing the original text to this:
> This image is a black and white photograph of a square piece of paper with lines on it.  The lines are thin in a random pattern that covers the entire square, they are of same length.
The dominant colors in this image are white and black.

With the resulting code being:
```java
int squareSize = 500; // Size of the square canvas
int numLines = 1500; // Number of lines
float crumpleIntensity = 10; // Intensity of crumpling

void setup() {
  size(400, 400);
  background(255); // Set background to white

  crumpledPaper();
}

void crumpledPaper() {
  float step = squareSize / crumpleIntensity;
  float halfStep = step / 2.0;
  beginShape();
  for (float x = 0; x <= squareSize; x += step) {
    for (float y = 0; y <= squareSize; y += step) {
      float x1 = x + random(-halfStep, halfStep);
      float y1 = y + random(-halfStep, halfStep);
      float x2 = x + step + random(-halfStep, halfStep);
      float y2 = y + random(-halfStep, halfStep);
      line(x1, y1, x2, y2);
    }
  }
  endShape();
}

```
and the resulting image being:


![Prvi poskus](images/image-3.png)

but in this case the whole text was pretty much scraped and rewriten. In conclusion it would have been just easier to describe the image manualy from the beggining. 



