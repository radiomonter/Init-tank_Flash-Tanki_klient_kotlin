package alternativa.tanks.services.colortransform
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Color;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import obfuscation.kisagehy.Holij;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Bajoryta
   {
      
      public function Bajoryta()
      {
         super();
      }
      
      public static function sulusocuc(_arg_1:BitmapData, _arg_2:ColorTransform) : BitmapData
      {
         var _local_3:BitmapData = _arg_1.clone();
         _local_3.colorTransform(_local_3.rect,_arg_2);
         return _local_3;
      }
      
      public static function diba(_arg_1:ColorTransform, _arg_2:ColorTransform) : Boolean
      {
         if(_arg_1 == _arg_2)
         {
            return true;
         }
         if(_arg_1 == null || _arg_2 == null)
         {
            return false;
         }
         return _arg_1.redMultiplier == _arg_2.redMultiplier && _arg_1.greenMultiplier == _arg_2.greenMultiplier && _arg_1.blueMultiplier == _arg_2.blueMultiplier && _arg_1.alphaMultiplier == _arg_2.alphaMultiplier && _arg_1.redOffset == _arg_2.redOffset && _arg_1.greenOffset == _arg_2.greenOffset && _arg_1.blueOffset == _arg_2.blueOffset && _arg_1.alphaOffset == _arg_2.alphaOffset;
      }
      
      public static function clone(_arg_1:ColorTransform) : ColorTransform
      {
         if(_arg_1 == null)
         {
            return null;
         }
         return new ColorTransform(_arg_1.redMultiplier,_arg_1.greenMultiplier,_arg_1.blueMultiplier,_arg_1.alphaMultiplier,_arg_1.redOffset,_arg_1.greenOffset,_arg_1.blueOffset,_arg_1.alphaOffset);
      }
      
      public static function toString(_arg_1:ColorTransform) : String
      {
         if(_arg_1 == null)
         {
            return "null";
         }
         return _arg_1.toString();
      }
      
      public static function jozegofag(_arg_1:Holij, _arg_2:Number) : ColorTransform
      {
         var _local_3:Color = null;
         var _local_4:Color = null;
         var _local_5:Matrix3 = null;
         var _local_6:Vector3 = null;
         var _local_14:ColorTransform = null;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         var _local_11:Number = NaN;
         var _local_12:Number = NaN;
         var _local_13:Number = NaN;
         if(!GPUCapabilities.gpuEnabled || GPUCapabilities.constrained)
         {
            _local_3 = new Color(_arg_1.lightColor);
            _local_4 = new Color(_arg_1.shadowColor);
            _local_3.subtract(_local_4);
            _local_5 = new Matrix3();
            _local_5.setRotationMatrix(_arg_1.angleX,0,_arg_1.angleZ);
            _local_6 = new Vector3(0,1,0);
            _local_6.transform3(_local_5);
            _local_6.normalize();
            _local_7 = Math.abs(_local_6.z) * _arg_2;
            _local_8 = (_local_4.quruqa() >> 16 & 0xFF) / 255;
            _local_9 = (_local_4.quruqa() >> 8 & 0xFF) / 255;
            _local_10 = (_local_4.quruqa() & 0xFF) / 255;
            _local_11 = (_local_3.quruqa() >> 16 & 0xFF) / 255;
            _local_12 = (_local_3.quruqa() >> 8 & 0xFF) / 255;
            _local_13 = (_local_3.quruqa() & 0xFF) / 255;
            _local_14 = new ColorTransform();
            _local_14.redMultiplier = 2 * (_local_8 + _local_11 * _local_7);
            _local_14.greenMultiplier = 2 * (_local_9 + _local_12 * _local_7);
            _local_14.blueMultiplier = 2 * (_local_10 + _local_13 * _local_7);
            return _local_14;
         }
         return null;
      }
   }
}

