static class Point{
  float Xpos, Ypos, speed, theta, theta0;
  static int radius = 15;

  Point(float initTheta){
    theta0 = initTheta;
    theta = initTheta;
    Xpos = 0;
    Ypos = 0;
    speed = 0;
  }
}

float theta0 = 0.1;
float gravity = 0.1;
Point[] arrayPoint = new Point[3];
int pendulumRadius = 100;

void setup(){
  size(300,300);

  for(int i=0; i<arrayPoint.length;i++){
    arrayPoint[i] = new Point(theta0+i/1.8);
  }


}

void draw(){
  background(200);
  translate(width/2, height/4);

  for(int i=0; i<arrayPoint.length;i++){
    line(0,0,arrayPoint[i].Xpos,arrayPoint[i].Ypos);
    ellipse(arrayPoint[i].Xpos, arrayPoint[i].Ypos, Point.radius, Point.radius);
    //arrayPoint[i].speed += gravity;
    //arrayPoint[i].Ypos += arrayPoint[i].speed;
    arrayPoint[i].Xpos = sin(arrayPoint[i].theta)*pendulumRadius;
    arrayPoint[i].Ypos = sin(PI/2 - arrayPoint[i].theta)*pendulumRadius;
    arrayPoint[i].theta = arrayPoint[i].theta0*cos(sqrt(gravity/pendulumRadius)*(millis()/10));
  }

}