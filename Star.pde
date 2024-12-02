class Stars{
  private int xPos;
  private int yPos;
  public Stars(){
    xPos = (int)(Math.random()*800);
    yPos = (int)(Math.random()*800);
  }
  public void showS(){
    fill(255);
    ellipse(xPos, yPos, 8, 8);
  }
}
