package alternativa.tanks.model.lootboxes
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.geom.ColorTransform;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxCategory;
   
   public class Present
   {
      
      public var bitmap:Bitmap = new Bitmap();
      
      public var color:ColorTransform = new ColorTransform();
      
      public var delay:Number;
      
      public var name:String;
      
      public function Present(_arg_1:BitmapData, _arg_2:String, _arg_3:LootBoxCategory)
      {
         super();
         this.bitmap.bitmapData = _arg_1;
         this.bitmap.pixelSnapping = PixelSnapping.NEVER;
         this.bitmap.smoothing = true;
         this.name = _arg_2;
         var _local_4:Array = paramsByCategory(_arg_3);
         this.color.redMultiplier = _local_4[0];
         this.color.greenMultiplier = _local_4[1];
         this.color.blueMultiplier = _local_4[2];
         this.delay = _local_4[3];
      }
      
      private static function paramsByCategory(_arg_1:LootBoxCategory) : Array
      {
         if(_arg_1 == LootBoxCategory.COMMON)
         {
            return [0.5,0.5,0.5,0];
         }
         if(_arg_1 == LootBoxCategory.UNCOMMON)
         {
            return [0.3,1,0.3,0];
         }
         if(_arg_1 == LootBoxCategory.RARE)
         {
            return [0,0.8,2,0.5];
         }
         if(_arg_1 == LootBoxCategory.EPIC)
         {
            return [1,0.3,1.5,2];
         }
         if(_arg_1 == LootBoxCategory.LEGENDARY)
         {
            return [2,0.7,0.5,3];
         }
         if(_arg_1 == LootBoxCategory.EXOTIC)
         {
            return [2,0.1,0,4];
         }
         return [0,0,0,0.1];
      }
   }
}

