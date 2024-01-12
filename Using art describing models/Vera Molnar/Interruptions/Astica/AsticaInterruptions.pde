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
