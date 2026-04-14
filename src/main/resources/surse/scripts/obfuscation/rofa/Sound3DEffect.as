package obfuscation.rofa
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class Sound3DEffect extends PooledObject implements ISound3DEffect
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var position:Vector3 = new Vector3();
      
      private var sound:Sound3D;
      
      private var toz:int;
      
      private var startTime:int;
      
      private var channel:SoundChannel;
      
      private var _enabled:Boolean = false;
      
      private var luk:Boolean = false;
      
      private var listener:ISoundEffectDestructionListener;
      
      public function Sound3DEffect(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public static function create(_arg_1:Vector3, _arg_2:Sound3D, _arg_3:int = 0, _arg_4:int = 0, _arg_5:ISoundEffectDestructionListener = null) : Sound3DEffect
      {
         var _local_6:Sound3DEffect = Sound3DEffect(battleService.getObjectPool().getObject(Sound3DEffect));
         _local_6.init(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         return _local_6;
      }
      
      public function init(_arg_1:Vector3, _arg_2:Sound3D, _arg_3:int = 0, _arg_4:int = 0, _arg_5:ISoundEffectDestructionListener = null) : void
      {
         this.position.copy(_arg_1);
         this.sound = _arg_2;
         this.toz = _arg_3;
         this.startTime = _arg_4;
         this.listener = _arg_5;
         this._enabled = false;
         this.luk = false;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : void
      {
         this.toz -= _arg_1;
         if(this.toz > 0)
         {
            return;
         }
         if(!this.luk)
         {
            this.luk = true;
            this.channel = this.sound.play(this.startTime,1);
            if(this.channel == null)
            {
               return;
            }
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.kykoqoz);
         }
         this.sound.guma(_arg_2.position,this.position,_arg_2.ziko);
      }
      
      public function destroy() : void
      {
         Sound3D.destroy(this.sound);
         this.sound = null;
         this.kykoqoz(null);
         if(this.listener != null)
         {
            this.listener.tuci(this);
            this.listener = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this._enabled = false;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(this._enabled == _arg_1)
         {
            return;
         }
         if(!(this._enabled = _arg_1))
         {
            this.kykoqoz(null);
         }
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.position.x;
         _arg_1.y = this.position.y;
         _arg_1.z = this.position.z;
      }
      
      public function get bag() : int
      {
         return !this._enabled ? int(0) : int(1);
      }
      
      private function kykoqoz(_arg_1:Event) : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.kykoqoz);
         }
         this._enabled = false;
         this.channel = null;
      }
   }
}

