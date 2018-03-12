class Navigation{

  // function hand(float angle, color c)
  //   drawing the clock handles
  //
  // function set()
  //   sets the new direction based on mouseX
  //
  // function mouse()
  //   detects the mouse if it is in the grey rectacle. Updates the 'input' variable 
  //
  // function approachAngle()
  //   Function to align 'actual'-direction with 'desired'-direction
  //
  // function update()
  //   running all the functions required for the next loop
  //
  // function render()
  //   draw the 'gui' and the clock-handles


  // Coordinates are handled in degrees..

  // Direction is based on a PVector, which we turn to the desired direction
  PVector direction;
  
  // Colors for the hand function
  color green=color(0,255,0);
  color red=color(255,0,0);
  color blue=color(0,0,255);
  
  // While the mouse is in the grey field, this is updated
  float input=0;
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
    // Read 'actual' from the PVector 'direction'
    actual=degrees(direction.heading());
    
    // Difference must be relative to current 'actual' and 'desired'
    difference=actual-desired;
    // But PVector.heading() returns -180 to 180 degrees...
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
    // A clock handle
    beginShape();
    vertex(0,0);
    vertex(5,-100);
    vertex(0,-140);
    vertex(-5,-100);
    endShape();
    popMatrix();
  }

  void render(){
    fill(200,200,200);
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
