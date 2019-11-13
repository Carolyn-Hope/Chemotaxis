public class Drifter extends Asteroid{
   public double myV, myHd;
   public boolean OoB;
   Drifter(int mass){
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
   }
}
