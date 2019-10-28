 ArrayList<Drone> Swarm = new ArrayList<Drone>();
 ArrayList<Asteroid> Field = new ArrayList<Asteroid>();
 int swarmSize = 0;
 int astNum = 0;
 //Asteroid a1 = new Asteroid(300,300, 40);
 
 
 void setup(){
   for(int i = 0; i < 1; i++){
     Swarm.add(new Drone(200,200));
   }
   for(int i = 0; i < 5; i++){
     Field.add(new Asteroid((int)(Math.random() * 361) + 20,(int)(Math.random() * 361) + 20, 40, 200));
   }
   size(400,400);
 }   
 void draw(){    
   background(0);
   //a1.show();
   for(int i = 0; i < astNum; i++){
     Field.get(i).show();
   }
   for(int i = 0; i < swarmSize; i++){
     Swarm.get(i).update();
   }
 }
 class Asteroid{
   int myX;
   int myY;
   int mySize;
   double myMass;
   Asteroid(int x, int y, int size, int mass){
     myX = x;
     myY = y;
     mySize = size;
     myMass = mass;
     astNum++;
   }
   void show(){
     fill(150);
     ellipse(myX, myY, mySize, mySize);
   }
 }
 double findpull(int x1, int x2, double pullstr){
     if(Math.abs(x2 - x1) >= .5){
       return(pullstr/Math.sqrt(x2 - x1));
     }
     else{
       return(0);
     }
 }
 double findMag(double dist, double str){
   if(Math.abs(dist) < .5){
     return(0);
   }
   else{
     return(str/dist);
   }
 }
  double findDist(int x1, int y1, int x2, int y2){
   return(Math.sqrt( ( (x2-x1) * (x2-x1) ) + ( (y2-y1) * (y2-y1) ) ));
 }
 
 class Drone{     
   int myX, myY, storedMass;
   double xBias, yBias, pullMag, dist;
   Drone(int x, int y){
     myX = x;
     myY = y;
     storedMass = 0;
     swarmSize++;
   }
   void update(){
     fill(200);
     ellipse(myX,myY,10,10);
     xBias = 0;
     yBias = 0;
     for(int i = 0; i < astNum; i++){
       dist = findDist(myX,myY,Field.get(i).myX,Field.get(i).myY);
       pullMag = findMag(dist, 3);
       //System.out.println(dist);
       xBias += pullMag * ((Field.get(i).myX - myX)/dist);
       yBias += pullMag * ((Field.get(i).myY - myY)/dist);
     }
     
     myX += (int)((Math.random()*3) + xBias) - 1;
     //System.out.println();
     myY += (int)((Math.random()*3) + yBias) - 1;
     //System.out.println(myY);
     for(int i = 0; i < astNum; i++){
        if(findDist(myX,myY,Field.get(i).myX,Field.get(i).myY) <= 20){
          Field.get(i).myMass--;
          storedMass++;
        }
        if(Field.get(i).myMass <= 0){
          
          Field.remove(i);
          astNum--;
        }
     }
     if(storedMass >= 50){
       storedMass -= 50;
       Swarm.add(new Drone(myX,myY));
     }
       
   }
 }
 
