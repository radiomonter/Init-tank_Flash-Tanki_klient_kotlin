package obfuscation.lozewaby
{
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   import obfuscation.rofa.ISound3DEffect;
   
   public class Kukokiboz implements Guh
   {
      
      private static const gocyzora:int = 10;
      
      private static const dypoju:int = 21;
      
      private static const _position:Vector3 = new Vector3();
      
      private var effects:Vector.<Zaleco> = new Vector.<Zaleco>();
      
      private var rahihu:int;
      
      private var rero:Dictionary = new Dictionary();
      
      private var bag:int;
      
      private var mowag:Boolean;
      
      public function Kukokiboz()
      {
         super();
      }
      
      public static function putev(_arg_1:Sound) : Guh
      {
         var _local_2:SoundChannel = _arg_1.play(0,1,new SoundTransform(0));
         if(_local_2 != null)
         {
            _local_2.stop();
            return new Kukokiboz();
         }
         return new Tegyb();
      }
      
      public function hud(_arg_1:Boolean) : void
      {
         this.mowag = _arg_1;
      }
      
      public function nekile(_arg_1:Sound, _arg_2:int = 0, _arg_3:int = 0, _arg_4:SoundTransform = null) : SoundChannel
      {
         var _local_5:SoundChannel = null;
         if(this.pupyz(_arg_1))
         {
            _local_5 = _arg_1.play(_arg_2,_arg_3,_arg_4);
            if(_local_5 != null)
            {
               this.deziw(_local_5);
            }
            return _local_5;
         }
         return null;
      }
      
      private function pupyz(_arg_1:Sound) : Boolean
      {
         return !this.mowag && this.bag < gocyzora && _arg_1 != null;
      }
      
      public function luqire(_arg_1:SoundChannel) : void
      {
         if(_arg_1 != null && this.rero[_arg_1] != null)
         {
            this.patikif(_arg_1);
         }
      }
      
      public function lofeqofeh() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.rero)
         {
            this.patikif(_local_1 as SoundChannel);
         }
      }
      
      public function vakydiqip(_arg_1:ISound3DEffect) : void
      {
         if(this.wekeka(_arg_1))
         {
            _arg_1.enabled = true;
            this.effects.push(Zaleco.create(0,_arg_1));
            ++this.rahihu;
         }
      }
      
      private function wekeka(_arg_1:ISound3DEffect) : Boolean
      {
         return !this.mowag && _arg_1 != null && this.fyb(_arg_1) < 0;
      }
      
      public function zolycoz(_arg_1:ISound3DEffect) : void
      {
         var _local_2:Zaleco = null;
         var _local_3:int = 0;
         while(_local_3 < this.rahihu)
         {
            _local_2 = this.effects[_local_3];
            if(_local_2.pyjuj == _arg_1)
            {
               _arg_1.destroy();
               Zaleco.destroy(_local_2);
               this.effects.splice(_local_3,1);
               --this.rahihu;
               return;
            }
            _local_3++;
         }
      }
      
      public function sud() : void
      {
         var _local_1:Zaleco = null;
         while(this.effects.length > 0)
         {
            _local_1 = this.effects.pop();
            _local_1.pyjuj.destroy();
            Zaleco.destroy(_local_1);
         }
         this.rahihu = 0;
      }
      
      public function resuru(_arg_1:int, _arg_2:GameCamera) : void
      {
         var _local_3:int = 0;
         if(this.rahihu > 0)
         {
            this.mocytyfal(_arg_2.position);
            _local_3 = this.netisa(_arg_1,_arg_2);
            this.quzovyw(_local_3);
         }
      }
      
      private function netisa(_arg_1:int, _arg_2:GameCamera) : int
      {
         var _local_3:Zaleco = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:int = 0;
         _local_4 = 0;
         while(_local_4 < this.rahihu)
         {
            _local_3 = this.effects[_local_4];
            _local_5 = _local_3.pyjuj.bag;
            if(_local_5 == 0)
            {
               _local_3.pyjuj.destroy();
               Zaleco.destroy(_local_3);
               this.effects.splice(_local_4,1);
               --this.rahihu;
               _local_4--;
            }
            else if(_local_6 + _local_5 > dypoju)
            {
               if(_local_6 == dypoju)
               {
                  break;
               }
               _local_3.pyjuj.enabled = false;
            }
            else
            {
               _local_3.pyjuj.enabled = true;
               _local_3.pyjuj.play(_arg_1,_arg_2);
               _local_6 += _local_5;
            }
            _local_4++;
         }
         return _local_4;
      }
      
      private function quzovyw(_arg_1:int) : void
      {
         var _local_2:Zaleco = null;
         var _local_3:int = _arg_1;
         while(_local_3 < this.rahihu)
         {
            _local_2 = this.effects[_local_3];
            _local_2.pyjuj.enabled = false;
            if(_local_2.pyjuj.bag == 0)
            {
               _local_2.pyjuj.destroy();
               Zaleco.destroy(_local_2);
               this.effects.splice(_local_3,1);
               --this.rahihu;
               _local_3--;
            }
            _local_3++;
         }
      }
      
      private function deziw(_arg_1:SoundChannel) : void
      {
         _arg_1.addEventListener(Event.SOUND_COMPLETE,this.kykoqoz);
         this.rero[_arg_1] = true;
         ++this.bag;
      }
      
      private function patikif(_arg_1:SoundChannel) : void
      {
         _arg_1.stop();
         _arg_1.removeEventListener(Event.SOUND_COMPLETE,this.kykoqoz);
         delete this.rero[_arg_1];
         --this.bag;
      }
      
      private function kykoqoz(_arg_1:Event) : void
      {
         this.luqire(_arg_1.target as SoundChannel);
      }
      
      private function fyb(_arg_1:ISound3DEffect) : int
      {
         var _local_2:Zaleco = null;
         var _local_3:int = 0;
         while(_local_3 < this.rahihu)
         {
            _local_2 = this.effects[_local_3];
            if(_local_2.pyjuj == _arg_1)
            {
               return _local_3;
            }
            _local_3++;
         }
         return -1;
      }
      
      private function mocytyfal(sydi:Vector3) : void
      {
         var qydicubek:Vector3 = sydi;
         this.recuv(qydicubek);
         this.effects.sort(function(_arg_1:Zaleco, _arg_2:Zaleco):Number
         {
            return _arg_1.lurinoc - _arg_2.lurinoc;
         });
      }
      
      private function recuv(_arg_1:Vector3) : void
      {
         var _local_2:Zaleco = null;
         var _local_6:int = 0;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         while(_local_6 < this.rahihu)
         {
            _local_2 = this.effects[_local_6];
            _local_2.pyjuj.readPosition(_position);
            _local_3 = _arg_1.x - _position.x;
            _local_4 = _arg_1.y - _position.y;
            _local_5 = _arg_1.z - _position.z;
            _local_2.lurinoc = _local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5;
            _local_6++;
         }
      }
   }
}

