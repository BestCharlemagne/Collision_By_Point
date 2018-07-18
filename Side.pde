class Side extends Shape{
  Point start;
  Point end;
  Point center;
  Float slope;
  float increment = 0.5;
  ArrayList<Point> pointList = new ArrayList();
  
  Side(Point start, Point end, Point center){
    this.start = start;
    this.end = end;
    this.center = center;
    this.slope = slope();
    pointList = generateList();
  }
  
  Float slope(){
    if((end.x - start.x)!=0){ 
      return ((end.y - start.y)/(end.x - start.x));
    }
    //returns null if line is vertical
    return null;
  }
  
  @Override
  void draw(){
    line(start.x,start.y, end.x, end.y);
    center.draw();
  }
  
  ArrayList<Point> generateList(){
  ArrayList<Point> pointList = new ArrayList();
    
    //If slope is not vertical
    if(slope != null){
      float sign = 1;
      if((start.x-end.x)>0) sign = -1;
      //Set increment to right sign for y direction
      increment *= sign;
      
      //Draw the points on the line
      for(float i = start.x; i < end.x; i += (increment)){
        Float foundY = findY(i);
        if(foundY != null){
          //i is the x coord and foundY is the y coord
          Point point = new Point(i,foundY);
          //set the slope of the line as the derivative of the point
          point.setDerivative(slope);
          pointList.add(point);
        }
      }    
    }
    //Otherwise, draw them vertically
    else{
      float sign = 1;
      if((start.y-end.y)>0) sign = -1;
      //Set increment to right sign for y direction
      increment *= sign;
      //Draw the points on the vertical line
      for(float i = start.y; i > end.y; i+=increment){
        //Call function to get x value and check if it is in bounds
        Float foundX = findX(i);
        //If in bounds
        if(foundX != null){
           //Create a point
           Point point = new Point(foundX,i);
           //Vertical line, so null derivative
           point.setDerivative(null);
           pointList.add(point);
        }
      }
    }
    
    return pointList;
  }
  
  //@param x - input x coord of a point and it will return y coord
  //If x coord inputed is outside bounds, will return null
  Float findY(float x){
    //Check to see if point will be inside line segment
    if((abs(x-start.x)+abs(x-end.x)) == abs(start.x-end.x)){
      return (slope*(x-start.x)+start.y);
    } 
    return null;
  }
  
  //Use if slope is vertical
  //Will return null if outside bounds
  Float findX(float y){
    if((abs(y-start.y)+abs(y-end.y)) == abs(start.y-end.y)){
     //Just returns the same x value since line is vertical
     return start.x;
    }
    //Outside bounds
    return null;
  }
  
  
}
