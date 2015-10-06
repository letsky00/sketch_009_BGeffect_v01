
int amount = 1000;
float[] radius = new float[amount];
float[] distance = new float[amount];
float[] rotVari = new float[amount];
float[] rotUpdate = new float[amount];
float[] rotSpeed = new float[amount];
float[] alpha = new float[amount];
float[] bounceSpeed = new float[amount];
float[] bounceHeight = new float[amount];

void setup() {
  
  //-----set stage
  size(720, 1280, P3D);
  frameRate(30);
  
  //-----set variables
  for(int i=0; i<amount; i++){
    distance[i] = random(100, 300);
    radius[i] = random(2, 10);
    rotSpeed[i] = -random(0.001, 0.005);
    alpha[i] = random(50,200);
    rotVari[i] = random(360);
    bounceSpeed[i] = random(2, 20);
    bounceHeight[i] = random(5, 50);
  }
  
}

void draw() {

  //-----background
  background(107, 62, 36);
  
  //-----move to center of screen
  translate(width/2, height/2);
  
  //-----rotate obeject with mouse
  rotateX(-radians(rotUpdate[0]*100));
  //rotateY(radians(mouseX-(width/2)));
  
  //-----center circle
  /*
  fill(23, 123, 230);
  noStroke();
  ellipse(0, 0, 200, 200);
  */
  
  //-----circles
  for(int i=0; i<amount; i++){
    pushMatrix();
      rotUpdate[i]+=rotSpeed[i];
      rotateY(rotVari[i]+rotUpdate[i]);
        pushMatrix();
          translate(distance[i], 0);
          rotateY(-rotVari[i]-rotUpdate[i]);
          rotateX(radians(rotUpdate[0]*100));
          fill(255, 255, 255, alpha[i]);
          noStroke();
          ellipse(0, bounceHeight[i]*cos(rotUpdate[i]*bounceSpeed[i]), radius[i], radius[i]);
        popMatrix();
    popMatrix();
  }
  
  //-----axis
  /*
  stroke(255, 0, 0);
  strokeWeight(1);
  line(0, -20, 0, 0, 20, 0);
  stroke(0, 255, 0);
  strokeWeight(1);
  line(-20, 0, 0, 20, 0, 0);
  stroke(0, 0, 255);
  strokeWeight(1);
  line(0, 0, -20, 0, 0, 20);
  */
  
}
