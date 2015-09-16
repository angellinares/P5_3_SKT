// Build trees clicking in the window

import processing.pdf.*;

ArrayList<Tree> Trees = new ArrayList<Tree>();
PVector mousePos, pos;
int item, numTreesX, numTreesY, test;
int margin = 10;
PFont font;

void setup() {

	size(1024, 1024, PDF, "FrameDemo.pdf");
	background(175);

	numTreesX = 5;
	numTreesY = 5;

	float modX = (width-(margin*2))/numTreesX;
	float modY = (height-(margin*2))/numTreesY;

	font = createFont("HelveticaLTStd-Roman",10);
	textFont(font);
	textMode(MODEL);
	textSize(10);
	textAlign(CENTER);
	//fill(70);

	for (int i = 0; i < numTreesX; ++i) {

		for (int j = 0; j < numTreesY; ++j) {
			
			//Tree position
			pos = new PVector((modX*i)+margin+(modX/2),(modY*j)+margin+(modY/1.5));

			Trees.add(new Tree(pos,PI/10+(PI*i/10),j+0.25));

		}
		
	}

	for (int i = 0; i < Trees.size(); ++i) {
		stroke(250,150);
		Trees.get(i).plant();
		
	}
	
}

void draw() {

	exit();
	
}