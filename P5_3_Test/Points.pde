class Points {
  
  PVector _loc, vPositive, vNegative;
  float _rad, coin;
  int mult;

	Points (PVector loc, float rad) {


		_loc = loc;
		_rad = rad;
		coin = random(0,1);
		
	}

	void disp(){

		stroke(70);
		strokeWeight(10);
		noFill();
		//strokeWeight(_rad);
		//point(_loc.x, _loc.y);
		//ellipse(_loc.x, _loc.y, _rad, _rad);

		if (coin>0.5) {
			vPositive = new PVector(_rad,_rad);
			vNegative = new PVector(-_rad,-_rad);
		}else{
			vPositive = new PVector(_rad,-_rad);
			vNegative = new PVector(-_rad,_rad);	
		}
		
		PVector loc1, loc2;

		loc1 = PVector.add(_loc,vPositive);
		loc2 = PVector.add(_loc,vNegative);

		line(loc1.x, loc1.y, loc2.x, loc2.y);

	}

}