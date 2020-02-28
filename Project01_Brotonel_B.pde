/*
    Project 1.pde
    Bryan Brotonel
    100334828
    INFO 3225 S10 
*/

boolean gameLose = false;
boolean gameRestart = false;
boolean intro = true;

int gameScore = 0;
int numberOfClouds = 0;
int potatosFlew = 0;
int cloudsLimit = 5;

float xStartPosition, yStartPosition;
int time, k = 0;

ArrayList < Cloud > clouds = new ArrayList < Cloud > ();
ArrayList < Potato > potatos = new ArrayList < Potato > ();

Character character;

void setup() {
    frameRate(180);

    size(960, 720);

    xStartPosition = width / 2;
    yStartPosition = height * 0.7;

    character = new Character(100, 200);
}

void draw() {
    
    displayVisuals();

    if (intro)
        intro();
    else if (!intro)
        game();
    
        textAlign(LEFT);
    text(gameLose ? "true" : "false", 100,100);
    text(character.getXPosition(), 100, 110);
    text(character.getYPosition(), 100, 120);
    text("Potato size:" + potatos.size(), 100, 130);
    text("Potatos flew: " + potatosFlew, 100, 140);
    text("Keycode: " + k, 100, 150);
            text("Clouds size:" + clouds.size(), 100, 160);
}

void game() {

    showScore();

    displaySettings();

    drawPotatos();

    pushMatrix();

    translate(xStartPosition, yStartPosition);

    character.drawCharacter();

    popMatrix();

    playAgain();
}

void showScore() {

    String scoreText = "Score: " + gameScore;

    fill(255);
    noStroke();
    rect(width - 225, 25, 200, 50);

    fill(0);
    textSize(19);
    textAlign(CENTER, CENTER);
    text(scoreText, width - 225, 25, 200, 50);
}

void keyPressed() {
    k = key;

    if (key == 'c' || key == 'C')
        drawClouds = !drawClouds;
    else
        character.setDirection(keyCode, true);

}

void keyReleased() {
    character.setDirection(keyCode, false);
    k = 0;
}

void mousePressed() {

    if (overplayButton)
        intro = false;

    if (overPlayAgainButton)
        restartGame();

    if (overCloudsToggle)
        drawClouds = !drawClouds;
    
    if (overSkySlider)
        updateSlider = true;
}

void mouseReleased() {
    updateSlider = false;
}

void drawPotatos() {

    if (!intro && potatos.size() < 5) {
        int random = (int) random(1, 3);
        potatos.add(new Potato((random)));
    }
  for (int i = potatos.size()-1; i >= 0; i--) {
        Potato potato = potatos.get(i);

        potato.display();

        if (potato.getPotatoFlew()) {
            potatos.remove(i);
            gameScore++;
        }
  }
}
