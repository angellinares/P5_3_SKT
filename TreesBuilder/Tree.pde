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


	void plant(PVector loc1){

		grow(loc1,counter);

	}

	void grow(PVector lastLoc, int counter_int){

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


	PVector randomV(float angle, float length){

		PVector V;
		float rAngle = random(-angle, angle);
		float rLength = random(0.5*length,length);

		V = PVector.fromAngle(rAngle);
		V.mult(rLength);

		return V;

	}


}