/*int swarmSize = 0;
 int astNum = 0;*/
 /*Asteroid a1 = new Asteroid(300,300, 200);
 Asteroid a2 = new Asteroid(380,360, 200);*/
 ArrayList<Asteroid> Field = new ArrayList<Asteroid>();
 ArrayList<Drone> Swarm = new ArrayList<Drone>();
 int dSpd;
 void setup(){
   //astNum -= 2;
   dSpd = 1;
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
   dSpd += .001;
 }

 class Drifter extends Asteroid{
   Drifter(){
     
   }
 
 }
 float findpull(float x1, float x2, float pullstr){
     if(Math.abs(x2 - x1) >= .5){
       return((float)(pullstr/Math.sqrt(x2 - x1)));
     }
     else{
       return(0);
     }
 }
 float findMag(float dist, float str){
   if(Math.abs(dist) < .5){
     return(0);
   }
   else{
     return(str/dist);
   }
 }
 double findDist(float x1, float y1, float x2, float y2){
   return(Math.sqrt( ( (x2-x1) * (x2-x1) ) + ( (y2-y1) * (y2-y1) ) ));
 }
 double swarmX(){
   double x = 0;
   for(int i = 0; i  < Swarm.size(); i++){
     x += Swarm.get(i).myX;
   }
   if(Swarm.size() == 0){
     return(0);
   }
   else{
     return(x/Swarm.size());
   }
   
 }
 double swarmY(){
   double y = 0;
   for(int i = 0; i  < Swarm.size(); i++){
     y += Swarm.get(i).myY;
   }
   if(Swarm.size() == 0){
     return(0);
   }
   else{
     return(y/Swarm.size());
   }
   
 }
