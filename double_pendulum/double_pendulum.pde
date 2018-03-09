void setup(){
  size(500, 400);
  
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(200);
  canvas.endDraw();
}

PGraphics canvas;

float gravity = -0.15;
float m1 = 1, m2 = 1;
float x1, y1;
float x2, y2;
float angle1 = PI/2, angle2 = PI/2;
float angularAccel1, angularAccel2;
float angularSpeed1, angularSpeed2;
float angAccEqNumerator1, angAccEqDenominator1;
float angAccEqNumerator1part1, angAccEqNumerator1part2, angAccEqNumerator1part3;
float angAccEqNumerator2, angAccEqDenominator2;
int radius1 = 100, radius2 = 100;

float previousx2, previousy2;
boolean firstFramePassed = false;

void draw(){
  //background(200);
  image(canvas,0,0);
  translate(width/2, height/3.5);
  
  angAccEqNumerator1part1 = -1*gravity*(2*m1+m2)*sin(angle1);
  angAccEqNumerator1part2 = -1*m2*gravity*sin(angle1-2*angle2);
  angAccEqNumerator1part3 = -2*sin(angle1-angle2)*m2*(angularSpeed2*angularSpeed2*radius2 + angularSpeed1*angularSpeed1*radius1*cos(angle1-angle2));
  angAccEqNumerator1 = angAccEqNumerator1part1+angAccEqNumerator1part2+angAccEqNumerator1part3;
  angAccEqDenominator1 = radius1*(2*m1+m2-m2*cos(2*angle1-2*angle2));
  angularAccel1 = angAccEqNumerator1/angAccEqDenominator1;
  angularSpeed1 += angularAccel1;
  angle1 += angularSpeed1;
  
  angAccEqNumerator2 = 2*sin(angle1 - angle2)*(angularSpeed1*angularSpeed1*radius1*(m1+m2)+gravity*(m1+m2)*cos(angle1)+angularSpeed2*angularSpeed2*radius2*m2*cos(angle1-angle2));
  angAccEqDenominator2 = radius2*(2*m1+m2-m2*cos(2*angle1-2*angle2));
  angularAccel2 = angAccEqNumerator2/angAccEqDenominator2;
  angularSpeed2 += angularAccel2;  
  angle2 += angularSpeed2;

  x1 = sin(angle1)*radius1;
  y1 = -1*cos(angle1)*radius1;
  x2 = x1 + sin(angle2)*radius2;
  y2 = y1 - cos(angle2)*radius2;
  
  line(0,0, x1, y1);
  line(x1,y1, x2, y2);
  ellipse(x1,y1, 15, 15);
  ellipse(x2,y2, 15, 15);
  
  canvas.beginDraw();
  canvas.translate(width/2, height/3.5);
  canvas.strokeWeight(2);
  canvas.stroke(40,122,255);
  //canvas.point(x2,y2);
  if(firstFramePassed){
    canvas.line(previousx2, previousy2, x2, y2);
  }  
  canvas.endDraw();
  
  previousx2 = x2;
  previousy2 = y2;
  firstFramePassed=true;
}