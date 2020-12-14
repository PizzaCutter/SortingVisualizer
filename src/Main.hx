import hxd.System;
// import js.html.WindowClient;
// import js.html.Window;
import SortingAlgorithm.SortingAlgorithm;
import haxe.display.Display.Package;
import haxe.Timer;
import hxd.Key in K;

import js.Browser;

class Main extends hxd.App {
        var sortingAlgorithm : SortingAlgorithm;
        var graphicsTest : h2d.Graphics;
        
        var index : Int = 0;

        var id : Int;

        override function init() {
            graphicsTest = new h2d.Graphics(s2d);
            //sortingAlgorithm = new BubbleSortAlgorithm(new h2d.Graphics(s2d), engine);
        }

        override function update(dt:Float) {
            //sortingAlgorithm.update(dt);
            graphicsTest.beginFill(0xFFFF00, 1);
            graphicsTest.lineStyle(1, 0x000000);
            graphicsTest.drawRect(100 * index, 100 * index,100,100);
            graphicsTest.endFill();

            index++;
        }

        static function main() {
            new Main();
        }
    }