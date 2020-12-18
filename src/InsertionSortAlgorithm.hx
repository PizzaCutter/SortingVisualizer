class InsertionSortAlgorithm extends SortingAlgorithm {
	public override function startSort() {
		for (i in 1...(arrayToSort.length)) {
            var key = arrayToSort[i];
            var j : Int = i - 1;

            while (j >= 0 && arrayToSort[j] > key) {
                arrayToSort[j + 1] = arrayToSort[j];
                j = j - 1;

                Sys.sleep(sortingSpeedInSeconds);
            }
            arrayToSort[j + 1] = key;
        }
	}
}
