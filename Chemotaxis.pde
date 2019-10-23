Bacteria[] colony = new Bacteria[100];
int light_size = 200;

void setup() {
  size(500, 500);
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria();
  }
}

void draw() {
  background(0);
  for (int i = light_size; i > 0; i--) {
    fill(light_size - i);
    stroke(light_size - i);
    ellipse(mouseX, mouseY, i, i);
  }
  for (Bacteria bacteria : colony) {
    bacteria.update();
    bacteria.show();
  }
}

class Bacteria {
  float x, y;
  int size;
  color col;
  Bacteria() {
    x = random(width);
    y = random(height);
    col = color(random(255), random(255), random(255), 100);
    size = 10;
  }
  
  void update() {
    if (dist(x, y, mouseX, mouseY) <= light_size / 2) {
      x += random(-5, 5);
      y += random(-5, 5);
    } else {
      x += random(-1, 1);
      y += random(-1, 1);
    }
    if (x > width - size / 2) {
      x = -size / 2;
    } else if (x < -size / 2) {
      x = width - size / 2;
    }
    if (y > height - size / 2) {
      y = -size / 2;
    } else if (y < -size / 2) {
      y = height - size / 2;
    }
  }
  
  void show() {
    fill(col);
    noStroke();
    ellipse(x, y, size, size);
  }
}
