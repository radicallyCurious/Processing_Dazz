//Luc Pitre<pitreluc@gmail.com>
//12 February 2015
//purpose: holds the classes of compVision_interactive.pde

class Ball{
    
    float xp, yp, xs, ys, speed;
    boolean ballTouchStar = false;
    
    Ball(float ballSpeed){
        speed = ballSpeed; //speed of ball
        xp = width/4;//initial x position
        yp = height/4;//initial y position
        xs = 50;//initial x size
        ys = 50;//initial y size
        
    }//end constructor Ball
    
    void ballGo(){
        ballSweep();
        ballSunburn();
        ballUpdate();
        ballDisplay();
    }//end ballGo
    
    void ballDisplay(){
        ellipse(xp, yp, xs, ys);
    }//end ballDisplay
    
    void ballUpdate(){
        xp += random(speed, speed/16);
        yp += speed/2;
    }//end ballUpdate
    
    void ballSweep(){
        if(xp > width){
            xp = 0;
        }else if(xp < 0){
            xp = width;
        }
        
        if(yp > height){
            yp = 0;
        }else if(yp < 0){
            yp = height;
        }
        
        if(dist(xp, yp, Bx, By) < 100){
            ballTouchStar = true;
        }else{
            ballTouchStar = false;
        }
        
    }//end ballSweep
    
    void ballSunburn(){
        if(ballTouchStar){
         fill(0, 255, 255);   
        }else{
         fill(0, 0, 255);   
        }
    }//end ballSunburn
    
}//end Ball class
