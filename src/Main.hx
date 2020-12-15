//import hxd.System;
import SortingAlgorithm.SortingAlgorithm;
import QuickSortAlgorithm;

class Main extends hxd.App {
        var sortingAlgorithm : SortingAlgorithm;
        var graphicsTest : h2d.Graphics;

        var positionX : Int = 0; 
    
        override function init() {
            graphicsTest = new h2d.Graphics(s2d);
            //sortingAlgorithm = new BubbleSortAlgorithm(new h2d.Graphics(s2d), engine);
            sortingAlgorithm = new QuickSortAlgorithm(new h2d.Graphics(s2d), engine);

            #if (target.threaded)
            var thread = sys.thread.Thread.create(() -> {
                sortingAlgorithm.startSort();
            });
            #end
        }

        override function update(dt:Float) {
            sortingAlgorithm.render();
        }

        static function main() {
            new Main();
        }
    }