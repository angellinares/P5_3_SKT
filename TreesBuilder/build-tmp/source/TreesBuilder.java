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

public class TreesBuilder extends PApplet {

// Build trees clicking in the window

ArrayList<Tree> Trees = new ArrayList<Tree>();
PVector mousePos;
int item;

public void setup() {

	
	background(220);
	
}

public void draw() {
	

}

public void mousePressed(){
	mousePos = new PVector(mouseX,mouseY);
	Trees.add(new Tree(mousePos));

	item = Trees.size()-1;

	Tree t1 = Trees.get(item);
	t1.plant(mousePos);

}
class Tree{
	
	PVector loc;
	float angle, length;
	int lim, counter;

	Tree(PVector _loc){

		loc = _loc;
		counter = 0;
		angle = HALF_PI;
		length = 5;
		lim = 10;
	}


	public void plant(PVector loc1){

		grow(loc1,counter);

	}

	public void grow(PVector lastLoc, int counter_int){

		PVector newPt = PVector.add(lastLoc,randomV(angle,length));
		stroke(70);
		line(lastLoc.x,lastLoc.y,newPt.x, newPt.y);
		//print (counter_int);

		// //Branching
		// if (random(0,1)<0.5) {
		// 	plant(newPt);
		// }

		//Recursive grow
		while (counter_int < lim) {
			grow(newPt,counter_int+1);
		}
	}


	public PVector randomV(float angle, float length){

		PVector V;
		float rAngle = random(-angle, angle);
		float rLength = random(0.5f*length,length);

		V = PVector.fromAngle(rAngle);
		V.mult(rLength);

		return V;

	}


}
  public void settings() { 	size(512, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TreesBuilder" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
