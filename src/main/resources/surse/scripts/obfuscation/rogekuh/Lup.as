package obfuscation.rogekuh
{
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.DropShadowFilter;
   import flash.geom.ColorTransform;
   import obfuscation.tihah.Hyn;
   
   public class Lup extends Nadapy
   {
      
      public function Lup(_arg_1:int, _arg_2:int, _arg_3:Hyn, _arg_4:Boolean)
      {
         super(_arg_1,_arg_2,_arg_3,_arg_4);
         label.color = 16742220;
         icon.transform.colorTransform = new ColorTransform(0,0,0,1,255,119,76);
         filters = [this.syji()];
      }
      
      private function syji() : BitmapFilter
      {
         var _local_8:Boolean = false;
         var _local_9:Boolean = false;
         var _local_1:Number = 0;
         var _local_2:Number = 45;
         var _local_3:Number = 1;
         var _local_4:Number = 1;
         var _local_5:Number = 1;
         var _local_6:Number = 1;
         var _local_7:Number = 0.65;
         var _local_10:Number = BitmapFilterQuality.HIGH;
         return new DropShadowFilter(_local_6,_local_2,_local_1,_local_3,_local_4,_local_5,_local_7,_local_10,_local_8,_local_9);
      }
   }
}

