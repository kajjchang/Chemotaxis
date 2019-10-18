Bacteria[] colony = new Bacteria[25];

void setup() {
  size(500, 500);
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria();
  }
}

void draw() {
  background(0);
  for (Bacteria bacteria : colony) {
    bacteria.update();
    bacteria.show();
  }
}

class Bacteria {
  float x, y;
  color col;
  Bacteria() {
    x = random(width);
    y = random(height);
    col = color(random(255), random(255), random(255));
  }
  
  void update() {
    if (mousePressed) {
      x += random(-5, 5);
      y += random(-5, 5);
    } else {
      x += random(-1, 1);
      y += random(-1, 1);
    }
    if (x > width) {
      x = 0;
    } else if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = 0;
    } else if (y < 0) {
      y = height;
    }
  }
  
  void show() {
    fill(col);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}
