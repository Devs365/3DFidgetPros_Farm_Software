import processing.serial.*;


PImage addButtonImage;  // Declare variable "a" of type PImage

public int getRandomNumber(int min, int max) {
    return (int) ((Math.random() * (max - min)) + min);
}

String[] fontList = PFont.list();
    
Serial printer1;

void setup() {
  for(var i = 0;i<numberOfPrinters;i++){
    //Serial printer1;
  }
  //Connect to printer
  printArray(Serial.list());
  printer1 = new Serial(this, Serial.list()[3], 115200);
  delay(10000);
  
  addButtonImage = loadImage("AddPicture.png");  // Load the image into the program  
  //Same for all buttons
  ButtonColor = blueButtonColor;
  ButtonHighlight = loadingColor2;
  ButtonBaseColor = color(102);
  //Need Declare For Each Button
  //1
  addPrinterButtonX = 1280;
  addPrinterButtonY = 5;
  //2
  settingsButtonX = 1080;
  settingsButtonY = 5;
  ellipseMode(CENTER);
  size(1706, 1300);
}

boolean loading = true;//Is the screen still loading?

color loadingColor = color(66, 135, 245); 
color loadingColor2 = color(155, 255, 0);  
color blueButtonColor = color(66, 135, 245); 

void draw() {
  while (printer1.available() > 0) {
    println("Connection Success-COM12 Connected");
    println(printer1.readString());
  }
  PFont titleFont = createFont("Tw Cen MT Condensed", 28); //Create a font
  PFont bigFont = createFont("Tw Cen MT Condensed", 70); //Create a font
  background(#202020);
  stroke(128);
  fill(color(39, 44, 48));
  rect(width-300, 3, 295, 43, 7);
  rect(10, 50, 500, 1200, 7);
  rect(520, 50, 1180, 700, 7);
  rect(520, 760, 1180, 490, 7);
  fill(255);
  textFont(titleFont);
  text("3DFidgetPros Farm Software V:0.1", width-296, 33); 
  fill(loadingColor);
  stroke(loadingColor2);
  if(loading){
    pushMatrix();
    translate(1074, 368);
    rotate(frameCount / -20.0);
    polygon(0, 0, 70, 7);  // Heptagon
    popMatrix();
    pushMatrix();
    translate(237, 630);
    rotate(frameCount / -20.0);
    polygon(0, 0, 70, 7);  // Heptagon
    popMatrix();
    pushMatrix();
    translate(1059, 978);
    rotate(frameCount / -20.0);
    polygon(0, 0, 70, 7);  // Heptagon
    popMatrix();
    update(mouseX, mouseY);
  }
  stroke(255);
  if (addPrinterButtonOver) {
    fill(ButtonHighlight);
  } else {
    fill(ButtonColor);
  }
  rect(addPrinterButtonX, addPrinterButtonY, addPrinterButtonWidth, addPrinterButtonLength);
  if (settingsButtonOver) {
    fill(ButtonHighlight);
  } else {
    fill(ButtonColor);
  }
  rect(settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonLength);
  
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );
  image(addButtonImage, 1285, 9, addButtonImage.width/7, addButtonImage.height/7);
  fill(255);
  text("Printer", 1325, 34);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

//number of printer user starts with
int numberOfPrinters = 1;

//Same accross all buttons
color ButtonColor, ButtonBaseColor;
color ButtonHighlight;
color currentColor;

//Set of variables for each button
int addPrinterButtonX, addPrinterButtonY;      // Position of square button
int addPrinterButtonWidth = 120;     // Diameter of rect
int addPrinterButtonLength = 40;     // Diameter of rect
boolean addPrinterButtonOver = false;

int settingsButtonX, settingsButtonY;      // Position of square button
int settingsButtonWidth = 120;     // Diameter of rect
int settingsButtonLength = 40;     // Diameter of rect
boolean settingsButtonOver = false;

void update(int x, int y) {
  //Button 1
  if ( overAddPrinter(addPrinterButtonX, addPrinterButtonY, addPrinterButtonWidth, addPrinterButtonLength) ) {
    addPrinterButtonOver = true;
  } else {
    addPrinterButtonOver = false;
  }
  //Button 2
  if ( overSettings(settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonLength) ) {
    settingsButtonOver = true;
  } else {
    settingsButtonOver = false;
  }
}

void mousePressed() {
  //Button 1
  if (addPrinterButtonOver) {
    currentColor = ButtonColor;
    println("yay");
  }
  //Button 2
  if (settingsButtonOver) {
    currentColor = ButtonColor;
    println("yay2");
  }
}

boolean overAddPrinter(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overSettings(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
