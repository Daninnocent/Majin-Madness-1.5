package;

import flixel.FlxG;
import flixel.FlxSprite;
#if desktop
import Discord.DiscordClient;
#end
import flixel.effects.FlxFlicker;
import flixel.tweens.FlxTween.tween;
import flixel.tweens.FlxEase.quadOut;
import flixel.math.FlxPoint;
import flixel.addons.display.FlxBackdrop;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MajinMenu extends MusicBeatState {
    public static var curSelected:Int = 0;
    var majinMenu = [
        'story_mode',
        'freeplay',
        'credits',
        'awards',
        'options'  
    ];
    var menuItemsArray:Array<FlxSprite>;
    var pos:FlxPoint = new FlxPoint();

    public static var versionOfMajin:String = '1.5';

    // public static var isSecretMenu:Bool = false;

    var flickMenus = false;

    var bg:FlxBackdrop;
    var bg2:FlxBackdrop;
    var bg3:FlxSprite;

    override function create() {
        #if desktop
        DiscordClient.changePresence('In Majin Menu...', null);
        #end
		bg = new FlxBackdrop(Paths.image('bluestuff'), 0.2, 0, true, true);
		bg.velocity.set(200, 110);
		bg.updateHitbox();
		bg.alpha = 0.5;
		bg.screenCenter(X);
		add(bg);

        bg2 = new FlxBackdrop(Paths.image('purplestuff'), 0.2, 0, true, true);
		bg2.velocity.set(200, 110);
		bg2.updateHitbox();
		bg2.alpha = 0;
		bg2.screenCenter(X);
		add(bg2);
        if(!FlxG.save.data.majinweekdone && majinMenu != null){ // secret menu thing
            majinMenu.insert(5, 'secret');
        } else if (FlxG.save.data.majinweekdone && majinMenu != null) {
            majinMenu.insert(5, 'extras');
        }
        if (menuItemsArray == null) menuItemsArray = [];
        for (i in 0...majinMenu.length) {
            var menuItem = new FlxSprite(FlxG.width / 2 - 10, 30 + (120 * i) - majinMenu.length);
            menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + majinMenu[i]);
            menuItem.animation.addByPrefix('select', majinMenu[i] + ' selected', 0, false);
            menuItem.animation.addByPrefix('unselect', majinMenu[i] + ' unselected', 0, false);
            menuItem.animation.play('unselect');
            menuItem.ID = i;
            // menuItem.offset.x = -Math.round(FlxG.width / 8);
            menuItem.setGraphicSize(Std.int(menuItem.width * 0.7));
            menuItem.updateHitbox();
            menuItem.antialiasing = ClientPrefs.globalAntialiasing;
            menuItemsArray.push(menuItem);
            add(menuItem);
        }
        changeSelection();

        bg3 = new FlxSprite().loadGraphic(Paths.image('menu logo thing'));
		add(bg3);

        super.create();

	var majinVersion:FlxText = new FlxText(5, FlxG.height - 24, 0, 'Majin Madness v' + versionOfMajin, 12);
        majinVersion.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        majinVersion.borderQuality = 1;
        majinVersion.borderSize = 1.50;
        add(majinVersion);

        // changing smth - Endev

        #if sys
        var deviceName:String = Sys.systemName();

        majinVersion.text += '\n' + deviceName + ' Release\n';
        majinVersion.y = FlxG.height - 44;
        #end

    }

    override function update(elapsed:Float) {
        if(bg.alpha == 0.5){
            FlxTween.tween(bg, {alpha: 0}, 3, {ease: FlxEase.circOut});
            FlxTween.tween(bg2, {alpha: 0.5}, 3, {ease: FlxEase.circOut});
        }

        if(bg2.alpha == 0.5){
            FlxTween.tween(bg, {alpha: 0.5}, 3, {ease: FlxEase.circOut});
            FlxTween.tween(bg2, {alpha: 0}, 3, {ease: FlxEase.circOut});
        }

        if(!flickMenus){
            if (controls.UI_UP_P) {
                changeSelection(-1);
                FlxG.sound.play(Paths.sound('scrollMenu'));
            }
            if (controls.UI_DOWN_P) {
                changeSelection(1);
                FlxG.sound.play(Paths.sound('scrollMenu'));
            }
            if (controls.BACK) {
                FlxG.switchState(new TitleState());
                FlxG.sound.play(Paths.sound('cancelMenu'));
            }
            if (controls.ACCEPT) {
                if(majinMenu[curSelected] == 'secret'){
                    FlxG.sound.play(Paths.sound('clickText'));
                } else {
                    flickMenus = true;
                    FlxG.sound.play(Paths.sound('confirmMenu'));
                    for(item in menuItemsArray){
                        if(item.ID == curSelected){
                            FlxFlicker.flicker(item, 1, 0.06, false, true, function(_) onSwitchState());
                        } else {
                            tween(item, {alpha: 0}, 0.4, {ease: quadOut, onComplete: function(_) item.kill()});
                            continue;
                        }
                    }
                }
            }
        }
        super.update(elapsed);
    }

    function onSwitchState()
    {
        switch (majinMenu[curSelected]) {
            case 'story_mode':
                FlxG.switchState(new StoryMenuState());
            case 'freeplay':
                FlxG.switchState(new FreeplayState());
            case 'credits':
                FlxG.switchState(new CreditsState());
            case 'awards':
                FlxG.switchState(new AchievementsMenuState());
            case 'options':
                FlxG.switchState(new options.OptionsState());
            case 'extras':
                FlxG.switchState(new SecretMenu());
        }
        flickMenus = false;
    }

    function changeSelection(change:Int = 0)
    {
        curSelected += change;

        if (curSelected < 0)
            curSelected = majinMenu.length - 1;
        else if (curSelected >= majinMenu.length)
            curSelected = 0;

        for (item in menuItemsArray) {
            if(item.ID != curSelected){
                item.animation.play('unselect');
            } else {
                item.animation.play('select');
            }
            if (item.animation.curAnim != null) {
                if (item.animation.curAnim.name == 'select') {
                    pos.x = FlxG.width / 2 - 40;
                } else {
                    pos.x = FlxG.width / 2 - 10;
                }
                item.x = pos.x;
            }
            continue;
        }

        // this is unused lmao -Endev
        for (i in 0...menuItemsArray.length) {
            var item:Dynamic = menuItemsArray[i];
            if (item.animation.curAnim != null) {
                var offset = (120 * i) - majinMenu.length;
                if (item.animation.curAnim.name == 'select') {
                    pos.y = 35 + offset;
                } else {
                    pos.y = 30 + offset;
                }
                continue;
            }
        }
    }
}
