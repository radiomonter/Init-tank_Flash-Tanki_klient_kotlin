package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureMaterial;
   
   public class TextureAnimation
   {
      
      public var material:TextureMaterial;
      
      public var sakito:Vector.<Bizotevuf>;
      
      public var fps:Number;
      
      public function TextureAnimation(_arg_1:TextureMaterial, _arg_2:Vector.<Bizotevuf>, _arg_3:Number = 0)
      {
         super();
         this.material = _arg_1;
         this.sakito = _arg_2;
         this.fps = _arg_3;
      }
   }
}

