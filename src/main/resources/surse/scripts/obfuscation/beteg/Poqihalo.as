package obfuscation.beteg
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import obfuscation.hasitaze.Gypuza;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.rofa.Sound3D;
   
   public class Poqihalo extends PooledObject implements ISound3DEffect
   {
      
      private static const lewyt:int = 100000;
      
      private static const vimune:Number = 1000;
      
      private static const vufaqacod:Number = 2000;
      
      private static const hiqelypy:Number = 2;
      
      private static const danadyp:Number = 1;
      
      private static const bumo:int = 200;
      
      private static const position:Vector3 = new Vector3();
      
      private var sfxData:Tany;
      
      private var object:Object3D;
      
      private var _type:Gypuza;
      
      private var _enabled:Boolean;
      
      private var dead:Boolean;
      
      private var wupu:Sound3D;
      
      private var qisipeb:SoundChannel;
      
      public function Poqihalo(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:Tany, _arg_2:Object3D) : void
      {
         this.sfxData = _arg_1;
         this.object = _arg_2;
         this._type = Gypuza.OFF;
         this.dead = false;
         this._enabled = false;
      }
      
      public function set type(_arg_1:Gypuza) : void
      {
         if(this._type != _arg_1)
         {
            this._type = _arg_1;
            this.rybowasa();
         }
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(this._enabled != _arg_1)
         {
            this._enabled = _arg_1;
            if(!this._enabled)
            {
               this.wupu.stop();
               this.qisipeb = null;
            }
         }
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : void
      {
         if(!this.dead)
         {
            if(this.qisipeb == null)
            {
               this.qisipeb = this.wupu.play(bumo,lewyt);
            }
            position.x = this.object.x;
            position.y = this.object.y;
            position.z = this.object.z;
            this.wupu.guma(_arg_2.position,position,_arg_2.ziko);
         }
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.object.x;
         _arg_1.y = this.object.y;
         _arg_1.z = this.object.z;
      }
      
      public function destroy() : void
      {
         if(this.wupu != null)
         {
            Sound3D.destroy(this.wupu);
            this.wupu = null;
            this.qisipeb = null;
         }
         this.sfxData = null;
         this.object = null;
         recycle();
      }
      
      public function get bag() : int
      {
         return !this.dead ? int(1) : int(0);
      }
      
      public function kill() : void
      {
         this.dead = true;
      }
      
      private function rybowasa() : void
      {
         var _local_1:SoundTransform = null;
         if(this.qisipeb != null)
         {
            _local_1 = this.qisipeb.soundTransform;
            this.qisipeb = null;
         }
         if(this.wupu != null)
         {
            Sound3D.destroy(this.wupu);
         }
         var _local_2:Sound = this.nysasakev();
         this.wupu = Sound3D.create(_local_2,danadyp,vimune,vufaqacod,hiqelypy);
         if(_local_1 != null)
         {
            this.qisipeb = this.wupu.play(bumo,lewyt);
            if(this.qisipeb != null)
            {
               this.qisipeb.soundTransform = _local_1;
            }
         }
      }
      
      private function nysasakev() : Sound
      {
         switch(this._type)
         {
            case Gypuza.IDLE:
               return this.sfxData.idleSound;
            case Gypuza.HEALING:
               return this.sfxData.bupog;
            case Gypuza.DAMAGING:
               return this.sfxData.habynud;
            default:
               throw new Error();
         }
      }
   }
}

