package;

import flixel.util.FlxTimer;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.effects.FlxFlicker;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.system.System;
import options.OptionsState;

class MajinMenu extends MusicBeatState
{
	public static var curSelected:Int = 0;
	public static var version:String = '1.5';

	private var menuList:Array<String> = ['story_mode', 'freeplay', 'credits', 'awards', 'options'];
	private var grpMenus:FlxTypedGroup<FlxSprite>;

	var bg:FlxBackdrop;
	var bg2:FlxBackdrop;
	var bg3:FlxSprite;

	override function create()
	{
		#if desktop
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (FlxG.save.data.majinWeekdone)
		{
			menuList.push('extras');
		}
		else
		{
			menuList.push('secret');
		}

		bg = new FlxBackdrop(Paths.image('bluestuff'), XY, 0, 0);
		bg.velocity.set(200, 110);
		bg.updateHitbox();
		bg.alpha = 0.5;
		bg.screenCenter(X);
		add(bg);

		bg2 = new FlxBackdrop(Paths.image('purplestuff'), XY, 0, 0);
		bg2.velocity.set(200, 110);
		bg2.updateHitbox();
		bg2.alpha = 0;
		bg2.screenCenter(X);
		add(bg);

		bg.spacing.x = 0.2;
		bg2.spacing.x = 0.2;

		grpMenus = new FlxTypedGroup<FlxSprite>();
		add(grpMenus);

		for (i in 0...menuList.length)
		{
			var menuItem:FlxSprite = new FlxSprite(FlxG.width / 2 - 10, 30 + (120 * i) - menuList.length);
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + menuList[i]);
			menuItem.animation.addByPrefix('select', menuList[i] + ' selected', 0, false);
			menuItem.animation.addByPrefix('unselect', menuList[i] + ' unselected', 0, false);
			menuItem.animation.play('unselect');
			menuItem.ID = i;
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.7));
			menuItem.updateHitbox();
			menuItem.antialiasing = true;
			grpMenus.add(menuItem);
		}

		bg3 = new FlxSprite().loadGraphic(Paths.image('menu logo thing'));
		add(bg3);

		var versionText:FlxText = new FlxText(5, FlxG.height - 24, 0, 'Majin Madness v' + version, 12);
		versionText.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		versionText.borderQuality = 1;
		versionText.borderSize = 1.50;
		add(versionText);

		#if sys
		// Sys.systemName() is broken for mobile users!
		var deviceName:String = System.platformName; // Sys.systemName();

		versionText.text = '\n' + deviceName + " " + 'Released' + "\n";
		versionText.y -= 20;
		#end

		#if android
		addVirtualPad(UP_DOWN, A_B);
		#end

		changeSelection();

		super.create();
	}

	var stopspamming:Bool = false;
	var goingback:Bool = false;

	override function update(elapsed:Float)
	{
		if (bg.alpha < 0.5)
		{
			FlxTween.tween(bg, {alpha: 0}, 3, {ease: FlxEase.circOut});
			FlxTween.tween(bg2, {alpha: 0.5}, 3, {ease: FlxEase.circOut});
		}

		if (bg2.alpha < 0.5)
		{
			FlxTween.tween(bg, {alpha: 0.5}, 3, {ease: FlxEase.circOut});
			FlxTween.tween(bg2, {alpha: 0}, 3, {ease: FlxEase.circOut});
		}

		if (!stopspamming && !goingback)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeSelection(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeSelection(1);
			}

			if (controls.BACK)
			{
				goingback = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				openNextState();
			}
		}

		super.update(elapsed);
	}

	function openNextState()
	{
		if (menuList[curSelected] == 'secret')
		{
			FlxG.sound.play(Paths.sound('clickText'));
			return;
		}

		FlxG.sound.play(Paths.sound('confirmMenu'));
		var daItem = grpMenus.members[curSelected];
		stopspamming = true;

		grpMenus.forEach(function(spr:FlxSprite)
		{
			if (daItem.ID != spr.ID)
			{
				FlxTween.tween(spr, {alpha: 0}, 0.4, {ease: FlxEase.quadInOut});
			}
		});

		FlxFlicker.flicker(daItem, 1, 0.06, false, false, function(flick:FlxFlicker)
		{
			switch (menuList[curSelected])
			{
				case 'story_mode':
					MusicBeatState.switchState(new StoryMenuState());
				case 'freeplay':
					MusicBeatState.switchState(new FreeplayState());
				case 'credits':
					MusicBeatState.switchState(new CreditsState());
				case 'awards':
					MusicBeatState.switchState(new AchievementsMenuState());
				case 'options':
					MusicBeatState.switchState(new OptionsState());
				case 'extras':
					MusicBeatState.switchState(new SecretMenu());
			}
		});

		new FlxTimer().start(0.06, function(tmr:FlxTimer)
		{
			nospamming = false;
		});
	}

	function changeSelection(amount:Int = 0)
	{
		curSelected += amount;

		if (curSelected < 0)
			curSelected = grpMenus.length - 1;
		if (curSelected >= grpMenus.length)
			curSelected = 0;

		grpMenus.forEach(function(spr:FlxSprite)
		{
			if (spr.ID == curSelected)
			{
				spr.animation.play('select', true);
				spr.x = FlxG.width / 2 - 40;
			}
			else
			{
				spr.animation.play('unselect');
				spr.x = FlxG.width / 2 - 10;
			}
		});
	}
}
