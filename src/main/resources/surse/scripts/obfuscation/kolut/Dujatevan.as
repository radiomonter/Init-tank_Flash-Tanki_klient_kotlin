package obfuscation.kolut
{
   import flash.display.Bitmap;
   
   public class Dujatevan extends Qohec implements Qohiqov
   {
      
      private static const duvolawu:int = 21;
      
      private static const tuhevume:int = 9;
      
      private static const nyhu:Class = Qanetana;
      
      private var icon:Bitmap = new Bitmap(new nyhu().bitmapData);
      
      public function Dujatevan()
      {
         super();
         addChild(this.icon);
         this.icon.y = tuhevume;
      }
      
      override protected function calculateWidth() : int
      {
         var _local_1:int = 5;
         var _local_2:int = labelRed.width > wubiba.width ? int(labelRed.width) : int(wubiba.width);
         labelRed.x = _local_1 + _local_1 + (_local_2 - labelRed.width >> 1);
         this.icon.x = labelRed.x + _local_2 + _local_1;
         wubiba.x = this.icon.x + duvolawu + _local_1 + (_local_2 - wubiba.width >> 1);
         return wubiba.x + _local_2 + _local_1 + _local_1;
      }
   }
}

