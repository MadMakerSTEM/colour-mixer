/* Colour Mixer - Processing

Author: Calla Klafas 
Date: August 2015
http://challenge.madmaker.com.au 

To work with the "ColourMixer_Esplora.ino"

Displays the colour the Esplora sets to interpret by a monitor.  
*/

import processing.serial.*; // import the Serial library

String serial;
Serial port;

int red,green,blue;
int WIDTH = 800;
int HEIGHT = 600;

void setup() {
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  size(800, 600);
  fill(red,green,blue);
}

void draw() {
  while (port.available () > 0) {
    serial = port.readStringUntil('\n');
    //
  }
  serial = trim(serial);
  if (serial != null) {
    String[] a = split(serial.substring(4), ',');  
    red = int(a[0]);
    green = int(a[1]);
    blue = int(a[2]);
    println(a);
    background(red,green,blue);
    textSize(40);
    textAlign(CENTER,CENTER);
    stroke(255);
    fill(255);
    translate(WIDTH/2, HEIGHT/2);
    text(serial,0,0);
  }
}