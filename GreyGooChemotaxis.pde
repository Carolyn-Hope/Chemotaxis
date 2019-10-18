 ArrayList<Drone> Swarm = new ArrayList<Drone>();
 int swarmSize = Swarm.size();
 Asteroid a1 = new Asteroid(200,100, 40);
 Drone d1 = new Drone(20,20);
 Drone d2 = new Drone(20,20);
 Drone d3 = new Drone(20,20);
 Drone d4 = new Drone(20,20);
 
 void setup(){
   //Swarm.add(swarmSize - 1, d1);
   size(400,400);
 }   
 void draw(){    
   background(0);
   a1.show();
   d1.update();
   d2.update();
   d3.update();
   d4.update();
 }  
 class Drone{     
   int myX, myY, storedMass;
   double xBias, yBias;
   Drone(int x, int y){
     myX = x;
     myY = y;
     storedMass = 0;
     swarmSize++;
   }
   void update(){
     fill(200);
     ellipse(myX,myY,10,10);
     myX += (int)((Math.random()*3) + findpull(myX,200,2.5)) - 1;
     System.out.println();
     myY += (int)((Math.random()*3) + findpull(myY,100,2.5)) - 1;
     //System.out.println(myY);
   }
 }
 class Asteroid{
   int myX;
   int myY;
   int mySize;
   double myMass;
   Asteroid(int x, int y, int size){
     myX = x;
     myY = y;
     mySize = size;
   }
   void show(){
     fill(150);
     ellipse(myX, myY, mySize, mySize);
   }
 }
 double findpull(int x1, int x2, double pullstr){
     if(x2 - x1 != 0){
       return(pullstr/(x2 - x1));
     }
     else{
       return(0);
     }
 }
