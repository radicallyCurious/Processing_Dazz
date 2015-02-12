/**

* created BY: Luc Pitre<pitreluc@gmail.com>
* created ON: 12 February 2015
* purpose: use light/color detection to track something make it interactive

* NOTES:
    >
    
* THEORY:
    >

*/

//import libraries
import processing.video.*;

//create an object of the Capture class
Capture vid;

//create an object of Ball class
Ball ball;

//*variables*
//variable to hold frameRate
int fR = 40;
//variable to hold the scale of the camera
int scl = 1;

void setup(){
    
    //set the size of the window
    size(640, 480);
    //set the original/default background color
    background(0);
    //set the rate at which things are drawn to the screen
    frameRate(fR);
    //define parameter(s) of the object called "ball"
    ball = new Ball(2);//has speed of 2 pixels per frame
    //create an array of type String to store names of cameras attached to device
    String[] cameras = Capture.list();
    //print a list of cameras to the console for reference
    println("AVAILABLE CAMERAS");
    for(int i = 0; i < cameras.length; i++){
        println("CAMERA", i, " :");
        println(cameras[i]);
        println("\n");
    }//end printing for loop
    //define parameters of the object called "vid"
    vid = new Capture(this, width/scl, height/scl);
    
    //start the camera
    vid.start();
    
    
}//end setup

void draw(){
    
    lightTracking();
    ball.ballGo();
    
}//end draw
