package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		animOffsets = new Map<String, Array<Dynamic>>();
		super(x, y);

		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = FlxAtlasFrames.fromSparrow('assets/images/GF_assets.png', 'assets/images/GF_assets.xml');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer', 0, -4);
				addOffset('sad', -2, -26);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, -4);
				addOffset("singRIGHT", 0, -9);
				addOffset("singLEFT", 0, -11);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 0, -16);
				addOffset('hairFall', 0, -12);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
				antialiasing = true;


			case 'gf-christmas':
				tex = FlxAtlasFrames.fromSparrow('assets/images/christmas/gfChristmas.png', 'assets/images/christmas/gfChristmas.xml');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -26);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, -2);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -1);

				playAnim('danceRight');
				antialiasing = true;

			
			case 'gf-pixel':
					tex = FlxAtlasFrames.fromSparrow('assets/images/weeb/gfPixel.png', 'assets/images/weeb/gfPixel.xml');
					frames = tex;
					animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
					animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
					animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
					addOffset('danceLeft', 0);
					addOffset('danceRight', 0);
	
					playAnim('danceRight');
	
					setGraphicSize(Std.int(width * PlayState.daPixelZoom));
					updateHitbox();
					antialiasing = false;
				

			case 'gf-car':
				tex = FlxAtlasFrames.fromSparrow('assets/images/gfCar.png', 'assets/images/gfCar.xml');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');
				antialiasing = true;


			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = FlxAtlasFrames.fromSparrow('assets/images/DADDY_DEAREST.png', 'assets/images/DADDY_DEAREST.xml');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle', 0, 10);
				addOffset("singUP", -6, 51);
				addOffset("singRIGHT", 2, 53);
				addOffset("singLEFT", -12, 6);
				addOffset("singDOWN", 0, -33);

				playAnim('idle');
				antialiasing = true;

			case 'spooky':
				tex = FlxAtlasFrames.fromSparrow('assets/images/spooky_kids_assets.png', 'assets/images/spooky_kids_assets.xml');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -15, 24);
				addOffset("singRIGHT", -85, -14);
				addOffset("singLEFT", 137, -24);
				addOffset("singDOWN", 47, -138);

				playAnim('danceRight');
				antialiasing = true;

			case 'mom':
				tex = FlxAtlasFrames.fromSparrow('assets/images/Mom_Assets.png', 'assets/images/Mom_Assets.xml');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');
				antialiasing = true;


			case 'mom-car':
				tex = FlxAtlasFrames.fromSparrow('assets/images/momCar.png', 'assets/images/momCar.xml');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 62, 71);
                addOffset("singRIGHT", 14, -46);
                addOffset("singLEFT", 197, -29);
                addOffset("singDOWN", 48, -143);

				playAnim('idle');
				antialiasing = true;

			case 'monster':
				tex = FlxAtlasFrames.fromSparrow('assets/images/Monster_Assets.png', 'assets/images/Monster_Assets.xml');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle', 0, 30);
				addOffset("singUP", 22, 93);
				addOffset("singRIGHT", -35, 40);
				addOffset("singLEFT", 57, 40);
				addOffset("singDOWN", 100, -67);
				playAnim('idle');
			case 'monster-christmas':
				tex = FlxAtlasFrames.fromSparrow('assets/images/christmas/monsterChristmas.png', 'assets/images/christmas/monsterChristmas.xml');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle', 0, 30);
				addOffset("singUP", 15, 50);
				addOffset("singRIGHT", -24, 0);
				addOffset("singLEFT", 55, 10);
				addOffset("singDOWN", 100, -90);
				playAnim('idle');
				antialiasing = true;

			case 'pico':
				tex = FlxAtlasFrames.fromSparrow('assets/images/Pico_FNF_assetss.png', 'assets/images/Pico_FNF_assetss.xml');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				playAnim('idle');

				addOffset('idle');
				addOffset("singUP", -60, 29);
                addOffset("singRIGHT", -8, -9);
                addOffset("singLEFT", -8, 0);
                addOffset("singDOWN", 129, -65);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;
				antialiasing = true;


			case 'bf' | 'bf-car':
				var tex = FlxAtlasFrames.fromSparrow('assets/images/BOYFRIEND.png', 'assets/images/BOYFRIEND.xml');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('fuckyou', 'BF FACK U', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('scared', -4);
                addOffset('deathLoop', 16, 5);
                addOffset("singRIGHTmiss", -44, 21);
                addOffset("singDOWN", 50, -52);
                addOffset("singLEFTmiss", 12, 17);
                addOffset("singUP", -29, 13);
				addOffset("fuckyou", -29, 13);
                addOffset('deathConfirm', 17, 43);
                addOffset('firstDeath', 17, 11);
                addOffset("hey", -4, 5);
                addOffset('idle', -5);
                addOffset("singDOWNmiss", 46, -24);
                addOffset("singRIGHT", -52, -7);
                addOffset("singLEFT", 12, -8);
                addOffset("singUPmiss", -5, 14);

				flipX = true;
				antialiasing = true;

				case 'bf-three' | 'bf-three-christmas' | 'bf-three-car':
				var tex = FlxAtlasFrames.fromSparrow('assets/images/BOYFRIEND_3.png', 'assets/images/BOYFRIEND_3.xml');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);
				
				//had to move him down a lil lol
				addOffset('scared', 1, -28);
                addOffset('deathLoop', 58, -34);
                addOffset("singRIGHTmiss", -2, -42);
                addOffset("singDOWN", 58, -99);
                addOffset("singLEFTmiss", 35, -48);
                addOffset("singUP", 15, -18);
                addOffset('deathConfirm', 66, 48);
                addOffset('firstDeath', 70, -12);
                addOffset("hey", 29, -25);
                addOffset('idle', 0, -26);
                addOffset("singDOWNmiss", 46, -110);
                addOffset("singRIGHT", -13, -49);
                addOffset("singLEFT", 34, -51);
                addOffset("singUPmiss", 12, -23);

				flipX = true;
				antialiasing = true;


				case 'bf-pixel':
				frames = FlxAtlasFrames.fromSparrow('assets/images/weeb/bfPixel.png', 'assets/images/weeb/bfPixel.xml');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;

				case 'bf-pixel-dead':
                frames = FlxAtlasFrames.fromSparrow('assets/images/weeb/bfPixelsDEAD.png', 'assets/images/weeb/bfPixelsDEAD.xml');
                animation.addByPrefix('idle', "BF Dies pixel", 24, false);
                animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
                animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
                animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);

                addOffset('idle');
                addOffset('firstDeath');
                addOffset('deathLoop', -37);
                addOffset('deathConfirm', -37);
                playAnim('idle');
                // pixel bullshit
                setGraphicSize(Std.int(width * 6));
                updateHitbox();
                antialiasing = false;
                flipX = true;


				case 'bf-two' | 'bf-two-christmas' | 'bf-two-car':
				//sus
				var tex = FlxAtlasFrames.fromSparrow('assets/images/BOYFRIEND_2.png', 'assets/images/BOYFRIEND_2.xml');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('scared', -24);
                addOffset('deathLoop', 6, 15);
                addOffset("singRIGHTmiss", -17, -13);
                addOffset("singDOWN", -24, -66);
                addOffset("singLEFTmiss", 11, -3);
                addOffset("singUP", 0, 25);
                addOffset('deathConfirm', 17, 70);
                addOffset('firstDeath', 17, 11);
                addOffset("hey", 14, 52);
                addOffset('idle', 0);
                addOffset("singDOWNmiss", -30, -66);
                addOffset("singRIGHT", -42, -7);
                addOffset("singLEFT", 1, -3);
                addOffset("singUPmiss", -18, 28);

				flipX = true;
				antialiasing = true;



			case 'bf-christmas':
				var tex = FlxAtlasFrames.fromSparrow('assets/images/christmas/bfChristmas.png', 'assets/images/christmas/bfChristmas.xml');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -13, 0);
				addOffset("singRIGHT", -18, 22);
				addOffset("singLEFT", 35, 5);
				addOffset("singDOWN", 72, -34);
				addOffset("singUPmiss", 17, 0);
				addOffset("singRIGHTmiss", -21, 20);
				addOffset("singLEFTmiss", 36, -6);
				addOffset("singDOWNmiss", 61, -38);
				addOffset("hey", 7, 4);

				flipX = true;
				antialiasing = true;


			

				case 'senpai':
				frames = FlxAtlasFrames.fromSparrow('assets/images/weeb/senpai.png', 'assets/images/weeb/senpai.xml');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle', 50, 111);
				addOffset('singUP', 38, 110);
				addOffset("singRIGHT", 63, 113);
				addOffset("singLEFT", 37, 111);
				addOffset("singDOWN", 46, 121);

				playAnim('idle');
				//Not sure if this is the right size but whatev.
				setGraphicSize(Std.int(width * 1.5));
				updateHitbox();
				antialiasing = false;

			case 'senpai-angry':
				frames = FlxAtlasFrames.fromSparrow('assets/images/weeb/senpai.png', 'assets/images/weeb/senpai.xml');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				
				addOffset('idle', 50, 111);
				addOffset('singUP', 38, 110);
				addOffset("singRIGHT", 63, 113);
				addOffset("singLEFT", 37, 111);
				addOffset("singDOWN", 46, 121);
	

				playAnim('idle');
				//Not sure if this is the right size but whatev.
				setGraphicSize(Std.int(width * 1.5));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = FlxAtlasFrames.fromSpriteSheetPacker('assets/images/weeb/spirit.png', 'assets/images/weeb/spirit.txt');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;
			
			case 'spirit2':
				//came here expecting to see minus spirit? hell nah fam
				frames = FlxAtlasFrames.fromSparrow('assets/images/weeb/spirit2.png', 'assets/images/weeb/spirit2.xml');
				animation.addByPrefix('idle', "Angry Senpai Idle copy 2 instance 1", 24, false);
				animation.addByPrefix('singUP', "Angry Senpai UP NOTE copy instance 1", 24, false);
				animation.addByPrefix('singRIGHT', "Angry Senpai RIGHT NOTE copy instance 1", 24, false);
				animation.addByPrefix('singLEFT', "Angry Senpai LEFT NOTE copy instance 1", 24, false);
				animation.addByPrefix('singDOWN', "Angry Senpai DOWN NOTE copy instance 1", 24, false);
	
				addOffset('idle', -200, -119);
				addOffset('singUP', -198, -119);
				addOffset("singRIGHT", -200, -120);
				addOffset("singLEFT", -199, -120);
				addOffset("singDOWN", -200, -121);
	
				setGraphicSize(Std.int(width * 1.5));
				updateHitbox();
	
				playAnim('idle');
	
				antialiasing = false;
	
	

				
			case 'parents-christmas':
				frames = FlxAtlasFrames.fromSparrow('assets/images/christmas/mom_dad_christmas_assets.png',
					'assets/images/christmas/mom_dad_christmas_assets.xml');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -47, 24);
				addOffset("singRIGHT", -1, -23);
				addOffset("singLEFT", -30, 16);
				addOffset("singDOWN", -31, -29);
				addOffset("singUP-alt", -47, 24);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -30, 15);
				addOffset("singDOWN-alt", -30, -27);
				antialiasing = true;

			
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		
				if(animation.curAnim.name == 'idle' && animation.curAnim.finished)
					playAnim('idle',false,false,11);
		
			case 'bf-car':
				if(animation.curAnim.name == 'idle' && animation.curAnim.finished)
					playAnim('idle',false,false,11);
			
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf' | 'gf-christmas' | 'gf-car'| 'gf-pixel' :
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
					
				case 'mom-car':
					if(danced)
						playAnim('idle',true);
					danced = !danced;
			

			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(animation.curAnim.name);
		if (animOffsets.exists(animation.curAnim.name))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
