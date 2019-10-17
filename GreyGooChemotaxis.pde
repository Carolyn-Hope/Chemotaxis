 ArrayList<Drone> Swarm = new ArrayList<Drone>();
 int swarmSize = Swarm.size();
 Asteroid a1 = new Asteroid(200,100, 40);
 void setup()   
 {
   Drone d1 = new Drone(20,20);
   Swarm.add(swarmSize, d1);
 }   
 void draw()   
 {    
      
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
