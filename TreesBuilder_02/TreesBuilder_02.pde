// Build trees clicking in the window

ArrayList<Tree> Trees = new ArrayList<Tree>();
PVector mousePos;
int item, numTrees, test;

void setup() {

	size(512, 512);
	background(220);
	
}

void draw() {
	
	background(220);
	for (int i = 0; i < Trees.size(); ++i) {

		Trees.get(i).plant();
		
	}
	
}

void mousePressed(){
	mousePos = new PVector(mouseX,mouseY);
	Trees.add(new Tree(mousePos));

	item = Trees.size()-1;

	Tree t1 = Trees.get(item);
	t1.plant();

}