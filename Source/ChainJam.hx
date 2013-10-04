import flash.errors.Error;
import flash.external.ExternalInterface;
import flash.ui.Keyboard;

/**
 * ...
 * @author Martin Jonasson, m@grapefrukt.com
 */
class ChainJam 
{
	
	public static var PLAYER1_LEFT		:Int = Keyboard.LEFT;
	public static var PLAYER1_RIGHT		:Int = Keyboard.RIGHT;
	public static var PLAYER1_UP		:Int = Keyboard.UP;
	public static var PLAYER1_DOWN		:Int = Keyboard.DOWN;
	public static var PLAYER1_ACTION1	:Int = Keyboard.Z;
	public static var PLAYER1_ACTION2	:Int = Keyboard.X;
	
	public static var PLAYER2_LEFT		:Int = Keyboard.J;
	public static var PLAYER2_RIGHT		:Int = Keyboard.L;
	public static var PLAYER2_UP		:Int = Keyboard.I;
	public static var PLAYER2_DOWN		:Int = Keyboard.K;
	public static var PLAYER2_ACTION1	:Int = Keyboard.N;
	public static var PLAYER2_ACTION2	:Int = Keyboard.M;
	
	public static var PLAYER3_LEFT		:Int = Keyboard.A;
	public static var PLAYER3_RIGHT		:Int = Keyboard.D;
	public static var PLAYER3_UP		:Int = Keyboard.W;
	public static var PLAYER3_DOWN		:Int = Keyboard.S;
	public static var PLAYER3_ACTION1	:Int = Keyboard.Q;
	public static var PLAYER3_ACTION2	:Int = Keyboard.E;
	
	public static var PLAYER4_LEFT		:Int = Keyboard.F;
	public static var PLAYER4_RIGHT		:Int = Keyboard.H;
	public static var PLAYER4_UP		:Int = Keyboard.T;
	public static var PLAYER4_DOWN		:Int = Keyboard.G;
	public static var PLAYER4_ACTION1	:Int = Keyboard.R;
	public static var PLAYER4_ACTION2	:Int = Keyboard.Y;
	
	public static var PLAYER1_COLOR		:Int = 0x313232;
	public static var PLAYER2_COLOR		:Int = 0x27ADE3;
	public static var PLAYER3_COLOR		:Int = 0xEE368A;
	public static var PLAYER4_COLOR		:Int = 0xB0D136;
	
	private static var local : Bool = false;

	public function new() 
	{
		throw new Error("You can't create an instance of this class, use it's static methods instead");
	}
	
	/**
	 * Must be called when the game launches.  
	 */
	public static function init() 
	{
		try { ExternalInterface.call("GameStart"); }
		catch (e:Error) 
		{
			trace("Can not communicate with browser. Assuming local game.");
			local = true;
		}
	}
	
	/**
	 * Add points to a player. Note: Once added, points can't be subtracted. 
	 * @param player
	 * Select which player to award points to. (1-4)
	 * @param points
	 * Select how many points that player get. 
	 */
	public static function addPoints(player:Int, points : Int)
	{
		if (!local) 
		{
			switch(player) 
			{
				case 1: ExternalInterface.call("PlayerOnePoints(" + points +")");
				case 2: ExternalInterface.call("PlayerTwoPoints(" + points +")");
				case 3: ExternalInterface.call("PlayerThreePoints(" + points +")");
				case 4: ExternalInterface.call("PlayerFourPoints(" + points +")");
			}
		}
	}
	
	/**
	 * Only call once the game is complete. Will terminate your game and move on to the next. 
	 */
	public static function endGame() 
	{
		if(!local) 
			ExternalInterface.call("GameEnd");
	}
	
}