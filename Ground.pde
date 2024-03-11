//FLAPPY BIRD GAME
//Ground File

class Ground {
  private PImage ground;
  private int x;

  public Ground() {
    ground = loadImage("ground.png");
    x = 0;
  }

  public void show() {
    image(ground, x, 650);
    image(ground, x + 470, 650);
  }
//allows the ground image to appear as if moving leftward
  public void update() {
    x -= 1;
    if (x <= -470) {
      x = 0;
    }
  }
}
