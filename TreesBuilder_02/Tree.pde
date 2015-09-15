class Tree{
	
	PVector loc;
	float angle, length, lenMult, angleMult;
	int lim, counter;

	Tree(PVector _loc, float _lenMult, float _angleMult){

		//Redirecting class attributes.
		loc = _loc;
		lenMult = _lenMult
		angleMult = _angleMult

		angle = HALF_PI;
		length = 30;
		lim = 3;
	}


	void plant(){

		pushMatrix();
		translate(loc.x, loc.y);
		grow(length, angle);
		popMatrix();

	}

	void grow(float len, float angleR){

		strokeWeight(len/8);
		line(0, 0, 0, -len);
		translate(0, -len);
		//len*=0.8;

		//Reducing and randomizing branching coeficients.

		len = random(len*lenMult*0.8, len*lenMult);
		angleR = random(angleR*angleMult*0.8, angleR*angleMult);

		if (len>lim) {

			pushMatrix();
			rotate(angleR);
			line(0, 0, 0, -len);
			grow(len,angleR);
			popMatrix();
			rotate(-angleR);
			line(0, 0, 0, -len);
			grow(len,angleR);
		}
	}

}