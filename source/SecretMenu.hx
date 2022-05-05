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
import flixel.ui.FlxButton;
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

    var daSecret:String = "";

    override function create()
    {

        secretText = new FlxUIInputText(0, 500, 300, daSecret, 20);
        secretText.screenCenter(X);
        add(secretText);

        FlxG.mouse.visible = true;

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
            if(controls.BACK){
                MusicBeatState.switchState(new MajinMenu());
            }
        }

        if(FlxG.keys.justPressed.ENTER){
            switch(daSecret.toLowerCase()){
                case "insertrandomshithere":
                    PlayState.isStoryMode = false;
                    PlayState.isSecret = true;
                    PlayState.storyPlaylist = ['starlight'];
                    PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase(), PlayState.storyPlaylist[0].toLowerCase());
                    FlxG.sound.music.stop();
                    LoadingState.loadAndSwitchState(new PlayState());
                case "thesenuts":
                    trace('these nuts on yo face lmao gottem!!!');
                default:
                    FlxG.sound.play(Paths.sound('clickText'));
                    trace('sorry bro but thats invalid');
            }
        }

        super.update(elapsed);
    }

    override function destroy() {
        FlxG.mouse.visible = false;
        super.destroy();
    }
}