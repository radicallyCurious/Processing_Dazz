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
    //print a list of available cameras to the console
    printArray(Capture.list());
    //set parameters of cam object
    //paramters are:
    //parent(use "this"), width, height, name of camera, and frame rate 
    cam = new Capture(this, width, height, cameraName, 30);
    //start the camera
    cam.start();
    
}//end setup

void draw(){
    
  /*  if(keyPressed){
        int key0 = key;
        if(key0 == 't'){
            lightTracking();
        }else if(key0 == 'p'){
            lightPainting();
        }else{
         background(0);   
        }
    }*/
   
    
    //call the lightTracking function;
    //lightTracking();
    //call the lightPainting function
    //lightPainting();
    
}//end draw 

void keyReleased(){
        int key0 = key;
        if(key0 == 't'){
            lightTracking();
        }else if(key0 == 'p'){
            lightPainting();
        }else{
         background(0);   
        }   
}



