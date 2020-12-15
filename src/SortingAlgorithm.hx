
class SortingAlgorithm {
    // STATIC DATA
    var itemCount : Int = 100;
    var sortingSpeedInSeconds : Float = 0.01;

    // RUNTIME DATA
    var arrayToSort : Array<Int> = new Array<Int>();

    // RENDERING DATA
    var graphics : h2d.Graphics;
    var engine : h3d.Engine;

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

    public function startSort() {

    }

    public function render() {
        graphics.clear();

        for (i in 0...itemCount) {
            graphics.beginFill(0xFFFFFF, 1);
            graphics.lineStyle(1, 0x000000);
            graphics.drawRect(getXPositionForIndex(i), getYPositionForIndex(i), getWidth(), getHeightForIndex(i));
            graphics.endFill();
        }
    }
}