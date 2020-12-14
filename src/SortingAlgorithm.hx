
class SortingAlgorithm {
    // STATIC DATA
    var itemCount : Int = 100;
    var sortingSpeedInSeconds : Float = 0.01;

    // RUNTIME DATA
    var arrayToSort : Array<Int> = new Array<Int>();

    var timer : Float = 0.0;

    // RENDERING DATA
    var graphics : h2d.Graphics;
    var engine : h3d.Engine;

    public var hasStartedSorting : Bool = false;
    var isDoneSorting : Bool = false;

    public function new(inGraphics:h2d.Graphics, inEngine:h3d.Engine) {
        graphics = inGraphics;
        engine = inEngine;

        generateArray();
    }

    public function generateArray() {
        // GENERATE ARRAY
        var randomArray = new Array<Int>();
        for (i in 1...itemCount + 1) {
            randomArray.push(i);
        } 

        // SHUFFLE ARRAY
        arrayToSort = shuffleArray(randomArray);

        isDoneSorting = false;
    }

    public function shuffleArray(arrayToShuffle:Array<Int>) : Array<Int> {
        var currentIndex = arrayToShuffle.length;
        var temporaryValue : Int;
        var randomIndex : Int;

        while (0 != currentIndex) {
            randomIndex = Std.random(currentIndex);
            currentIndex -= 1;
            temporaryValue = arrayToShuffle[currentIndex];
            arrayToShuffle[currentIndex] = arrayToShuffle[randomIndex];
            arrayToShuffle[randomIndex] = temporaryValue;
        }

        return arrayToShuffle;
    }

    private function getXPositionForIndex(index:Int) : Int {
        return index * getWidth();
    }
    private function getYPositionForIndex(index:Int) : Int {
        return engine.height - getHeightForIndex(index);
    }
    private function getWidth() : Int {

        var width = hxd.Window.getInstance().width;
        return Math.round(width / itemCount);
    }
    private function getHeightForIndex(index:Int) : Int {
        return Math.round(arrayToSort[index] * (engine.height / itemCount));
    }

    public function render() {
        for (i in 0...itemCount) {
            graphics.beginFill(0xFFFFFF, 1);
            graphics.lineStyle(1, 0x000000);
            graphics.drawRect(getXPositionForIndex(i), getYPositionForIndex(i), getWidth(), getHeightForIndex(i));
            graphics.endFill();
        }
    }

    public function update(dt:Float) {
        if(hasStartedSorting == false && isDoneSorting == false) {
            timer += dt;

            if(timer>=sortingSpeedInSeconds) {
                timer -= sortingSpeedInSeconds;
                sortIteration();
            }
        }

        graphics.clear();
        render();

        Sys.sleep(0.1);
    }

    private function sortIteration() {
    }
}