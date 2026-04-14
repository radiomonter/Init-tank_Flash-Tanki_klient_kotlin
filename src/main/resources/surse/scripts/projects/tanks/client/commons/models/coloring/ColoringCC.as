package projects.tanks.client.commons.models.coloring
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class ColoringCC
   {
      
      private var _animatedColoring:MultiframeImageResource;
      
      private var _coloring:ImageResource;
      
      public function ColoringCC(_arg_1:MultiframeImageResource = null, _arg_2:ImageResource = null)
      {
         super();
         this._animatedColoring = _arg_1;
         this._coloring = _arg_2;
      }
      
      public function get animatedColoring() : MultiframeImageResource
      {
         return this._animatedColoring;
      }
      
      public function set animatedColoring(_arg_1:MultiframeImageResource) : void
      {
         this._animatedColoring = _arg_1;
      }
      
      public function get coloring() : ImageResource
      {
         return this._coloring;
      }
      
      public function set coloring(_arg_1:ImageResource) : void
      {
         this._coloring = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ColoringCC [";
         _local_1 += "animatedColoring = " + this.animatedColoring + " ";
         _local_1 += "coloring = " + this.coloring + " ";
         return _local_1 + "]";
      }
   }
}

