/*
    Project 1.pde
    Bryan Brotonel
    100334828
    INFO 3225 S10 
*/

boolean lose = false;
int cloudsLimit = 5;
int numberOfClouds = 0;

float xStartPosition, yStartPosition;
int time;

ArrayList<Cloud> clouds = new ArrayList<Cloud>();
ArrayList<Potato> potatos = new ArrayList<Potato>();

Character frank;

void setup() {
    frameRate(180);
    smooth();
    size(960, 720);

    xStartPosition = width / 2;
    yStartPosition = height * 0.7;

    frank = new Character(40, 10);
}

void draw() {
    background(255, 204, 0);

    drawClouds();
    drawPotatos();

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

void drawPotatos() {

    if (potatos.size() < 5) {
        int random =  (int) random(1,3);
        potatos.add(new Potato((random)));
    }

    for (Potato potato : potatos) {
        potato.display();
    }
}

void drawClouds() {

    if (millis() - time >= 5000 && numberOfClouds < cloudsLimit) {

        float randomPosition = random(0, width - 10);
        float randomWidth = random(50, 200);
        float randomHeight = random(50, 75);
        float randomType = random(3, 8);

        Cloud cloud = new Cloud(randomPosition, randomWidth, randomHeight, randomType);

        clouds.add(new Cloud(randomPosition, randomWidth, randomHeight, randomType));
        println("numberOfClouds: "+numberOfClouds);

        time = millis();
        numberOfClouds++;
    }

    for (Cloud cloud : clouds) {
        cloud.display();
    }
}