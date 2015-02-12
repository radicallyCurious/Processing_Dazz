/*
created by: Luc Pitre<pitreluc@gmail.com
created on: 10 February 2015
purpose: computer vision play around

NOTES:
    #ON THERY#
    >search through pixels on screen to find the brightest

*/

//import necessary libraries
import processing.video.*;

//create cam object of the class Capture
Capture cam;

//declare global variables
int x, y;
String cameraName = "Integrated Webcam";

void setup(){
    
    //set the size of the window
    size(640, 480);
    //set the rate at which things will update on the screen every second
    frameRate(30);
    //set the background color to black
    background(0);
    //create a String array that holds the names of the cameras attached to the computer
    String[] cameras = Capture.list();
    //print a list of available cameras to the console
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    //set parameters of cam object
    //paramters are:
    //parent(use "this"), name of camera -- the [0] index of the array is the default camera
    cam = new Capture(this, cameras[0]);
    //start the camera
    cam.start();
    
}//end setup

void draw(){
     
     //call the lightTracking function
     lightTracking();
    
}//end draw
