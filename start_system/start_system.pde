Snowflake[] flakes;
int count;
int distance = 10;
float angle = 0;
float x = 20;
float size = 20;
void setup(){
  stroke(255);
  size(600,600);
  
  count = 100;
  flakes = new Snowflake[count];
  for (int i = 0; i<count; i++){
    flakes[i] = new Snowflake(x,angle,size);
    angle = angle + PI/12;
    x = 1.04*x;
    size = 0.98 * size;
    }
  } 


void draw(){
  background(0);
  translate(width/2,height/2);
  for (int i = 0; i<count; i++){
    flakes[i].pen();
  }
  println( (flakes[0].angle));
}

class Snowflake { 
  float xpos, size, angle, life;
  Snowflake (float tempxpos, float tempangle,float tempsize){
    xpos = tempxpos;
    angle = tempangle;
    size = random(tempsize-5,tempsize+5);
    life = random (100,200);
  }
  void pen(){
    pushMatrix();
    
    rotate(angle);
    life= random(0.5*life,1.5*life);
    if (life<50){life = random(100,200);}
    stroke(255,life);
    noFill();
    ellipse(xpos,0,size/2,size/2);
    translate(xpos,0);
    rotate(PI/3);
    line(-size,0,size,0);
    rotate(PI/3);
    line(-size,0,size,0);
    rotate(PI/3);
    line(-size,0,size,0);
    popMatrix();
  }
} 