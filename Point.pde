class Point extends Shape{
  float x;
  float y;
  Float derivative;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  String toString(){
    return "(" + x + ", " + y + ")";
  }
  
  @Override
  void draw(){
    ellipse(this.x,this.y,5,5);
  }
  
  void setDerivative(Float derivative){
     this.derivative = derivative; 
  }
  
  void movePoint(float x, float y){
     this.x = x;
     this.y = y;
  }
  
  //Check to see if this point is somewhere between two other points
  boolean isInside(Point start,Point end){
    return ((abs(x-start.x)+abs(x-end.x)) == abs(start.x-end.x)) && ((abs(y-start.y)+abs(y-end.y)) == abs(start.y-end.y));
  }
  
  boolean colliding(){
     for(Side side: allSides){
      for(Point point: side.pointList){
        boolean inside = isInside(side.center, point);
        if(inside){
          return true;
        };
      }
    }
  return false;
}
}
