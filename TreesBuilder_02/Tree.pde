class Tree{
	
	PVector loc;
	float angle, length, lenMult, angleMult, lim;
	int counter;

	Tree(PVector _loc, float _angle, float _lim){

		//Redirecting class attributes.
		loc = _loc;
		lenMult = 0.8;
		angleMult = 0.8;

		// angle = HALF_PI;
		angle = _angle;
		length = 30;
		lim = _lim;
		// lim = 3;
	}


	void plant(){

		pushMatrix();
		translate(loc.x, loc.y);
		text("Limit: " + str(lim) + " || " + "Angle: " + str(degrees(angle)) + "°", 0, 25);
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
		angleR = random(angleR*angleMult*0.6, angleR*angleMult);

		strokeWeight(len/8);

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