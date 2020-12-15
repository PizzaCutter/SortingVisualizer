
class BubbleSortAlgorithm extends SortingAlgorithm {

    public override function startSort() {
        for (i in 0...(itemCount -1)) 
        {
            for (j in 0...(itemCount-i-1))
            {
                if(arrayToSort[j] > arrayToSort[j+1]) 
                {
                    var tempValue = arrayToSort[j];
                    arrayToSort[j] = arrayToSort[j + 1];
                    arrayToSort[j + 1] = tempValue;
                    Sys.sleep(sortingSpeedInSeconds);
                }
            }
        }
    }

    public override function render() {
        super.render();
    }
}