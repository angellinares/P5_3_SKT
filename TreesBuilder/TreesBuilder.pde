// Build trees clicking in the window

ArrayList<Tree> Trees = new ArrayList<Tree>();
PVector mousePos;
int item;

void setup() {

	size(512, 512);
	background(220);
	
}

void draw() {
	

}

void mousePressed(){
	mousePos = new PVector(mouseX,mouseY);
	Trees.add(new Tree(mousePos));

	item = Trees.size()-1;

	Tree t1 = Trees.get(item);
	t1.plant(mousePos);

}