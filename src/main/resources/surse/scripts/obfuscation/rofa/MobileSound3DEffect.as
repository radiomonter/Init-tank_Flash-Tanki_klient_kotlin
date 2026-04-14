package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class MobileSound3DEffect extends PooledObject implements ISound3DEffect
   {
      
      private static const dasew:Vector3 = new Vector3();
      
      private var sound:Sound3D;
      
      private var toz:int;
      
      private var startTime:int;
      
      private var wihe:int;
      
      private var object:Object3D;
      
      private var channel:SoundChannel;
      
      private var alive:Boolean;
      
      private var time:int;
      
      private var myzol:Number;
      
      private var fyhizobuz:Number;
      
      private var listener:ISoundEffectDestructionListener;
      
      public function MobileSound3DEffect(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function jop(_arg_1:Sound3D, _arg_2:Object3D, _arg_3:ISoundEffectDestructionListener = null) : void
      {
         this.init(_arg_1,_arg_2,0,1,0,_arg_3);
      }
      
      public function init(_arg_1:Sound3D, _arg_2:Object3D, _arg_3:int = 0, _arg_4:int = 1, _arg_5:int = 0, _arg_6:ISoundEffectDestructionListener = null) : void
      {
         this.sound = _arg_1;
         this.object = _arg_2;
         this.toz = _arg_3;
         this.wihe = _arg_4;
         this.startTime = _arg_5;
         this.listener = _arg_6;
         this.alive = true;
         this.time = 0;
         this.myzol = _arg_1.volume;
         this.fyhizobuz = 0;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : void
      {
         if(!this.alive)
         {
            return;
         }
         if(this.time < this.toz)
         {
            this.time += _arg_1;
            return;
         }
         if(!this.sound.rehyv())
         {
            this.channel = this.sound.play(this.startTime,this.wihe);
            if(this.channel != null)
            {
               this.channel.addEventListener(Event.SOUND_COMPLETE,this.kykoqoz);
            }
         }
         dasew.x = this.object.x;
         dasew.y = this.object.y;
         dasew.z = this.object.z;
         if(this.fyhizobuz > 0)
         {
            this.myzol -= this.fyhizobuz * _arg_1;
            if(this.myzol <= 0)
            {
               this.fyhizobuz = 0;
               this.myzol = 0;
            }
            this.sound.volume = this.myzol;
         }
         this.sound.guma(_arg_2.position,dasew,_arg_2.ziko);
      }
      
      public function destroy() : void
      {
         this.gih();
         Sound3D.destroy(this.sound);
         this.object = null;
         this.sound = null;
         if(this.listener != null)
         {
            this.listener.tuci(this);
            this.listener = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(!_arg_1)
         {
            this.gih();
         }
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.object.x;
         _arg_1.y = this.object.y;
         _arg_1.z = this.object.z;
      }
      
      public function get bag() : int
      {
         return !this.alive ? int(0) : int(1);
      }
      
      public function mesan(_arg_1:int) : void
      {
         this.fyhizobuz = this.myzol / _arg_1;
      }
      
      private function kykoqoz(_arg_1:Event) : void
      {
         this.gih();
         this.alive = false;
      }
      
      private function gih() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.kykoqoz);
            this.channel = null;
         }
         this.sound.stop();
         if(this.wihe <= 1)
         {
            this.alive = false;
         }
      }
   }
}

