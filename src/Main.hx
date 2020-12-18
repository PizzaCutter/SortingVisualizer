//import hxd.System;
import SortingAlgorithm.SortingAlgorithm;
import QuickSortAlgorithm;
import InsertionSortAlgorithm;

class Main extends hxd.App {
        var sortingAlgorithm : SortingAlgorithm;
        var graphicsTest : h2d.Graphics;

        var positionX : Int = 0; 

        var sortingThread : sys.thread.Thread;
        
        var bStartSorting : Bool = true;
    
        override function init() {
            graphicsTest = new h2d.Graphics(s2d);
            //sortingAlgorithm = new BubbleSortAlgorithm(new h2d.Graphics(s2d), engine);
            //sortingAlgorithm = new QuickSortAlgorithm(new h2d.Graphics(s2d), engine);
            sortingAlgorithm = new InsertionSortAlgorithm(new h2d.Graphics(s2d), engine);
            
            something(sortingAlgorithm);
        }
        


        override function update(dt:Float) {
            sortingAlgorithm.render();
        }

        public static function something(algo:SortingAlgorithm) {
            #if (target.threaded)
            sys.thread.Thread.create(() -> {
                algo.startSort();
                while(true) {
                    Sys.sleep(10.0);
                }
                });
            #end
        }


        static function main() {
            new Main();
        }
    }