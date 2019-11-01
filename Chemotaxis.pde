
 ArrayList<Drone> Swarm = new ArrayList<Drone>();
 ArrayList<Asteroid> Field = new ArrayList<Asteroid>();
 /*int swarmSize = 0;
 int astNum = 0;*/
 /*Asteroid a1 = new Asteroid(300,300, 200);
 Asteroid a2 = new Asteroid(380,360, 200);*/
 
 void setup(){
   //astNum -= 2;
   for(int i = 0; i < 1; i++){
     Swarm.add(new Drone(20, 20, Swarm.size()));
   }
   for(int i = 0; i < 5; i++){
     Field.add(new Asteroid((int)(Math.random() * 361) + 20,(int)(Math.random() * 361) + 20, 2000));
   }
   for(int i = 0; i < 25; i++){
     Field.add(new Asteroid((int)(Math.random() * 361) + 20,(int)(Math.random() * 361) + 20, 200));
   }
   
   size(400,400);
 }   
 void draw(){    
   background(0);
   /*a1.show();
   a2.show();*/
   for(int i = 0; i < Field.size(); i++){
     Field.get(i).show();
   }
   for(int i = 0; i < Swarm.size(); i++){
     Swarm.get(i).update();
   }
 }
 class Asteroid{
   int myX;
   int myY;
   int mySize;
   double originalMass;
   double myMass;
   Asteroid(int x, int y, int mass){
     myX = x;
     myY = y;
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     //astNum++;
   }
   void show(){
     fill(150);
     ellipse(myX, myY, mySize, mySize);
     //System.out.println(findDist(a1.myX, a1.myY, a2.myX, a2.myY));
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
   int myX, myY, ID, probeSize, storedMass;
   double xBias, yBias, pullMag, dist, astpull;
   boolean foundAst;
   Drone(int x, int y, int num){
     myX = x;
     myY = y;
     ID = num;
     storedMass = 0;
     probeSize = 10;
     //System.out.println(ID);
     //swarmSize++;
   }
   void update(){
     fill(200);
     ellipse(myX,myY,probeSize,probeSize);
     
     foundAst = false;
     for(int i = 0; i < Field.size(); i++){
       if(findDist(myX,myY,Field.get(i).myX,Field.get(i).myY) <= Field.get(i).mySize / 2){
         
         mine(i);
         foundAst = true;
       }
     }
     for(int i = 0; i < Swarm.size(); i++){
       if(i != ID){
         if(findDist(myX, myY, Swarm.get(i).myX, Swarm.get(i).myY) <= probeSize){
           if(storedMass >= Swarm.get(i).storedMass){
             storedMass += Swarm.get(i).storedMass;
             Swarm.get(i).storedMass = 0;
           }
           else{
             Swarm.get(i).storedMass += storedMass;
             storedMass = 0;
           }
         }
       }
     }
     if(!foundAst){
       search();
     }
     
     if(storedMass >= 50){
       storedMass -= 50;
       Swarm.add(new Drone(myX, myY, Swarm.size()));
     }
   }
   void search(){
     xBias = 0;
     yBias = 0;
     for(int i = 0; i < Field.size(); i++){
       dist = findDist(myX,myY,Field.get(i).myX,Field.get(i).myY);
       astpull = Math.sqrt(Field.get(i).originalMass/100);
       pullMag = findMag(dist, astpull * 3);
       xBias += pullMag * ((Field.get(i).myX - myX)/dist);
       yBias += pullMag * ((Field.get(i).myY - myY)/dist);
     }
     myX += (int)((Math.random()*3) + xBias) - 1;
     myY += (int)((Math.random()*3) + yBias) - 1;
   
   }
   void mine(int ast){
     Field.get(ast).myMass--;
     storedMass++;
     if(Field.get(ast).myMass <= 0){
       Field.remove(ast);
       //astNum--;
     }
   }
 }
