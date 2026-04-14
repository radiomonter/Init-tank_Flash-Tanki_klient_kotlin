package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import flash.geom.ColorTransform;
   import obfuscation.fudic.Hyfo;
   
   public class Zowyrazoq extends AnimatedSprite3D
   {
      
      private static var kojymon:int = 20;
      
      private static var pool:Vector.<Zowyrazoq> = new Vector.<Zowyrazoq>(kojymon);
      
      private static var vazaficac:int = -1;
      
      public var velocity:Vector3 = new Vector3();
      
      public var mecuhyje:Number = 0;
      
      public var tepe:Number;
      
      public var gerydero:int;
      
      public function Zowyrazoq()
      {
         super(100,100);
         softAttenuation = 130;
         colorTransform = new ColorTransform();
      }
      
      public static function wobagemyq() : Zowyrazoq
      {
         if(vazaficac == -1)
         {
            return new Zowyrazoq();
         }
         var _local_1:Zowyrazoq = pool[vazaficac];
         var _local_2:* = vazaficac--;
         pool[_local_2] = null;
         _local_1.reset();
         return _local_1;
      }
      
      private static function ryryhasow(_arg_1:Hyfo, _arg_2:Hyfo, _arg_3:Number, _arg_4:ColorTransform) : void
      {
         _arg_4.alphaMultiplier = _arg_1.alphaMultiplier + _arg_3 * (_arg_2.alphaMultiplier - _arg_1.alphaMultiplier);
         _arg_4.alphaOffset = _arg_1.alphaOffset + _arg_3 * (_arg_2.alphaOffset - _arg_1.alphaOffset);
         _arg_4.redMultiplier = _arg_1.redMultiplier + _arg_3 * (_arg_2.redMultiplier - _arg_1.redMultiplier);
         _arg_4.redOffset = _arg_1.redOffset + _arg_3 * (_arg_2.redOffset - _arg_1.redOffset);
         _arg_4.greenMultiplier = _arg_1.greenMultiplier + _arg_3 * (_arg_2.greenMultiplier - _arg_1.greenMultiplier);
         _arg_4.greenOffset = _arg_1.greenOffset + _arg_3 * (_arg_2.greenOffset - _arg_1.greenOffset);
         _arg_4.blueMultiplier = _arg_1.blueMultiplier + _arg_3 * (_arg_2.blueMultiplier - _arg_1.blueMultiplier);
         _arg_4.blueOffset = _arg_1.blueOffset + _arg_3 * (_arg_2.blueOffset - _arg_1.blueOffset);
      }
      
      private static function nonepedym(_arg_1:Hyfo, _arg_2:ColorTransform) : void
      {
         _arg_2.alphaMultiplier = _arg_1.alphaMultiplier;
         _arg_2.alphaOffset = _arg_1.alphaOffset;
         _arg_2.redMultiplier = _arg_1.redMultiplier;
         _arg_2.redOffset = _arg_1.redOffset;
         _arg_2.greenMultiplier = _arg_1.greenMultiplier;
         _arg_2.greenOffset = _arg_1.greenOffset;
         _arg_2.blueMultiplier = _arg_1.blueMultiplier;
         _arg_2.blueOffset = _arg_1.blueOffset;
      }
      
      public function reset() : void
      {
         var _local_1:ColorTransform = colorTransform;
         _local_1.redMultiplier = 1;
         _local_1.greenMultiplier = 1;
         _local_1.blueMultiplier = 1;
         _local_1.alphaMultiplier = 1;
         _local_1.redOffset = 0;
         _local_1.greenOffset = 0;
         _local_1.blueOffset = 0;
         _local_1.alphaOffset = 0;
         alpha = 1;
      }
      
      public function dispose() : void
      {
         clear();
         var _local_1:* = ++vazaficac;
         pool[_local_1] = this;
      }
      
      public function cobiqazev(_arg_1:Number, _arg_2:Vector.<Hyfo>) : void
      {
         var _local_4:Hyfo = null;
         var _local_5:Hyfo = null;
         var _local_6:int = 0;
         var _local_3:Number = NaN;
         if(_arg_2 != null)
         {
            _local_3 = this.mecuhyje / _arg_1;
            if(_local_3 <= 0)
            {
               _local_4 = _arg_2[0];
               nonepedym(_local_4,colorTransform);
            }
            else if(_local_3 >= 1)
            {
               _local_4 = _arg_2[_arg_2.length - 1];
               nonepedym(_local_4,colorTransform);
            }
            else
            {
               _local_6 = 1;
               _local_4 = _arg_2[0];
               _local_5 = _arg_2[1];
               while(_local_5.t < _local_3)
               {
                  _local_6++;
                  _local_4 = _local_5;
                  _local_5 = _arg_2[_local_6];
               }
               _local_3 = (_local_3 - _local_4.t) / (_local_5.t - _local_4.t);
               ryryhasow(_local_4,_local_5,_local_3,colorTransform);
            }
            alpha = colorTransform.alphaMultiplier;
         }
      }
   }
}

