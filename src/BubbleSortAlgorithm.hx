
class BubbleSortAlgorithm extends SortingAlgorithm {

    var i : Int = 0;
    var j : Int = 0;

    public override function render() {
        super.render();

        if(isDoneSorting) {
            return;
        }

        graphics.beginFill(0xFFFF00, 1);
        graphics.lineStyle(1, 0x000000);        
        graphics.drawRect(getXPositionForIndex(i), getYPositionForIndex(i), getWidth(), getHeightForIndex(i));
        graphics.endFill();

        graphics.beginFill(0xFF0000, 1);
        graphics.lineStyle(1, 0x000000);        
        graphics.drawRect(getXPositionForIndex(j), getYPositionForIndex(j), getWidth(), getHeightForIndex(j));
        graphics.endFill();
    }

    public override function sortIteration() {
        if(j < itemCount - i - 1) {
            if(arrayToSort[j] > arrayToSort[j + 1]) {
                var tempValue  = arrayToSort[j];
                arrayToSort[j] = arrayToSort[j + 1];
                arrayToSort[j + 1] = tempValue;
            }
            j++;
        } else {
            j = 0;
            if(i < itemCount) {
                i++;
            }else {
                isDoneSorting = true;
            }
        }
    }
}