class Spaceship extends Floater{
    public Spaceship() {
    myCenterX = 400; // Center of the screen
    myCenterY = 400;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0; // Initially pointing right
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];

    // Define the triangular shape relative to (0, 0)
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
  }
  
  //public void setXspeed(double x) {
    //myXspeed += x;
  //}
  //public void setYspeed(double y) {
    //myYspeed += y;
  //}
  public void setMyPointDirection(double r) {
    myPointDirection += r;
  }
  public void hyperspace(){
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
  }
