boolean drawClouds = true;
boolean overCloudsToggle = false;

void displayVisuals() {
    drawSky();
    drawClouds();

    displaySettings();
}

void displaySettings() {
    CloudToggle toggle = new CloudToggle(130, 5, 55, 25, 7);

    pushMatrix();
    translate(width - 225, 100);

    fill(255);
    noStroke();
    rect(0, 0, 200, 200);

    textAlign(LEFT);

    toggle.display();
    skySlider();

    popMatrix();
}

void drawSky() {
    color skyColour1 = color(135,206,235);
    color skyColour2 = color(25,25,112);

    background(skyColour1);
}

void skySlider() {
    fill(0);
    textSize(15);
    text("Sky Slider", 10,40, 200, 50);

}

void drawClouds() {

    if (millis() - time >= 5000 && numberOfClouds < cloudsLimit) {

        clouds.add(new Cloud());

        time = millis();
        numberOfClouds++;

    }

    if (drawClouds)
        for (Cloud cloud: clouds)
            cloud.display();
}