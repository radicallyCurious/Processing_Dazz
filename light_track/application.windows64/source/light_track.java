import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class light_track extends PApplet {

/*
created by: Luc Pitre<pitreluc@gmail.com
created on: 10 February 2015
purpose: computer vision play around

NOTES:
    #ON THERY#
    >search through pixels on screen to find the brightest

*/

//import necessary libraries


//create cam object of the class Capture
Capture cam;

//declare global variables
int x, y;
String cameraName = "Integrated Webcam";

public void setup(){
    
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

public void draw(){
     
     //call the lightTracking function
     lightTracking();
    
}//end draw
//holds other functions for light_track

//create a function to track the brightest spot on the screen

public void lightTracking(){
    
    if(cam.available()){
       //get data from camera
       cam.read();
       //load the pixels from the image of the camera
       cam.loadPixels();
       //create a variable to hold the brightest value possible
       float maxB = 0;
       //create a variable to hold the "name" of the brightest pixel
       int brightPix = 0;
       //loop through pixels and find the brightest one
       //cam.pixels.length refers to the amount of pixels...
       //...in the size of the window specified in...
       //...the Capture object "cam"
       for(int i = 0; i < cam.pixels.length; i++){
           //if the brightness of the pixel being looked at is...
           //...greater than the original brightness possible(0)...
           //...then set that to the greatest brightness possible...
           //...and then remember what pixel we found that out at
           if(brightness(cam.pixels[i]) > maxB){
               maxB = brightness(cam.pixels[i]);
               brightPix = i;
           }//end if
       }//end for
       
       //set x and y variables to the locatin of the brightest pixel
       x = brightPix % cam.width;
       y = brightPix / cam.width;
       
    }//end main if
    
    //draw image
    set(0, 0, cam);
    //set fill to a color
    fill(0, 255, 0);
    //draw circle to "track" brightest spot
    ellipse(x, y, random(10,20), random(10,20));
    ellipse(x+10, y+10, random(10,30), random(10,30));
    ellipse(x-10, y-10, random(5,10), random(5,10));
    ellipse(x-10, y+10, random(5,20), random(5,20));
    ellipse(x+10, y-10, random(10,30), random(10,30));
    

}//end lightTracking
    static public void main(String[] passedArgs) {
        String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#FFE621", "--stop-color=#030303", "light_track" };
        if (passedArgs != null) {
          PApplet.main(concat(appletArgs, passedArgs));
        } else {
          PApplet.main(appletArgs);
        }
    }
}
