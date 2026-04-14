package obfuscation.rofa
{
   import alternativa.math.Vector3;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class Sound3D
   {
      
      private static var pool:Sound3D;
      
      public static const dydejeb:int = 1000000;
      
      private static const vimune:Number = 1000;
      
      private static const vufaqacod:Number = 5000;
      
      private static const hiqelypy:Number = 5;
      
      internal var nextInPool:Sound3D;
      
      private var jugylapy:Number;
      
      private var lyfowakuk:Number;
      
      private var sound:Sound;
      
      private var sufyryd:SoundChannel;
      
      private var transform:SoundTransform = new SoundTransform(0);
      
      private var vufyq:Number = 1;
      
      private var vij:Number = 1;
      
      private var gywoh:Number = 1;
      
      public function Sound3D(_arg_1:Sound, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number)
      {
         super();
         this.init(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      public static function create(_arg_1:Sound, _arg_2:Number = 1, _arg_3:Number = 1000, _arg_4:Number = 5000, _arg_5:Number = 5) : Sound3D
      {
         var _local_6:Sound3D = null;
         if(pool == null)
         {
            return new Sound3D(_arg_1,_arg_3,_arg_4,_arg_5,_arg_2);
         }
         _local_6 = pool;
         _local_6.init(_arg_1,_arg_3,_arg_4,_arg_5,_arg_2);
         pool = _local_6.nextInPool;
         _local_6.nextInPool = null;
         return _local_6;
      }
      
      public static function destroy(_arg_1:Sound3D) : void
      {
         _arg_1.clear();
         if(pool == null)
         {
            pool = _arg_1;
         }
         else
         {
            _arg_1.nextInPool = pool;
            pool = _arg_1;
         }
      }
      
      public function rehyv() : Boolean
      {
         return this.sufyryd != null;
      }
      
      public function get channel() : SoundChannel
      {
         return this.sufyryd;
      }
      
      public function get position() : Number
      {
         return this.sufyryd == null ? Number(0) : Number(this.sufyryd.position);
      }
      
      public function init(_arg_1:Sound, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
         this.sound = _arg_1;
         this.jugylapy = _arg_2;
         this.vij = _arg_5;
         this.lyfowakuk = (Math.sqrt(_arg_4) - 1) / (_arg_3 - _arg_2);
         this.volume = 1;
      }
      
      public function clear() : void
      {
         this.stop();
         this.sound = null;
      }
      
      public function get ruqutele() : Number
      {
         return this.vij;
      }
      
      public function set ruqutele(_arg_1:Number) : void
      {
         this.vij = _arg_1;
         this.galyrawu();
      }
      
      public function get volume() : Number
      {
         return this.vufyq;
      }
      
      public function set volume(_arg_1:Number) : void
      {
         this.vufyq = _arg_1;
         this.galyrawu();
      }
      
      public function rycogufyq(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:SoundTransform) : void
      {
         var _local_5:Number = NaN;
         var _local_6:Number = _arg_2.x - _arg_1.x;
         var _local_7:Number = _arg_2.y - _arg_1.y;
         var _local_8:Number = _arg_2.z - _arg_1.z;
         var _local_9:Number = Math.sqrt(_local_6 * _local_6 + _local_7 * _local_7 + _local_8 * _local_8);
         if(_local_9 < this.jugylapy)
         {
            _arg_4.volume = 1;
            _arg_4.pan = 0;
         }
         else
         {
            _local_5 = 1 + this.lyfowakuk * (_local_9 - this.jugylapy);
            _local_5 = 1 / (_local_5 * _local_5);
            _arg_4.volume = _local_5;
            _local_9 = 1 / _local_9;
            _local_6 *= _local_9;
            _local_7 *= _local_9;
            _local_8 *= _local_9;
            _arg_4.pan = (_local_6 * _arg_3.x + _local_7 * _arg_3.y + _local_8 * _arg_3.z) * (1 - _local_5);
         }
      }
      
      public function guma(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         if(this.sufyryd != null)
         {
            this.rycogufyq(_arg_1,_arg_2,_arg_3,this.transform);
            this.transform.volume *= this.gywoh;
            this.sufyryd.soundTransform = this.transform;
         }
      }
      
      public function play(_arg_1:int, _arg_2:int) : SoundChannel
      {
         if(this.sufyryd != null)
         {
            this.sufyryd.stop();
         }
         return this.sufyryd = this.sound.play(_arg_1,_arg_2);
      }
      
      public function stop() : void
      {
         if(this.sufyryd != null)
         {
            this.sufyryd.stop();
            this.sufyryd = null;
         }
      }
      
      private function galyrawu() : void
      {
         this.gywoh = this.vij * this.vufyq;
      }
   }
}

