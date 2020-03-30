network brain = new network(4,5,2,0.05);
PImage[] imgs = new PImage[2]; 
int current = 0;
boolean keepLearn = true;
PImage correct;
void setup(){
  size(2,2);
  background(255);
  
  float x1 = 0;
  float y1 = f(x1);
  float x2 = width;
  float y2 = f(x2);
  line(x1,y1,x2,y2);
  imgs[0] = loadImage("img/l.png");
  imgs[1] = loadImage("img/r.png");

}

void draw(){
  if(keepLearn){
    int score = 0;
    for(int i = 0 ; i < imgs.length; i++){ 
      PImage img = imgs[i];
      background(img);
      img.loadPixels();
      float[] inputs = (BWtranslate(img.pixels));
      float[] out = brain.guees(inputs);
      println("OUT 0 : " + out[0]);
      println("OUT 1 : " + out[1]);
      println("SCORE : " + score);

      if((out[1] > out[0] && i == 0) ||(out[1] < out[0] && i != 0)){
        correct = img;
        fill(0,255,0);
        score++;
        println("SUCCSES");  
      }else{
        fill(255,0,0);        
      }
      ellipse(0,0,8,8);
      println("I : " + i);
      println("-------------------------------------------------------------------------------------------------");

    }
    score /= imgs.length;
    score = 1 - score;
    float[] inputs = (BWtranslate(imgs[current].pixels));
    brain.train(inputs,score);
    current = (current + 1) % imgs.length;

  }else{
      background(correct); 
  }   
  
}
float[] BWtranslate(int[] pixO){
  float[] pix = float(pixO);
  for(int i = 0 ; i<pix.length ; i++){
    if(pix[i] == -1){
      pix[i] = 0.5;  
    }else{
      pix[i] = 1;  
    }
  }
  return pix;
}
void keyPressed() {
  keepLearn = false;
}
