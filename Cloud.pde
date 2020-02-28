class Cloud {

    private float xPosition;
    private float cloudWidth;
    private float cloudHeight;
    private float cloudType;
    private float yPosition;

    Cloud() {

        xPosition = random(0, width - 10);
        cloudWidth = random(50, 200);
        cloudHeight = random(50, 75);
                yPosition = -cloudHeight;
        cloudType = random(20, 30);

    }

    void display() {
        float cloudSpeed = gameLose ? 0 : 0.5;

        yPosition = yPosition < height + cloudHeight ? yPosition += cloudSpeed : -cloudHeight;

        fill(255);

        rect(xPosition, yPosition, cloudWidth, cloudHeight, cloudType);
    }
}