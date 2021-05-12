int valueX = 0, valueY = 0, valueZ = 0;
float sizeValue = 1.0;

void setup () {
size (600, 600, P3D);
}

void draw () {
  background(22);
  lights();
  
  stroke(111);
  line(100,500,-200,800,500,-200); // x
  line(100,500,-200,100,0,-200); // y
  line(100,500,-200,100,500,200); // z
  
  translate(300, 350, -10);
  
  fill(0, 255, 0);
  rotateXYZ(radians(valueX), radians(valueY), radians(valueZ));
  box(30, 200, 30);
  camera(width-mouseX, height-mouseY, height/2 /tan(PI/4), height/2, width/2, 0, 0, 1, 0);
}

void keyPressed(){
  if (keyPressed) {
    if (key == 's' || key == 'S'){
      sizeValue += 0.05;
    } else if (key == 'w' || key == 'W'){
      sizeValue -= 0.05;  
    } else if (key == 'x' || key == 'X'){
      if (valueX >= 360) {
        valueX = 0;
      } else {
        valueX += 5;
      }
    } else if (key == 'y' || key == 'Y'){
      if (valueY >= 360) {
        valueY = 0;
      } else {
        valueY += 5;
      }
    } else if (key == 'z' || key == 'Z'){
      if (valueZ >= 360) {
        valueZ = 0;
      } else {
        valueZ += 5;
      }
    }
  }
}
void rotateXYZ(float xx, float yy, float zz) {
  float cx, cy, cz, sx, sy, sz;

  cx = cos(xx);
  cy = cos(yy);
  cz = cos(zz);
  sx = sin(xx);
  sy = sin(yy);
  sz = sin(zz);
  
  applyMatrix(cy*cz, (cz*sx*sy)-(cx*sz), (cx*cz*sy)+(sx*sz), 
              0.0, cy*sz, (cx*cz)+(sx*sy*sz), (-cz*sx)+(cx*sy*sz), 
              0.0, -sy, cy*sx, cx*cy, 0.0, 0.0, 0.0, 0.0, sizeValue);



}
