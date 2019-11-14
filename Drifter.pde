public class Drifter extends Asteroid{
   public double myV, myHd;
   //public boolean OoB;
   Drifter(float x, float y, int mass){
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     myX = x;
     myY = y;
     myV = Math.random() + .5;
     myHd = (Math.random() * (Math.PI/2)) + (Math.PI * 3)/4;
   }
   public void update(){
     move();
     show();
   }
   private void move(){
     myX += (float)(myV * Math.cos(myHd));
     myY += (float)(myV * Math.sin(myHd));
   }
}
