boolean drawClouds = true;
boolean overCloudsToggle = false;

float globalSliderXPos, globalSliderYPos;

color day = color(135,206,235);
color night = color(25,25,112);

CloudToggle toggle = new CloudToggle(130, 25, 55, 25, 7);
SkySlider slider = new SkySlider(100, 75, 90, 15);
Sky sky = new Sky(day, night);

void displayVisuals() {

    sky.updateSky(sliderValue);
    sky.drawSky();

    drawClouds();
}

void displaySettings() {

    pushMatrix();
    translate(width - 225, 100);

    fill(255);
    noStroke();
    textAlign(LEFT);
    rect(0, 0, 200, 100);

    toggle.display();

    slider.update();
    slider.display();

    popMatrix();
}

void drawClouds() {

    if (millis() - time >= 3000 && numberOfClouds < cloudsLimit) {

        clouds.add(new Cloud());

        time = millis();
        numberOfClouds++;

    }

    if (drawClouds)
        for (Cloud cloud: clouds)
            cloud.display();
}

