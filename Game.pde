//FLAPPY BIRD GAME
//Game File
/*
The game logic is to control the bird by flying upwards or falling down with gravity and navigating through pipes to achieve high scores by surviving the distance
*/



class Game {
  private PImage background; //the background image of the game
  private Ground ground; //the ground object of the game
  private Bird bird; //the bird object in the game
  private Pipe[] pipes = new Pipe[4]; //array of pipe objects that the bird must navigate through
  private boolean active; //indicates where the game is currently active or not
  private float score; //keep track of the player's score
  private PFont scoreFont; 
  private float highScore; //keeps track of the highest score achieved
  private PFont msgFont;

  // Constructor
  public Game() {
    background = loadImage("background.png");
    ground = new Ground();
    bird = new Bird();
    active = true;
    score = 0;
    scoreFont = createFont("Dejavu Sans Bold", 32);
    highScore = 0;
    msgFont = createFont("Dejavu Sans Bold", 40);

    for (int i = 0; i < pipes.length; i++) {
      pipes[i] = new Pipe(width + i * 250);
    }
  }
// Methods
  public PImage getBackground() {
    return background;
  }

  public void show() {
    for (Pipe p : pipes) {
      p.show();
    }
    ground.show();
    if (active) {
      bird.show();
    }
    showScore();
  }

  public void update() {
    ground.update();
    if (active) {
      bird.update();
      updateScore();
    } else if (keyPressed) {
      if (key  == ' ') {
        restart();
      }
    }

    for (Pipe p : pipes) {
      p.update();
      if (p.touching(bird)) {
        gameOver();
      }
    }
  }

  public void gameOver() {
    active = false;
    if (score > highScore) {
      highScore = score;
    }
  }

  public void updateScore() {
    score += 0.01;
  }

  public void showScore() {
    textAlign(CENTER, CENTER);
    if (active) {
      textFont(scoreFont);
      fill(255);
      text((int)score, 25, 25);
    } else {
      String msg = "Press Space Bar\nto Play Again\nHigh Score: " + (int)highScore;
      textFont(msgFont);
      fill(255, 0, 0);
      text(msg, width/2, height/2);
    }
  }
// resets the game and brings score to 0
  public void restart() {
    active = true;
    score = 0;
    bird.setY(80);
    bird.setVelocity(0);

    for (int i = 0; i < pipes.length; i++) {
      pipes[i] = new Pipe(width + i * 250);
    }
  }
}

