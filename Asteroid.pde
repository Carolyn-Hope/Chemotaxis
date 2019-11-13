 public class Asteroid{
   public int mySize;
   public float myX, myY;
   public double originalMass, myMass;
   public Asteroid(float x, float y, int mass){
     myX = x;
     myY = y;
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
   }
   public Asteroid(){
   
   }
   public void show(){
     fill(150);
     ellipse(myX, myY, mySize, mySize);
   }
 }
