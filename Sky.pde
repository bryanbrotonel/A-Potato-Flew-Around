class Sky {

    private color currentSky;
    private color skyOne;
    private color skyTwo;
    
    Sky(color skyColour1, color skyColour2) {
        skyOne = skyColour1;
        skyTwo = skyColour2;
    }

    void updateSky(float value) {

        float redValue = map(value, 0, 100, red(skyOne), red(skyTwo));

        float greenValue = map(value, 0, 100, green(skyOne), green(skyTwo));

        float blueValue = map(value, 0, 100, blue(skyOne), blue(skyTwo));

        currentSky = color(redValue, greenValue, blueValue);
    }

    void drawSky() {
        background(currentSky);
    }
}