class Navigation{
  PVector direction;
  float input=0;
  color green=color(0,255,0);
  color red=color(255,0,0);
  color blue=color(0,0,255);
  
  float desired=0;
  float actual=0;
  float difference=0;
  float steering=0;
  
  Navigation(){
    direction=new PVector(1,0);
  }
  void set(){
    if(mouseY >= 10 && mouseY <= 30){
      if(mouseX >= 50 && mouseY <= 250){
        desired=map(mouseX,50,250,-180,180);
      }
    }
  
  }
  void mouse(){
    if(mouseY >= 10 && mouseY <= 30){
      if(mouseX >= 50 && mouseY <= 250){
        input=map(mouseX,50,250,-180,180);
      }
    }
  }
  void approachAngle(){
    if(difference<0.2 && difference >-0.2){
      return;
    }
    steering=map(difference,-180,180,2,-2);
    direction.rotate(radians(steering));
    
  }
  
  void update(){
    actual=degrees(direction.heading());
    
    difference=actual-desired;
    if(difference<-180){
      difference+=360;
    }
    if(difference>180){
      difference-=360;
    }
    
    approachAngle();
    
    
    mouse();
  }
  
  void hand(float angle, color c){
    pushMatrix();
    rotate(radians(angle));
    fill(c);
    beginShape();
    vertex(0,0);
    vertex(5,-100);
    vertex(0,-140);
    vertex(-5,-100);
    endShape();
    popMatrix();
  }

  void render(){
    fill(255,255,255);
    rect(50,10,200,20);
    line(150,10,150,30);
    fill(0,0,0);
    text(input,130,45);
    
    text("Desired: " + desired,20,height-50);
    text("Actual: " + actual,20,height-35);
    text("Difference: " + difference,20,height-20);
    
    
    pushMatrix();
    
    translate(width/2,height/2);
    hand(actual,red);
    hand(desired,blue);
    
    
    popMatrix();
  }
  

}
