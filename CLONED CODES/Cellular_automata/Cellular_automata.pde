
int WIDTH = 1000;
int HEIGHT = 1000;

PImage state;
PImage next;
int scale = 2;

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  initState();
}

void update() {
  next = createImage(state.width, state.height, RGB);

  state.loadPixels();
  next.loadPixels();
  for (int x = 0; x < next.width; x++) {
    for (int y = 0; y < next.height; y++) {
      int index = x + y * next.width;

      int neighbors = 0;
      for (int xOff = -1; xOff <= 1; xOff++) {
        for (int yOff = -1; yOff <= 1; yOff++) {
          if (
            (neighbors >= 4) ||
            (xOff == 0 && yOff == 0) ||
            (x == 0 && xOff == -1) ||
            (y == 0 && yOff == -1) ||
            (x == next.width - 1 && xOff == 1) ||
            (y == next.height - 1 && yOff == 1)
            ) {
            continue;
          }
          if (state.pixels[(x + xOff) + (y + yOff) * state.width] == color(0)) {
            neighbors++;
          }
        }
      }

      if (neighbors == 3 || (neighbors == 2 && state.pixels[index] == color(0))) {
        next.pixels[index] = color(0);
      } else {
        next.pixels[index] = color(255);
      }
    }
  }
  next.updatePixels();

  state = next.copy();
}

void mouse() {
  state.loadPixels();
  state.pixels[(mouseX / scale) + (mouseY / scale) * state.width] = color(0);
  state.updatePixels();
}

void draw() {
  update();
  mouse();
  image(state, 0, 0, width, height);
}

void initState() {
  state = createImage(width / scale, height / scale, RGB);
  state.loadPixels();
  for (int x = 0; x < state.width; x++) {
    for (int y = 0; y < state.height; y++) {
      int index = x + y * state.width;
      state.pixels[index] = random(255) <= 127 ? color(0) : color(255);
    }
  }
  state.updatePixels();
}
