package alternativa.tanks.gui.components.flag
{
   import controls.dropdownlist.ComboBoxRenderer;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class FlagsRenderer extends ComboBoxRenderer
   {
      
      public function FlagsRenderer()
      {
         super();
      }
      
      override protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_2:Sprite = new Sprite();
         var _local_3:Bitmap = Flag.getFlag(_arg_1.country);
         _local_2.addChild(_local_3);
         return _local_2;
      }
   }
}

