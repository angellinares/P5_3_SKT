class Tree{
	
	PVector loc;
	float angle, length;
	int lim, counter;

	Tree(PVector _loc){

		loc = _loc;
		counter = 0;
		angle = HALF_PI;
		length = 50;
		lim = 10;
	}


	void plant(){

		pushMatrix();
		translate(loc.x, loc.y);
		grow(length);
		popMatrix();

	}

	void grow(float len){

		strokeWeight(len/8);
		line(0, 0, 0, -len);
		translate(0, -len);
		len*=0.8;

		if (len>5) {

			pushMatrix();
			rotate(mouseX*0.01);
			line(0, 0, 0, -len);
			grow(len);
			popMatrix();
			rotate(-mouseX*0.01);
			line(0, 0, 0, -len);
			grow(len);
		}
	}

}