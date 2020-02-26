class Cloud {

    private float xPosition;
    private float cloudWidth;
    private float cloudHeight;
    private float cloudType;
    private float yPosition;

    Cloud(float position, float width, float height, float type) {
        cloudWidth = width;
        cloudHeight = height;
        xPosition = position;
        yPosition = 0 - height;
        cloudType = type;
    }

    void display() {
        yPosition = yPosition < height + cloudHeight ? yPosition += 0.5 : -cloudHeight;
                
        fill(255);

        rect(xPosition, yPosition, cloudWidth, cloudHeight, cloudType);
    }

    void drawClouds() {
        int numberOfClouds = 0;

        int time = millis();

        if (frameCount % 1000 == 0 && numberOfClouds < 10) {

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
}