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
