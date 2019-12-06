public class Drifter extends Asteroid{
   public double myV, myHd;
   private float dX, dY;
   private int countdown, side;
   
   //public boolean OoB;
   Drifter(float x, float y, int mass){
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     myX = x;
     myY = y;
     myV = Math.random() + .5;
     myHd = (Math.random() * (Math.PI/2)) + (Math.PI * 3)/4;
     dX = (float)(myV * Math.cos(myHd));
     dY = (float)(myV * Math.sin(myHd));
     makepoints();
     mySpin = 0;
     countdown = 0;
     shattering = false;
     findVector();
   }
   Drifter(int mass){
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     side = (int)(Math.random() * 4);
     if(side == 0 || side == 2){
       myY = (float)((Math.random() * (height - 40)) + 20);
       myX = 2;
       if(side == 2){
         myX = width - 2;
       }
     }
     if(side == 1 || side == 3){
       myX = (float)((Math.random() * (width - 40)) + 20);
       myY = 2;
       if(side == 3){
         myY = height - 2;
       }
     }
     /*myX = width / 2;
     myY = height / 2;*/
     myV = Math.random() + .5;
     myHd = (Math.random() * Math.PI/2) - (Math.PI/4) + (side * Math.PI/2);  
     dX = (float)(myV * Math.cos(myHd));
     dY = (float)(myV * Math.sin(myHd));
     makepoints();
     mySpin = 0;
     countdown = 0;
     shattering = false;
     findVector();
     
   }
   Drifter(float x, float y, int mass, float pdX, float pdY){
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     myX = x;
     myY = y;
     myV = Math.random() + .5;
     myHd = (Math.random() * (Math.PI * 2));
     dX = (float)(myV * Math.cos(myHd)) + pdX;
     dY = (float)(myV * Math.sin(myHd)) + pdY;
     makepoints();
     mySpin = 0;
     countdown = 0;
     shattering = false;
     findVector();
  }
   public void update(int id){
     move();
     show();
     //drawVector();
     //selfDestruct(id);
   }
   private void move(){
     myX += dX;
     myY += dY;
     mySpin += .02;
   }

   private void selfDestruct(int id){
    if(countdown < 100){
      countdown++;
    }
    else{
      shattering = true;
    }
   }
   public void findVector(){
     vx = myX;
     vy = myY;
     while(checkBounds(vx,vy)){
       vx += Math.cos(myHd);
       vy += Math.sin(myHd);
     }
   }
   public void drawVector(){
     stroke(100,255,100);
     line(myX,myY,vx,vy);
   
   }
}
 
