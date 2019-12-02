public class Drifter extends Asteroid{
   public double myV, myHd;
   private float dX, dY;
   private int countdown;
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
   }
   Drifter(float x, float y, int mass, float pdX, float pdY){
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     myX = x;
     myY = y;
     myV = Math.random() + .5;
     myHd = (Math.random() * (Math.PI/2)) + (Math.PI * 3)/4;
     dX = (float)(myV * Math.cos(myHd)) + pdX;
     dY = (float)(myV * Math.sin(myHd)) + pdY;
     makepoints();
     mySpin = 0;
     countdown = 0;
  }
   public void update(int id){
     move();
     show();
     selfDestruct(id);
   }
   private void move(){
     myX += dX;
     myY += dY;
     mySpin += .02;
   }
   public void shatter(int id){
     if(originalMass/4 >= 200){
       for(int i = 0; i < 4; i++){
         Field.add(new Drifter(myX, myY,(int) originalMass/4, dX, dY));
       }
       
     }
     Field.remove(id);
   }
   private void selfDestruct(int id){
    if(countdown < 100){
      countdown++;
    }
    else{
      shatter(id);
    }
   }
   
}
