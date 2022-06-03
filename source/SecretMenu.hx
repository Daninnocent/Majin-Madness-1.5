#if desktop
import Discord.DiscordClient;
#end
import Conductor.BPMChangeEvent;
import Section.SwagSection;
import Song.SwagSong;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
#if android
import android.flixel.FlxButton;
#else
import flixel.ui.FlxButton;
#end
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxColor;
import haxe.format.JsonParser;
import lime.utils.Assets;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.media.Sound;
import openfl.net.FileReference;
import openfl.utils.ByteArray;
import openfl.utils.Assets as OpenFlAssets;
import lime.media.AudioBuffer;
import flash.geom.Rectangle;
import flixel.addons.transition.FlxTransitionableState;
import flixel.util.FlxTimer;
import flixel.util.FlxSort;
#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
import flash.media.Sound;
#end

using StringTools;

class SecretMenu extends MusicBeatState
{
    var secretText:FlxUIInputText;
    var enteracodebitch:FlxText;
    var hint:FlxText;
    var stuff:FlxSprite;
    var bg:FlxSprite;
    var whiteshit:FlxSprite;
    var video:FlxVideo;

    var daSecret:String = "";

    var inmemes:Bool = false;
    var invideomemes:Bool = false;

    var stopfuckingspamming:Bool = false;

    override function create()
    {
        whiteshit = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE);
        whiteshit.alpha = 0;
        stuff = new FlxSprite();

        bg = new FlxSprite().loadGraphic(Paths.image('funisinfinite'));
		add(bg);

        enteracodebitch = new FlxText(0, 300, FlxG.width, "ENTER A CODE", 100);
        enteracodebitch.setFormat(Paths.font("needlemouse-serif.ttf"), 100, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        enteracodebitch.screenCenter(X);
        add(enteracodebitch);

        hint = new FlxText(-560, 690, FlxG.width, "HINT : GAMEFILES", 15);
        hint.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(hint);

        secretText = new FlxUIInputText(0, 500, 300, daSecret, 20);
        secretText.focusGained = () -> FlxG.stage.window.textInputEnabled = true;
        secretText.screenCenter(X);
        add(secretText);

        FlxG.mouse.visible = true;

        stuff.visible = false;
        add(stuff);

        add(whiteshit);

        #if android
        addVirtualPad(NONE, A_B);
        #end

        super.create();
    }

    override function update(elapsed:Float)
    {
        daSecret = secretText.text;

        var blockkeys:Bool = false;
		if(secretText.hasFocus) {
			FlxG.sound.muteKeys = [];
			FlxG.sound.volumeDownKeys = [];
			FlxG.sound.volumeUpKeys = [];
			blockkeys = true;
		}

        if(!blockkeys) {
			FlxG.sound.muteKeys = TitleState.muteKeys;
			FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
			FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;
		}

        if(!blockkeys){
            if(controls.BACK && !stopfuckingspamming){
                MusicBeatState.switchState(new MajinMenu());
            }
        }

        if(FlxG.keys.justPressed.ENTER #if android || _virtualpad.buttonA.justPressed #end && !inmemes && !stopfuckingspamming){
            FlxG.stage.window.textInputEnabled = false;
            switch(daSecret.toLowerCase()){
                // case "insertrandomshithere":
                //     stopfuckingspamming = true;
                //     flashyWashy(true);
                //     PlayState.isStoryMode = false;
                //     PlayState.isSecret = true;
                //     PlayState.storyPlaylist = ['starlight'];
                //     PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase(), PlayState.storyPlaylist[0].toLowerCase());
                //     FlxG.sound.music.stop();
                //     FlxTransitionableState.skipNextTransIn = true;
                //     FlxTransitionableState.skipNextTransOut = true;
                //     new FlxTimer().start(2, function(tmr:FlxTimer){
                //         LoadingState.loadAndSwitchState(new PlayState());
                //     });
                // case "thesenuts":
                //     trace('these nuts on yo face lmao gottem!!!');
                case "mjnboy":
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    PlayState.isStoryMode = false;
                    PlayState.isSecret = true;
                    PlayState.storyPlaylist = ['reflection'];
                    PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + '-fun', PlayState.storyPlaylist[0].toLowerCase());
                    FlxG.sound.music.stop();
                    FlxTransitionableState.skipNextTransIn = true;
                    FlxTransitionableState.skipNextTransOut = true;
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        LoadingState.loadAndSwitchState(new PlayState());
                    });
                case "starlight":
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    PlayState.isStoryMode = false;
                    PlayState.isSecret = true;
                    PlayState.storyPlaylist = ['starlight'];
                    PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase(), PlayState.storyPlaylist[0].toLowerCase());
                    FlxG.sound.music.stop();
                    FlxTransitionableState.skipNextTransIn = true;
                    FlxTransitionableState.skipNextTransOut = true;
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        LoadingState.loadAndSwitchState(new PlayState());
                    });
                case "damnhottie":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        enteracodebitch.visible = false;
                        bg.visible = false;
                        stuff.visible = true;
                        stuff.loadGraphic(Paths.image('sus/Thats sus bro'));
                        stuff.setPosition(0, 300);
                        stuff.screenCenter(X);
                        flashyWashy(false);
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        inmemes = true;
                    });
                case "start running":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        stuff.visible = true;
                        stuff.loadGraphic(Paths.image('sus/start running'));
                        stuff.setPosition(0, 110);
                        stuff.screenCenter(X);
                        stuff.setGraphicSize(1280,720);
                        flashyWashy(false);
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        inmemes = true;
                    });
                case "ricefields":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('ricefieldss'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                case "toast":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('Stole_toast'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                case "dudes":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('send_dudes720p'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                 case "crystalmf":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('majin roasts tf out of xeno'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                 case "freddyfatass":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('freddy_fatass_beatbox'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                 case "ldxmjin":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('ballsssss'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                 case "whenthe":
                    FlxG.sound.music.stop();
                    stopfuckingspamming = true;
                    flashyWashy(true);
                    new FlxTimer().start(2, function(tmr:FlxTimer){
                        video = new FlxVideo(Paths.video('ok its'));
                        
                        (video).finishCallback = function() {
                            FlxG.sound.playMusic(Paths.music('freakyMenu'));
                            LoadingState.loadAndSwitchState(new SecretMenu());
                        }
                    });
                    new FlxTimer().start(2.1, function(tmr:FlxTimer)
                    {
                        invideomemes = true;
                        inmemes = true;
                    });
                default:
                    FlxG.sound.play(Paths.sound('clickText'));
                    trace('sorry bro but thats invalid');
            }
        }

        if(FlxG.keys.justPressed.ENTER && stopfuckingspamming && inmemes)
        {
            #if desktop
            if(invideomemes){
            video.onVLCComplete();
            }
            #end
            FlxG.sound.playMusic(Paths.music('freakyMenu'));
            LoadingState.loadAndSwitchState(new SecretMenu());
        } 

        super.update(elapsed);
    }

    function flashyWashy(a:Bool)
	{
		if (a == true)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxTween.tween(whiteshit, {alpha: 1}, 0.4);
		}
		else
			FlxTween.color(whiteshit, 0.1, FlxColor.WHITE, FlxColor.BLUE);
			FlxTween.tween(whiteshit, {alpha: 0}, 0.2);

	}

    override function destroy() {
        FlxG.mouse.visible = false;
        super.destroy();
    }
}
