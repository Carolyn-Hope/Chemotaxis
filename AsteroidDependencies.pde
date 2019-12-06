 public ArrayList<Asteroid> Field = new ArrayList<Asteroid>();
 public void astUpdate(){
   for(int i = 0; i < Field.size(); i++){
     Field.get(i).update(i);
     if(!checkBounds(Field.get(i).myX, Field.get(i).myY)){
        Field.remove(i);
     }
   }
 }
 public void shower(int num, int mass){
   for(int i = 0; i < num; i++){
     //Field.add(new Drifter(width,(int)(Math.random() * 361) + 20, 4000));
     Field.add(new Drifter(mass));
   }
 }
 public void checkAsts(int len){
   int x = len;
   int i = 0;
   while(i < x){
     if(Field.get(i).outbounds){
       Field.remove(i);
       x--;
     }
     else if(Field.get(i).shattering){
       Field.get(i).shatter(i);
       x--;
     }
     else{
       i++;
     }
   }
 }
 public boolean checkBounds(double x, double y){
   return(!(x < 0 || x > width || y < 0 || y > height));
   
 }
