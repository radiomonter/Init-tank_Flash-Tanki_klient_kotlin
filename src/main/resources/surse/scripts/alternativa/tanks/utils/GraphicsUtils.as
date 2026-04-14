package alternativa.tanks.utils
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.Bizotevuf;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class GraphicsUtils
   {
      
      private static var filteredImages:Dictionary = new Dictionary(true);
      
      public function GraphicsUtils()
      {
         super();
      }
      
      public static function getTextureAnimationFromResource(_arg_1:TextureMaterialRegistry, _arg_2:MultiframeImageResource) : TextureAnimation
      {
         var _local_3:TextureAnimation = getTextureAnimation(_arg_1,_arg_2.data,_arg_2.frameWidth,_arg_2.frameHeight,_arg_2.numFrames);
         _local_3.fps = _arg_2.fps;
         return _local_3;
      }
      
      public static function getFilteredTextureAnimationFromResource(_arg_1:TextureMaterialRegistry, _arg_2:MultiframeImageResource, _arg_3:BitmapFilter) : TextureAnimation
      {
         var _local_4:BitmapData = createFilteredImage(_arg_2.data,_arg_3);
         var _local_5:TextureAnimation = getTextureAnimation(_arg_1,_local_4,_arg_2.frameWidth,_arg_2.frameHeight,_arg_2.numFrames);
         _local_5.fps = _arg_2.fps;
         return _local_5;
      }
      
      public static function createFilteredImage(_arg_1:BitmapData, _arg_2:BitmapFilter) : BitmapData
      {
         var _local_4:BitmapData = null;
         var _local_5:Object = null;
         var _local_3:* = undefined;
         for(_local_3 in filteredImages)
         {
            _local_5 = filteredImages[_local_3];
            if(_local_5.s == _arg_1 && _local_5.f == _arg_2)
            {
               return _local_3;
            }
         }
         _local_4 = _arg_1.clone();
         _local_4.applyFilter(_arg_1,_arg_1.rect,new Point(),_arg_2);
         filteredImages[_local_4] = {
            "s":_arg_1,
            "f":_arg_2
         };
         return _local_4;
      }
      
      public static function setObjectTransform(_arg_1:Object3D, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         _arg_1.x = _arg_2.x;
         _arg_1.y = _arg_2.y;
         _arg_1.z = _arg_2.z;
         _arg_1.rotationX = _arg_3.x;
         _arg_1.rotationY = _arg_3.y;
         _arg_1.rotationZ = _arg_3.z;
      }
      
      public static function getTextureAnimation(_arg_1:TextureMaterialRegistry, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:int = 0, _arg_6:Boolean = true) : TextureAnimation
      {
         var _local_7:TextureMaterial = _arg_1.getMaterial(_arg_2,_arg_6);
         var _local_8:Vector.<Bizotevuf> = getUVFramesFromTexture(_arg_2,_arg_3,_arg_4,_arg_5);
         return new TextureAnimation(_local_7,_local_8);
      }
      
      public static function getSquareUVFramesFromTexture(_arg_1:BitmapData, _arg_2:int = 0) : Vector.<Bizotevuf>
      {
         var _local_3:int = _arg_1.height;
         return getUVFramesFromTexture(_arg_1,_local_3,_local_3,_arg_2);
      }
      
      public static function getUVFramesFromTexture(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int = 0) : Vector.<Bizotevuf>
      {
         var _local_20:* = undefined;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_7:int = 0;
         var _local_8:int = 0;
         var _local_9:int = 0;
         var _local_18:int = 0;
         var _local_19:int = 0;
         var _local_10:int = _arg_1.width;
         var _local_11:int = Math.min(_arg_2,_local_10);
         var _local_12:int = int(_local_10 / _local_11);
         var _local_13:int = _arg_1.height;
         var _local_14:int = Math.min(_arg_3,_local_13);
         var _local_15:int = int(_local_13 / _local_14);
         var _local_16:int = _local_12 * _local_15;
         if(_arg_4 > 0 && _local_16 > _arg_4)
         {
            _local_16 = _arg_4;
         }
         var _local_17:Vector.<Bizotevuf> = new Vector.<Bizotevuf>(_local_16);
         while(_local_19 < _local_15)
         {
            _local_5 = _local_19 * _local_14;
            _local_6 = _local_5 + _local_14;
            _local_7 = 0;
            while(_local_7 < _local_12)
            {
               _local_8 = _local_7 * _local_11;
               _local_9 = _local_8 + _local_11;
               _local_20 = _local_18++;
               _local_17[_local_20] = new Bizotevuf(_local_8 / _local_10,_local_5 / _local_13,_local_9 / _local_10,_local_6 / _local_13);
               if(_local_18 == _local_16)
               {
                  return _local_17;
               }
               _local_7++;
            }
            _local_19++;
         }
         return _local_17;
      }
   }
}

