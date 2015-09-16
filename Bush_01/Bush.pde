class Tree{
	
	PVector loc;
	float angle, length, lenMult, angleMult, lim;
	int counter;

	Tree(PVector _loc, float _angle, float _lim){

		//Redirecting class attributes.
		loc = _loc;
		lenMult = 0.8;
		angleMult = 1.1;

		// angle = HALF_PI;
		angle = _angle;
		length = 30;
		lim = _lim;
		// lim = 3;
	}


	void plant(){

		pushMatrix();
		translate(loc.x, loc.y);
		tag();
		noFill();
		grow(length, angle);
		popMatrix();

	}

	void grow(float len, float angleR){

		if (len == length) {
			strokeCap(SQUARE);
			strokeWeight(len/16);
			line(0, 0, 0, -len);
			strokeCap(ROUND);
		}
		
		translate(0, -len);
		//len*=0.8;

		//Reducing and randomizing branching coeficients.

		len = random(len*lenMult*0.8, len*lenMult);
		angleR = random(angleR*angleMult*0.8, angleR*angleMult);

		strokeWeight(len/8);

		if (len>lim) {

			pushMatrix();
			rotate(angleR);
			//line(0, 0, 0, -len);
			bezier(0.00,0.00,len/2,-len/2,-len/2,-len/2,0.00,-len);
			//translate(0, -len);
			grow(len,angleR);
			popMatrix();
			rotate(-angleR);
			strokeWeight(len/8);
			//line(0, 0, 0, -len);
			bezier(0.00,0.00,-len/2,-len/2,len/2,-len/2,0.00,-len);
			//translate(0, -len);
			grow(len,angleR);
		}
	}

	void tag(){
		fill(255);
		text("Limit: " + str(lim) + " || " + "Angle: " + str(degrees(angle)) + "°", 0, 25);

	}

}