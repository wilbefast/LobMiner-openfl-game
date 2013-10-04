/* 
'Lob Miner' OpenFL game made for Chain Jam #1
(C) Copyright 2013 William Dyce

All rights reserved. This program and the accompanying materials
are made available under the terms of the GNU Lesser General Public License
(LGPL) version 3 which accompanies this distribution, and is available at
http://www.gnu.org/licenses/lgpl.html

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.
*/

import hacksaw.GameObject;

class Avatar extends GameObject 
{
	// ---------------------------------------------------------------------------
	// READ-ONLY
	// ---------------------------------------------------------------------------

	public var player(default, null) : Player;

	// ---------------------------------------------------------------------------
	// CONSTRUCTOR
	// ---------------------------------------------------------------------------

	public function new(_x : Float, _y : Float, _player : Player) : Void
	{
		super(_x, _y, 16);
		player = _player;

		// debug graphics
		graphics.beginFill(player.colour);
		graphics.drawCircle(x, y, radius);

		// movement
		desiredDirection = new VZ(0.0, 0.0);
	}

	// ---------------------------------------------------------------------------
	// UPDATE
	// ---------------------------------------------------------------------------

	private var desiredDirection : V2;
	private var desiresHarvester : Bool = false;
	private var desiresTurret : Bool = false;

	public override function update(dt : Float) : Void
	{
		super.update(dt);

		// desired movement direction
		desiredDirection.x = desiredDirection.y = 0;
		if(player.keyLeft)
			desiredDirection.x--;
		if(player.keyRight)
				desiredDirection.x++;
		if(player.keyUp)
			desiredDirection.y--;
		if(player.keyDown)
				desiredDirection.y++;
		desiredDirection.normalise();

		// desired unit creation
		desiresHarvester = player.keyA;
		desiresTurret = player.keyB;

		// move in desired direction if the current state permits it
		x += dt*desiredDirection.x;
		y += dt*desiredDirection.y;
	}
}
