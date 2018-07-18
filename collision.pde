ArrayList<Shape> allShapes = new ArrayList();
ArrayList<Point> allBalls = new ArrayList();
ArrayList<Side> allSides = new ArrayList();
int count = 0;


void setup(){
   size(500,500);
   allSides.add(new Side(new Point(50,50), new Point(50,-50), new Point(0,0)));
   allBalls.add(new Point(100,0));
}

void draw(){
  background(0);
  translate(width/2,height/2);
  for(Side side: allSides){
     stroke(255);
     side.draw(); 
  }
  for(Point point: allBalls){
     stroke(255);
     point.draw();
  }
  
  collisions();
  updateCount();
}

void collisions(){
  int collisions = 0;
  for(Point ball: allBalls){
    if(ball.colliding()) collisions+=1;
  }
  println(collisions);
  count = collisions;
}

void updateCount(){
  textSize(32);
  text(count + " collisions" , -width/2, -height/2+25); 
  textSize(32);
  text(allBalls.size() + " balls" , -width/2, -height/2+60); 
}

void mouseClicked(){
  allBalls.add(new Point(mouseX-width/2, mouseY-height/2));
}

void keyPressed(){
   if (key ==  ' '){
      allBalls.clear(); 
   }
}
