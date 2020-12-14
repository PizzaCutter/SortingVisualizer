
class QuickSortAlgorithm extends SortingAlgorithm {

    var pivot : Int;
    var low : Int;
    var high : Int;
 
    override function new(inGraphics:h2d.Graphics, inEngine:h3d.Engine) {
        super(inGraphics, inEngine);

        pivot = itemCount - 1;
    }

    public override function render() {
        super.render();

        if(isDoneSorting) {
            return;
        }


    }

    public override function sortIteration() {

    }
}