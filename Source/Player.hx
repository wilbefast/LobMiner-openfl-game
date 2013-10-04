/* 
'10 Second Onslaught' OpenFL game
(C) Copyright 2013 William Dyce, Antoine Seilles

All rights reserved. This program and the accompanying materials
are made available under the terms of the GNU Lesser General Public License
(LGPL) version 3 which accompanies this distribution, and is available at
http://www.gnu.org/licenses/lgpl.html

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.
*/

class Player
{
	// ---------------------------------------------------------------------------
	// READ-ONLY
	// ---------------------------------------------------------------------------

	public var keyLeft(default, null) : Int;
	public var keyRight(default, null) : Int;
	public var keyUp(default, null) : Int;
	public var keyDown(default, null) : Int;
	public var keyA(default, null) : Int;
	public var keyB(default, null) : Int;
	public var colour(default, null) : Int;

	// ---------------------------------------------------------------------------
	// CONSTRUCTOR
	// ---------------------------------------------------------------------------
	public function new(
		_keyLeft : Int, 
		_keyRight : Int, 
		_keyUp : Int, 
		_keyDown : Int, 
		_keyA : Int, 
		_keyB : Int,
		_colour : Int ) : Void
	{
		keyLeft = _keyLeft;
		keyRight = _keyRight;
		keyUp = _keyUp;
		keyDown = _keyDown;
		keyA = _keyA;
		keyB = _keyB;
		colour = _colour;

		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
}
