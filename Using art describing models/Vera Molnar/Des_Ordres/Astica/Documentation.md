# Vera Molnar - (Des)Ordres - Astica
### Astica:
[Models website](https://www.astica.org/vision/describe/)

**Input image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Vera%20Molnar/Des_Ordres/Astica/Images/image.jpg)
[Des Ordres](https://dam.org/museum/artists_ui/artists/molnar-vera/des-ordres/)

**Output:**
This image is a black and white photograph of a sheet of paper with a square pattern. The dominant colors in the image are white and grey, giving it a monochromatic feel. The background is plain and untextured, allowing the focus to be on the intricate pattern on the paper. The edges of the paper are slightly curled, indicating that it may have been handled or used before being photographed.

The texture of the paper can be seen through its slight creases and folds, adding depth to the otherwise flat surface. The lighting in this indoor setting casts shadows across some parts of the paper, creating contrast between light and dark areas. Despite being black and white, there is still an element of visual interest due to the varying shades within each color.

Upon closer inspection, one can see that this square pattern consists of smaller squares arranged in alternating directions. This creates an optical illusion effect where some squares appear raised while others seem recessed into the page. It almost gives off a three-dimensional appearance despite being printed on a two-dimensional surface.

The text category has been identified as having high confidence by AI analysis tools for this image caption dataset preparation task. However, no visible text can be seen on this particular piece of paper aside from faint lines dividing each square in half diagonally.

Overall, this photograph captures simplicity yet complexity at once - showcasing how even something as mundane as a sheet of paper can hold hidden beauty when viewed up close

### Using the prompt for chat-gpt:

**Prompt:**
Create code in processing to replecate image based on this describtion: This image is a black and white photograph of a sheet of paper with a square pattern. The dominant colors in the image are white and grey, giving it a monochromatic feel. The background is plain and untextured, allowing the focus to be on the intricate pattern on the paper. The edges of the paper are slightly curled, indicating that it may have been handled or used before being photographed.

The texture of the paper can be seen through its slight creases and folds, adding depth to the otherwise flat surface. The lighting in this indoor setting casts shadows across some parts of the paper, creating contrast between light and dark areas. Despite being black and white, there is still an element of visual interest due to the varying shades within each color.

Upon closer inspection, one can see that this square pattern consists of smaller squares arranged in alternating directions. This creates an optical illusion effect where some squares appear raised while others seem recessed into the page. It almost gives off a three-dimensional appearance despite being printed on a two-dimensional surface.

The text category has been identified as having high confidence by AI analysis tools for this image caption dataset preparation task. However, no visible text can be seen on this particular piece of paper aside from faint lines dividing each square in half diagonally.

Overall, this photograph captures simplicity yet complexity at once - showcasing how even something as mundane as a sheet of paper can hold hidden beauty when viewed up close

**Code from the anwser:**
```java
PImage img;

void setup() {
  size(400, 400);
  img = createImage(width, height, RGB);
  generatePaper();
  image(img, 0, 0);
}

void generatePaper() {
  img.loadPixels();
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int index = x + y * img.width;
      // Create a square pattern with alternating shades of grey
      int grey = (x / 20 + y / 20) % 2 == 0 ? 200 : 240;
      img.pixels[index] = color(grey);
      
      // Add slight variations for depth effect
      float noiseVal = noise(x * 0.02, y * 0.02) * 20 - 10;
      img.pixels[index] = color(constrain(red(img.pixels[index]) + noiseVal, 0, 255));
    }
  }
  img.updatePixels();
  
  // Add creases and folds by drawing lines
  stroke(100);
  for (int i = 0; i < 10; i++) {
    float x1 = random(img.width);
    float y1 = random(img.height);
    float x2 = random(img.width);
    float y2 = random(img.height);
    line(x1, y1, x2, y2);
  }
  
  // Add curled edges
  float curlFactor = 10;
  for (int i = 0; i < img.width / curlFactor; i++) {
    img.set(i, 0, color(0));
    img.set(i, img.height - 1, color(0));
    img.set(0, i, color(0));
    img.set(img.width - 1, i, color(0));
    curlFactor += 0.1; // To give a slight curve effect
  }
}

```
**Resulting image:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Vera%20Molnar/Des_Ordres/Astica/Images/image-1.png)

### Conclusion


I have tried trimming down the prompt from [Astica](https://www.astica.org/vision/describe/) to only include relevant information, after each trim i got some of diffrent images, they were all looking like chess boards, which was better than in the instance of RGB-3 image, but it was still easier to just describe the image normaly from the start without using this model.

**Some of the other resulting images:**

![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Vera%20Molnar/Des_Ordres/Astica/Images/image-2.png)
![Prvi poskus](https://github.com/ZacetekVaj/Using-Chat-GPT-to-recreate-generative-art/blob/main/Using%20art%20describing%20models/Vera%20Molnar/Des_Ordres/Astica/Images/image-3.png)


After trying to modify the starting text i receved from  [Astica](https://www.astica.org/vision/describe/) all of the images were not useful enough for me to easily replecate the starting image.



