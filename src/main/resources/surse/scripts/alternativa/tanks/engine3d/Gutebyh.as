package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   public class Gutebyh implements Byp
   {
      
      public function Gutebyh()
      {
         super();
      }
      
      public function midicifa(_arg_1:BitmapData, _arg_2:Boolean) : TextureMaterial
      {
         return new TextureMaterial(_arg_1,false,true,!_arg_2 ? int(0) : int(MipMapping.PER_PIXEL));
      }
   }
}

