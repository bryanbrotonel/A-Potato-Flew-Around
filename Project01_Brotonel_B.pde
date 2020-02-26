/*
    Project 1.pde
    Bryan Brotonel
    100334828
    INFO 3225 S10 
*/

boolean lose = false;
float xStartPosition, yStartPosition;

Character frank;

ArrayList<Cloud> clouds = new ArrayList<Cloud>();

float easing = 0.05;

void setup() {
    frameRate(180);

    size(960, 720);

    xStartPosition = width / 2;
    yStartPosition = height * 0.7;

    frank = new Character(40, 10);
}

void draw() {
    background(255, 204, 0);
    drawClouds();
    pushMatrix();

    translate(xStartPosition, yStartPosition);

    frank.drawCharacter();

    popMatrix();
}

void keyPressed() {
  if (key == CODED) {
      frank.characterMovement(keyCode);
  }
}

void drawClouds() {
    int numberOfClouds = 0;
    int cloudsLimit = 10;

    int time = millis();

    if (frameCount % 1000 == 0 && numberOfClouds < cloudsLimit) {

        float randomPosition = random(0, width - 10);
        float randomWidth = random(50, 200);
        float randomHeight = random(50, 75);
        float randomType = random(3, 8);

        Cloud cloud = new Cloud(randomPosition, randomWidth, randomHeight, randomType);

        clouds.add(new Cloud(randomPosition, randomWidth, randomHeight, randomType));
        numberOfClouds++;
    }

    for (Cloud cloud : clouds) {
        cloud.display();
    }
}