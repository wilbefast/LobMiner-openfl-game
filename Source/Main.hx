import flash.display.Sprite;

import hacksaw.DefaultFont;
import hacksaw.DefaultTextField;
import hacksaw.SoundManager;

class Main extends Sprite 
{
	public function new () 
	{
		super ();

		// ------------------------------------------------------------------------
		// Start Chain Jam interface
		// ------------------------------------------------------------------------

		ChainJam.init();


		// ------------------------------------------------------------------------
		// Create Player objects
		// ------------------------------------------------------------------------

		var players = new Array<Player>();
		players[0] = new Player(
			ChainJam.PLAYER1_LEFT, 
			ChainJam.PLAYER1_RIGHT, 
			ChainJam.PLAYER1_UP, 
			ChainJam.PLAYER1_DOWN, 
			ChainJam.PLAYER1_ACTION1, 
			ChainJam.PLAYER1_ACTION2,
			ChainJam.PLAYER1_COLOR);
		players[1] = new Player(
			ChainJam.PLAYER2_LEFT, 
			ChainJam.PLAYER2_RIGHT, 
			ChainJam.PLAYER2_UP, 
			ChainJam.PLAYER2_DOWN, 
			ChainJam.PLAYER2_ACTION1, 
			ChainJam.PLAYER2_ACTION2,
			ChainJam.PLAYER2_COLOR);
		players[2] = new Player(
			ChainJam.PLAYER3_LEFT, 
			ChainJam.PLAYER3_RIGHT, 
			ChainJam.PLAYER3_UP, 
			ChainJam.PLAYER3_DOWN, 
			ChainJam.PLAYER3_ACTION1, 
			ChainJam.PLAYER3_ACTION2,
			ChainJam.PLAYER3_COLOR);
		players[3] = new Player(
			ChainJam.PLAYER4_LEFT, 
			ChainJam.PLAYER4_RIGHT, 
			ChainJam.PLAYER4_UP, 
			ChainJam.PLAYER4_DOWN, 
			ChainJam.PLAYER4_ACTION1, 
			ChainJam.PLAYER4_ACTION2,
			ChainJam.PLAYER4_COLOR);

		// ------------------------------------------------------------------------
		// Create Avatar objects
		// ------------------------------------------------------------------------

		var avatars = new Array<Avatar>();
		avatars[0] = new Avatar(32, 32, players[0]);
		avatars[1] = new Avatar(128, 128, players[1]);
		avatars[2] = new Avatar(128, 64, players[2]);
		avatars[3] = new Avatar(64, 128, players[3]);


		// ------------------------------------------------------------------------
		// Start Hacksaw
		// ------------------------------------------------------------------------

		DefaultFont.load();

		addChild(new DefaultTextField("Hello world!", 100, 100));

		// Sound
		//SoundManager.loadSound("teleport_in");
		//SoundManager.setMuted();

		// Music
		//snd_music = Assets.getSound("assets/music.mp3"); // flash doesn't like OOG :'(
		//channel = snd_music.play();
		//channel.addEventListener(Event.SOUND_COMPLETE, onMusicEnd);

		// ------------------------------------------------------------------------
		// Stop Chain Jam
		// ------------------------------------------------------------------------

		ChainJam.endGame();

	}
}