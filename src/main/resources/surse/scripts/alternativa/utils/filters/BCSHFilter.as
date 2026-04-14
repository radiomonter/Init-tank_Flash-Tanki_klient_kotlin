package alternativa.utils.filters
{
   import flash.filters.ColorMatrixFilter;
   import flash.utils.Dictionary;
   
   public class BCSHFilter
   {
      
      private static const DELTA:Number = 0.01;
      
      private static var filters:Dictionary = new Dictionary();
      
      public function BCSHFilter()
      {
         super();
      }
      
      public static function createFilter(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : ColorMatrixFilter
      {
         var _local_6:AdjustColor = null;
         var _local_7:ColorMatrixFilter = null;
         var _local_8:Object = null;
         var _local_5:* = null;
         for(_local_5 in filters)
         {
            if(areEqual(_arg_1,_local_5.b) && areEqual(_arg_2,_local_5.c) && areEqual(_arg_3,_local_5.s) && areEqual(_arg_4,_local_5.h))
            {
               return filters[_local_5];
            }
         }
         _local_6 = new AdjustColor();
         _local_6.brightness = _arg_1;
         _local_6.contrast = _arg_2;
         _local_6.saturation = _arg_3;
         _local_6.hue = _arg_4;
         _local_7 = new ColorMatrixFilter();
         _local_7.matrix = _local_6.CalculateFinalFlatArray();
         _local_8 = {
            "b":_arg_1,
            "c":_arg_2,
            "s":_arg_3,
            "h":_arg_4
         };
         filters[_local_8] = _local_7;
         return _local_7;
      }
      
      private static function areEqual(_arg_1:Number, _arg_2:Number) : Boolean
      {
         return Math.abs(_arg_1 - _arg_2) < DELTA;
      }
   }
}

