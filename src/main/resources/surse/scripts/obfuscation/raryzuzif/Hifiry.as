package obfuscation.raryzuzif
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.display.BitmapData;
   
   public class Hifiry implements Kedetino
   {
      
      private var joneqedep:PropSprite;
      
      private var bemu:Vector.<Sprite3D> = new Vector.<Sprite3D>();
      
      public function Hifiry(_arg_1:PropSprite, _arg_2:String)
      {
         super();
         this.joneqedep = _arg_1;
      }
      
      public function mynu(_arg_1:Sprite3D) : void
      {
         this.bemu.push(_arg_1);
      }
      
      public function nobozin(_arg_1:TextureMaterial) : void
      {
         var _local_2:Sprite3D = null;
         var _local_4:BitmapData = null;
         var _local_3:Number = NaN;
         _local_4 = _arg_1.texture;
         for each(_local_2 in this.bemu)
         {
            _local_2.material = _arg_1;
            _local_3 = _local_2.width;
            _local_2.width = _local_3 * _local_4.width;
            _local_2.height = _local_3 * _local_4.height;
         }
      }
      
      public function renezyleh() : TextureByteData
      {
         return this.joneqedep.textureData;
      }
   }
}

