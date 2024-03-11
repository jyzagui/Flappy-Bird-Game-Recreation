//FLAPPY BIRD GAME
//Bird File

class Bird {
  private PImage bird;
  private float x;
  private float y;
  private float gravity;
  private float velocity;

  public Bird() {
    bird = loadImage("bird.png");
    x = 70;
    y = 80;
    gravity = 0.1;
    velocity = 0;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void setY(float newY) {
    y = newY;
  }

  public void setVelocity(float newVelocity) {
    velocity = newVelocity;
  }

  public void show() {
    image(bird, x, y);
  }

  public void update() {
    velocity += gravity;
    y += velocity;
    y = constrain(y, 0, 612);
  }

  public void flap() {
    velocity = 0;
    velocity -= 2.5;
  }
}
