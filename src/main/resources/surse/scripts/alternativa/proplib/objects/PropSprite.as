package alternativa.proplib.objects
{
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class PropSprite extends PropObject
   {
      
      public var textureData:TextureByteData;
      
      public var scale:Number;
      
      public function PropSprite(_arg_1:TextureByteData, _arg_2:Number = 0.5, _arg_3:Number = 0.5, _arg_4:Number = 1)
      {
         super(PropObjectType.SPRITE);
         this.textureData = _arg_1;
         this.scale = _arg_4;
         var _local_5:Sprite3D = new Sprite3D(1,1);
         _local_5.originX = _arg_2;
         _local_5.originY = _arg_3;
         object = _local_5;
      }
      
      override public function traceProp() : void
      {
         super.traceProp();
      }
      
      public function remove() : *
      {
         var _local_1:Sprite3D = object as Sprite3D;
         _local_1 = null;
      }
   }
}

