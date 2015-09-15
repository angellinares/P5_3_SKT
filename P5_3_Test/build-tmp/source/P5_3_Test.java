import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class P5_3_Test extends PApplet {

//Just a small test to refresh Processing sintax.


int nPointsX = 25;
int nPointsY = 25;


float locX = 0;
float locY = 0;
PVector loc;
float h,stepX, stepY, mouseDist;
int counter;
Points[] ptList;


public void setup(){
 
 
 
 background(220);

 stepX = width/nPointsX;
 stepY = height/nPointsY;
 h = sqrt(sq(stepX/2)+sq(stepY/2));

 counter = 0;
 ptList = new Points[nPointsX*nPointsY];

 for (int i = 0; i < nPointsX; ++i) {

  	locX = (i*stepX)+(stepX/2);

  	for (int j = 0; j < nPointsY; ++j) {

  		locY = j*stepY+(stepY/2);
  		
  		loc = new PVector(locX,locY);

  		ptList [counter] = new Points(loc,PApplet.parseInt(i*j/10));

  		counter++;

  	}
  }
}

public void draw(){

 background(220);

 for (int i = 0; i < counter; ++i) {

 	//mouseDist = dist(mouseX,mouseY,ptList[i]._loc.x,ptList[i]._loc.y);
 	//ptList[i]._rad = stepX/2*map(mouseDist,0,1000,0,1);
 	ptList[i]._rad =stepY/2*map(mouseX,0,720,0,1);
 	ptList[i].disp();
 	

 } 
}

public void mousePressed(){

	setup();

}
class Points {
  
  PVector _loc, vPositive, vNegative;
  float _rad, coin;
  int mult;

	Points (PVector loc, float rad) {


		_loc = loc;
		_rad = rad;
		coin = random(0,1);
		
	}

	public void disp(){

		stroke(70);
		strokeWeight(10);
		noFill();
		//strokeWeight(_rad);
		//point(_loc.x, _loc.y);
		//ellipse(_loc.x, _loc.y, _rad, _rad);

		if (coin>0.5f) {
			vPositive = new PVector(_rad,_rad);
			vNegative = new PVector(-_rad,-_rad);
		}else{
			vPositive = new PVector(_rad,-_rad);
			vNegative = new PVector(-_rad,_rad);	
		}
		
		PVector loc1, loc2;

		loc1 = PVector.add(_loc,vPositive);
		loc2 = PVector.add(_loc,vNegative);

		line(loc1.x, loc1.y, loc2.x, loc2.y);

	}

}
  public void settings() {  size(720, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "P5_3_Test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
