 public class Asteroid{
   public int mySize;
   public float myX, myY, mySpin;
   public float[] points = new float[12];
   public double originalMass, myMass;
   public Asteroid(float x, float y, int mass){
     myX = x;
     myY = y;
     originalMass = mass;
     myMass = originalMass;
     mySize =  (int)(Math.sqrt((originalMass * 5)/Math.PI));
     makepoints();
     mySpin = 0;
   }
   public Asteroid(){
   
   }
   public void update(int id){
     show();
   }
   public void show(){
     fill(150);
     translate(myX, myY);
     rotate(mySpin);
     beginShape();
     vertex(0,points[0]);
     vertex(points[1],points[2]);
     vertex(points[3],0);
     vertex(points[4],-points[5]);
     vertex(0,-points[6]);
     vertex(-points[7],-points[8]);
     vertex(-points[9],0);
     vertex(-points[10],points[11]);
     endShape(CLOSE);
     rotate(-mySpin);
     translate(-myX, -myY);
   }
   void makepoints(){
     for(int i = 0; i < points.length; i++){
       points[i] =(float)(mySize/(3 * Math.sqrt(2))) + (float)(Math.random()*mySize/(3 * Math.sqrt(2)));
     }
     for(int i = 0; i < points.length; i += 3){
       points[i] *= (float)Math.sqrt(2);
     }
   }
 }
