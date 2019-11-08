 class Drone{     
   int ID, probeSize, storedMass;
   float myX, myY, xBias, yBias, pullMag, dist, astpull;
   boolean foundAst;
   Drone(float x, float y, int num){
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
     trade();
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
       dist = (float)findDist(myX,myY,Field.get(i).myX,Field.get(i).myY);
       astpull = (float)Math.sqrt(Field.get(i).originalMass/100);
       pullMag = findMag(dist, astpull * 3);
       xBias += pullMag * ((Field.get(i).myX - myX)/dist);
       yBias += pullMag * ((Field.get(i).myY - myY)/dist);
     }
     myX += (float)((Math.random()*2) +  (dSpd * xBias)) - 1;
     myY += (float)((Math.random()*2) + (dSpd * yBias)) - 1;
   
   }
   void mine(int ast){
     Field.get(ast).myMass--;
     storedMass++;
     if(Field.get(ast).myMass <= 0){
       Field.remove(ast);
       //astNum--;
     }
   }
   void trade(){
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
   }
 }
