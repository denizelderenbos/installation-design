import processing.serial.*;

Serial serial;

DataHandler handler = new DataHandler(5);

String str = null;
int nl = 10; //ASCII code for carage return in serial
float myVal; //float for storing converted ascii serial data


void setup(){
  size(500,500);
  background(255);

  //printArray(Serial.list());
  //printArray(Serial.list());
  String myPort = Serial.list() [5];
  serial = new Serial(this,myPort, 115200);
  handler.sendData();
}

void draw(){
  while(serial.available() > 0){
    str = serial.readStringUntil(nl);
    if(str != null){
      println(str);
    }
  }
}

void mousePressed() {
  handler.setData(0, int(random(50)), int(random(50)));
  handler.setData(1, int(random(50)), int(random(50)));
  handler.setData(2, int(random(50)), int(random(50)));
  handler.setData(3, int(random(50)), int(random(50)));
  handler.setData(4, int(random(50)), int(random(50)));
  handler.sendData();
}
