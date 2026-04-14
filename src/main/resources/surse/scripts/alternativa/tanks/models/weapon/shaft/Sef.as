package alternativa.tanks.models.weapon.shaft
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Sef extends Sprite
   {
      
      private static var nocusepo:Dictionary = new Dictionary();
      
      private var dyla:Bitmap;
      
      public function Sef(_arg_1:ImageResource)
      {
         super();
         this.cebomus(_arg_1);
         addChild(this.dyla);
      }
      
      public function get cymule() : Bitmap
      {
         return this.dyla;
      }
      
      private function cebomus(_arg_1:ImageResource) : void
      {
         var _local_2:BitmapData = _arg_1.data;
         this.dyla = new Bitmap(_local_2);
      }
   }
}

