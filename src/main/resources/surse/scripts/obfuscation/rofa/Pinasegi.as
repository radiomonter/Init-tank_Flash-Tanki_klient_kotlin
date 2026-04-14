package obfuscation.rofa
{
   import alternativa.math.Vector3;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class Pinasegi
   {
      
      public static const wiho:int = 0;
      
      public static const IDLE:int = 1;
      
      public static const numiwi:int = 2;
      
      public static const jirohyvyw:int = 3;
      
      public static const ryvukaba:int = 4;
      
      private static const fotonypip:Number = 0.001;
      
      private static const bumo:int = 80;
      
      private var mode:int = 0;
      
      private var wupu:Sound3D;
      
      private var lafoguc:Sound3D;
      
      private var defomeju:Sound3D;
      
      private var lujeveh:Sound3D;
      
      private var channel:SoundChannel;
      
      private var qygity:Boolean;
      
      private var heza:Number = 1;
      
      public function Pinasegi(_arg_1:Sound, _arg_2:Sound, _arg_3:Sound)
      {
         super();
         var _local_4:Number = 1;
         this.lafoguc = Sound3D.create(_arg_1,2);
         this.defomeju = Sound3D.create(_arg_2,_local_4);
         this.lujeveh = Sound3D.create(_arg_3,_local_4);
         this.wupu = this.lafoguc;
      }
      
      public function update(_arg_1:int, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3) : void
      {
         if(this.mode != wiho)
         {
            if(this.qygity)
            {
               this.wupu.volume -= fotonypip * _arg_1;
               if(this.wupu.volume < this.heza)
               {
                  this.qygity = false;
                  this.stop();
                  this.wupu = this.lafoguc;
                  this.wupu.volume = this.mode == IDLE ? Number(2) : Number(3);
                  this.wupu.play(bumo,10000);
               }
            }
            this.wupu.guma(_arg_2,_arg_3,_arg_4);
         }
      }
      
      public function hebuk() : void
      {
         if(this.mode != wiho)
         {
            this.mode = wiho;
            this.stop();
         }
      }
      
      public function rezotun() : void
      {
         if(this.mode != IDLE)
         {
            if(this.mode == wiho)
            {
               this.wupu = this.lafoguc;
               this.wupu.volume = 1;
               this.wupu.play(bumo,1000);
            }
            else if(this.wupu != this.lafoguc)
            {
               this.qygity = true;
               this.heza = 0.2;
            }
            this.mode = IDLE;
         }
      }
      
      public function qucez() : void
      {
         if(this.mode == numiwi || this.mode == jirohyvyw)
         {
            return;
         }
         this.qygity = false;
         this.mode = numiwi;
         this.wupu.stop();
         this.wupu = this.defomeju;
         this.wupu.volume = 1;
         this.channel = this.wupu.play(0,0);
         if(this.channel != null)
         {
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.zekaku);
         }
      }
      
      public function vafavokan() : void
      {
         if(this.mode != ryvukaba)
         {
            if(this.mode == IDLE)
            {
               if(!this.qygity)
               {
                  this.wupu.volume = 3;
               }
            }
            else
            {
               this.qygity = true;
            }
            this.heza = 0.6;
            this.mode = ryvukaba;
         }
      }
      
      public function stop() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.zekaku);
            this.channel = null;
         }
         this.wupu.stop();
      }
      
      public function destroy() : void
      {
         this.stop();
         Sound3D.destroy(this.lafoguc);
         this.lafoguc = null;
         Sound3D.destroy(this.defomeju);
         this.defomeju = null;
         Sound3D.destroy(this.lujeveh);
         this.lujeveh = null;
      }
      
      private function zekaku(_arg_1:Event) : void
      {
         if(this.channel == null || this.mode != numiwi)
         {
            return;
         }
         this.channel.removeEventListener(Event.SOUND_COMPLETE,this.zekaku);
         this.mode = jirohyvyw;
         this.lujeveh.volume = this.defomeju.volume;
         this.wupu = this.lujeveh;
         this.wupu.play(bumo,1000);
      }
   }
}

