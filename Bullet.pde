class Bullet extends Floater{
  public Bullet(Spaceship theShip){
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myXspeed = theShip.getXspeed();
    myYspeed = theShip.getYspeed();
    myPointDirection = theShip.getMyPointDirection();
  }
  public void setMyPointDirection(double r) {
    myPointDirection += r;
  }
  public void show(){
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  public void move(){
    myCenterX += myXspeed;    
    myCenterY += myYspeed;
  }
    public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
