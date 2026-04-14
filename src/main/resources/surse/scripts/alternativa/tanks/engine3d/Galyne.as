package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   public class Galyne
   {
      
      public var tylyv:Object;
      
      public var texture:BitmapData;
      
      public var material:TextureMaterial;
      
      public var funu:int;
      
      public function Galyne(_arg_1:Object, _arg_2:TextureMaterial)
      {
         super();
         this.tylyv = _arg_1;
         this.texture = _arg_1 as BitmapData;
         this.material = _arg_2;
      }
   }
}

