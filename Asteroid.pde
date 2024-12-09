class Asteroid extends Floater{
  private double rotationSpeed;
  public Asteroid(){
    myCenterX = (int)(Math.random()*800); // Center of the screen
    myCenterY = (int)(Math.random()*800);
    myXspeed = (int)(Math.random()*10)-5;
    myYspeed = (int)(Math.random()*10)-5;
    myPointDirection = (int)(Math.random()*360); // Initially pointing right
    corners = 6;
    rotationSpeed = (int)(Math.random()*10);
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
  }
  public void move(){
    turn(rotationSpeed);
    super.move();
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
