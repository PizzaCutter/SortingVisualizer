
class QuickSortAlgorithm extends SortingAlgorithm {

    public override function startSort() {
        quicksort(0, arrayToSort.length - 1);
    }

    private function partition(low:Int, high:Int) : Int {
        var pivot : Int = arrayToSort[high];
        var i : Int = (low - 1);

        for (j in low...(high - 1)) {
            if (arrayToSort[j] <= pivot) {
                i++;
                var tempValue = arrayToSort[j];
                arrayToSort[j] = arrayToSort[i];
                arrayToSort[i] = tempValue;

                Sys.sleep(sortingSpeedInSeconds);
            }
        }

        var tempValue = arrayToSort[i+1];
        arrayToSort[i+1] = arrayToSort[high];
        arrayToSort[high] = tempValue;

        Sys.sleep(sortingSpeedInSeconds);

        return (i + 1);
    }

    private function quicksort(lo:Int, hi:Int) {
        var i = lo;
        var j = hi;
        var buf = arrayToSort;
        var p = buf[(lo+hi)>>1];
        while( i <= j ) {
            while( arrayToSort[i] > p ) { 
                i++;
            }
            while( arrayToSort[j] < p ) {
                j--;
            }
            if( i <= j ) {
                var t = buf[i];
                buf[i++] = buf[j];
                buf[j--] = t;

                Sys.sleep(sortingSpeedInSeconds);
            }
        }
        if( lo < j ) quicksort( lo, j );
        if( i < hi ) quicksort( i, hi );
    }
}