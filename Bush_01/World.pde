/*
Creates cell entities.
*/

class Cell {

	PVector loc;
	boolean state;	

	public Cell (PVector _loc, boolean _state) {
		
		loc = _loc;
		state = _state;

	}

}

/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/*
Creates a responsive grid that tracks objects movements.
*/

class 	World 	 {

	int xRes, yRes;

	World (	int _xRes, int _yRes) {

			xRes = _xRes;
			yRes = _yRes;
	}


	void createWorld(){


		for (int i = 0; i < xRes; ++i) {
			
			for (int j = 0; j < yRes; ++j) {
				

			}
		}


	}



}