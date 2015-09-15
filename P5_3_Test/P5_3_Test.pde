//Just a small test to refresh Processing sintax.


int nPointsX = 25;
int nPointsY = 25;


float locX = 0;
float locY = 0;
PVector loc;
float h,stepX, stepY, mouseDist;
int counter;
Points[] ptList;


void setup(){
 
 size(720, 720);
 smooth();
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

  		ptList [counter] = new Points(loc,int(i*j/10));

  		counter++;

  	}
  }
}

void draw(){

 background(220);

 for (int i = 0; i < counter; ++i) {

 	//mouseDist = dist(mouseX,mouseY,ptList[i]._loc.x,ptList[i]._loc.y);
 	//ptList[i]._rad = stepX/2*map(mouseDist,0,1000,0,1);
 	ptList[i]._rad =stepY/2*map(mouseX,0,720,0,1);
 	ptList[i].disp();
 	

 } 
}

void mousePressed(){

	setup();

}