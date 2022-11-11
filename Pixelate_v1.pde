PImage picImg;
int scale= 10;
int i = 0, j = 0, cols, rows;
float brA = 0;
float brAX = 0;
float brAY = 0;
boolean looping = false;

void setup() {
  size(350, 430);
  picImg = loadImage(""); // Insert path to your image
  cols = int(picImg.width/scale);
  rows = int(picImg.height/scale);
  //println(pixelDensity);
}

void draw() {
  background(255);
  //noFill();
  noStroke();
  //image(picImg,0,0);
  //loadPixels();
  picImg.loadPixels();
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {      
      for ( int k = 0; k < scale; k++) {        
        for (int l = 0; l < scale; l++) {         
          int loc = ((i*scale) +k) + ((j*scale) + l) * picImg.width;
          float r = red(picImg.pixels[loc]);
          float b = blue(picImg.pixels[loc]);
          float g = green(picImg.pixels[loc]);
          //float brP = (r + g + b)/3;
          brA = (r + g + b);
          //pixels[loc] = color(brP, brP, brP);
          //pixels[loc] = picImg.pixels[loc];
          brAY = brAY + brA;
          brA = 0;
        }
        brAX = brAX + brAY;
      brAY = 0;        
      }      
      brAX =  brAX / (scale * scale * 3);
      fill(brAX);
      rect(i * scale, j * scale, scale, scale);
      brAX = 0;
    }  
    //x = x + scale;
    //j = 0;  
  } 
  i = 0;
  //updatePixels();
  //image(picImg,0,0);
  if (!keyPressed && looping){
  noLoop();
  }
}

void keyPressed(){
  if (!looping){
    image(picImg,0,0);
  loop();
  }
}
