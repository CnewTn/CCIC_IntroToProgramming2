//making the player class and intializing all of the variables
class Player {
  int x;
  int y; 
  int w;
  int h; 
  boolean isJumping;
  boolean isFalling; 
  int speed;  
  int jumpHeight;
  int highestY;
  //constructor
  Player(int startingX, int startingY, int startingW, int startingH){
    startingX = 100;
    startingY = 400;
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    isJumping = false;
    isFalling = false; 
    speed = 5;
    jumpHeight = 100;
    highestY = y - jumpHeight;
  }
  //this function puts the player onscreen
  void render(){
    fill(0);
   rect(x,y,w,h); 
  }
 //this function makes the player be able to move up onscreen
 void jumping(){
  if(isJumping == true){
    y -= speed;
  }
 }
 //this function makes the player be able to move down onscreen
 void falling(){
  if(isFalling == true){
    y+= speed;
  }
 }
 //this function makes a peak of the jump and begins the falling process
 void topOfJump(){
  if(y <= highestY){
    isJumping = false;
    isFalling = true;
  }
 }
 //this makes sure the player stays on the line that is onscreen
 void land(){
  if(y >= 400){
    isFalling = false;
    y = 400;
 }
 }
}
//declaring the player class, putting in new variables for the cactus 
Player p1;
int xCactus;
int yCactus;
void setup(){
  size(1200, 800);
  xCactus = 1200;
  yCactus = 400;
  p1 = new Player(width/2, height/2, 50, 50);

}
//drawing all of the functions in the player class to make sure the player can jump
//draws a cactus moving across the screen
void draw(){
  background(255);
  fill(255);
  line(0, 450, 1200, 450); 
  p1.render();
  p1.jumping();
  p1.falling();
  p1.topOfJump();
  p1.land();
  xCactus = xCactus - 5;
  rect(xCactus, yCactus, 25, 50);
  
}
//this programs the 'w' key to the 3 functions dedicated to making the player jump
void keyPressed(){  
  if(key == 'w'){
   p1.isJumping = true; 
  }
} 
