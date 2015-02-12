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

public class light_painting extends PApplet {

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
    
  lightPainting();
    
}//end draw 
//create a function that will paint the screen white where the brightest pixel is

public void lightPainting(){
  int counter = 0;
  //if there is a camera ready to use
  if(cam.available()){
    //start it, and get data from it
    cam.read();
    //load its pixels
    cam.loadPixels();
    loadPixels();
    //find the brightest pixel
    for(int i = 0; i < cam.pixels.length; i++){
      if(brightness(cam.pixels[i]) > 200){
        pixels[i] = color(255);
      }//end if
          else if(brightness(cam.pixels[i]) > 150){
        pixels[i] = color(200);
      }//end else if
      else if(brightness(cam.pixels[i]) > 100){
        pixels[i] = color(50);
      }//end else if
      else if(brightness(cam.pixels[i]) > 50){
        pixels[i] = color(25);
      }//end else if
    }//end for
  }//end if
  
  if(keyPressed && key == 'b'){
    for(int i = 0; i < cam.pixels.length; i++){
      pixels[i] = color(0);
    }
  }
  
  
  
  background(0);
  updatePixels();

  
}//end lightPainting
    static public void main(String[] passedArgs) {
        String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#FFE621", "--stop-color=#030303", "light_painting" };
        if (passedArgs != null) {
          PApplet.main(concat(appletArgs, passedArgs));
        } else {
          PApplet.main(appletArgs);
        }
    }
}
