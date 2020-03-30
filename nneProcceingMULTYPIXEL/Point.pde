float f(float x) {
  return 1*x-0;
}

class Point{
  float x = 0;
  float y = 0;
  int flag = -1;
  Point(){
    this.x = random(width);
    this.y = random(height);
    if(f(this.x) > this.y){
      flag = 1;  
    }
  }

  void show(){
    if(flag == -1){
      fill(255);
    }else{
      fill(0);  
    }
    ellipse(this.x,this.y,14,14);  
  }
  
}
