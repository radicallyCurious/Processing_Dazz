/**
*
* author:Luc Pitre<pitreluc@gmail.com>
* created on: 11 February 2015
* purpose:create a program that can detect faces via a camera

* NOTES:
    >using openCV for processing

*/

//import libraries
import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

//declare an object of the OpenCV class
OpenCV cv;
//declare an object of the Capture class
Capture cam;
//create an array of faces of type Rectangle
Rectangle[] faces;
//keep a count of faces detected
int faceCount = 0;
//set scale size
int scl = 1;

void setup(){
    //set the size of the window
    size(640, 480, P2D);
    //set the frame rate(how often things are "drawn" on the screen per second)
    frameRate(40);
    //set the background color
    //background(0);
    //create an array of cameras of type String that holds available cameras
    String[] cameras = Capture.list();
    //print a list of the avaible cameras
    println("*AVAILABLE CAMERAS:*");
    for(int i = 0; i < cameras.length; i++){
        println("CAMERA ", i, " : ");
        println(cameras[i]);
        println("\n");
    }//end for loop
    //define the object cam
    //parameters for declaration are:
    //parent(use "this", and the name of the camera -- index [0] is the default
    cam = new Capture(this, width/scl, height/scl);
    //define the object cv
    cv = new OpenCV(this, width/scl, height/scl);
    
    //load data to detect a face from opencv library
    cv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
    
    //start the camera
    cam.start();
    
}//end setup

void draw(){
    
    scale(scl);
    
    //load camera image
    cv.loadImage(cam);
    //"draw" image from camera to screen through opencv
    set(0, 0, cam);
    //set faces array to data that matches the data from opencv for a face
    faces = cv.detect();
    //using a loop...
    //draw a rectangle around all faces found
    //the faces array will be populated with data of the faces that opencv detects
    for(int i = 0; i < faces.length; i++){
        //do not fill the rectangles when drawn to the screen
        noFill();
        //set the color of the outline of the rectangle
        stroke(0, 0, 255);
        //set the thickness of the outline of the rectangle
        strokeWeight(3);
        //draw rectangle
        rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }//end for loop
    
}//end draw
