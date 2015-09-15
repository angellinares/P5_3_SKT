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

public class TreesBuilder_02 extends PApplet {

// Build trees clicking in the window

ArrayList<Tree> Trees = new ArrayList<Tree>();
PVector mousePos, pos;
int item, numTreesX, numTreesY, test;
int margin = 10;

public void setup() {

	
	background(220);

	numTreesX = 5;
	numTreesY = 5;

	float modX = (width-(margin*2))/numTreesX;
	float modY = (height-(margin*2))/numTreesY;

	for (int i = 0; i < numTreesX; ++i) {

		for (int j = 0; j < numTreesY; ++j) {
			
			//Tree position
			pos = new PVector((modX*i)+margin+(modX/2),(modY*j)+margin+(modY/1.5f));

			Trees.add(new Tree(pos));

		}
		
	}
	
}

public void draw() {
	
	background(220);
	for (int i = 0; i < Trees.size(); ++i) {

		Trees.get(i).plant();
		
	}
	
}

// void mousePressed(){
// 	mousePos = new PVector(mouseX,mouseY);
// 	Trees.add(new Tree(mousePos));

// 	item = Trees.size()-1;

// 	Tree t1 = Trees.get(item);
// 	t1.plant();

// }
class Tree{
	
	PVector loc;
	float angle, length;
	int lim, counter;

	Tree(PVector _loc){

		loc = _loc;
		counter = 0;
		angle = HALF_PI;
		length = 30;
		lim = 10;
	}


	public void plant(){

		pushMatrix();
		translate(loc.x, loc.y);
		grow(length);
		popMatrix();

	}

	public void grow(float len){

		strokeWeight(len/8);
		line(0, 0, 0, -len);
		translate(0, -len);
		len*=0.8f;

		if (len>3) {

			pushMatrix();
			rotate(mouseX*0.01f);
			line(0, 0, 0, -len);
			grow(len);
			popMatrix();
			rotate(-mouseX*0.01f);
			line(0, 0, 0, -len);
			grow(len);
		}
	}

}
  public void settings() { 	size(1024, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TreesBuilder_02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
