package alternativa.tanks.engine3d
{
   import flash.display.BitmapData;
   
   public class Cutal extends Symub implements EffectsMaterialRegistry
   {
      
      public function Cutal()
      {
         super(new Gutebyh());
      }
      
      override protected function getTexture(_arg_1:BitmapData, _arg_2:Boolean) : BitmapData
      {
         return _arg_1;
      }
   }
}

