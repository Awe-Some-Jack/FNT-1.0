package states;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class CreditsState extends MusicBeatState
{
    override public function create():Void
    {
        super.create();

        var xPositions = [20, 300, 580];
        var yStart = 40;
        var yGap = 20;

        var yTrack:Array<Int> = [yStart, yStart, yStart];

        var categories:Array<{title:String, names:Array<String>}> = [
            { title: "Team Leader", names: ["sha_mi0921"] },
            { title: "Team Co-Leader", names: ["AweSomeJack", "snowmelt"] },
            { title: "Programmers", names: ["bpforest", "AweSomeJack"] },
            { title: "Composers", names: ["DevinXD(EX)", "Saf.one", "SDL(EX)", "hmm111", "Mr Takoyaky", "Askliskal"] },
            { title: "Artists", names: ["logan", "snowmelt", "cash", "rage_87", "sucheol", "nyangko", "Lem0nA", "emerald1628(EX)", "white", "Ahmed Wael Hamdy", "Duolc(EX)", "Amon_creck"] },
            { title: "Animator", names: ["yuseong0405", "UNION", "neondash", "Retro(EX)", "Nanda Pratama"] },
            { title: "Charters", names: ["dia", "Reiad(EX)", "snowmelt"] },
            { title: "Special Thanks", names: ["raul - Brothers in arms Vocal Remaster FLP"] }
        ];

    var columnMap = [0, 0, 0, 0, 1, 1, 2, 2];

    for (i in 0...categories.length)
    {
        var category = categories[i];
        var col = columnMap[i];
        var x = xPositions[col];
        var y = yTrack[col];

        var titleText = new FlxText(x, y, 0, category.title, 16);
        titleText.setFormat(null, 16, FlxColor.YELLOW, LEFT);
        add(titleText);

        y += yGap;

        for (name in category.names)
        {
            var nameText = new FlxText(x + 20, y, 0, name, 14);
            nameText.setFormat(null, 14, FlxColor.WHITE, LEFT);
            add(nameText);
            y += yGap;
        }
            yTrack[col] = y + yGap;
        }
    }

    var quitting:Bool = false;
    override function update(elapsed:Float)
    {
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
		}

		if(!quitting)
		{
			if (FlxG.keys.justPressed.ESCAPE)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
    }
}