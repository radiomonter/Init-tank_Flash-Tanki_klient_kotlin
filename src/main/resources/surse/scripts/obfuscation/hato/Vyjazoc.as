package obfuscation.hato
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import flash.media.Sound;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.rofa.Sound3D;
   
   public class Vyjazoc extends PooledObject implements ISound3DEffect
   {
      
      private static const vimune:Number = 1500;
      
      private static const vufaqacod:Number = 5000;
      
      private static const hiqelypy:Number = 10;
      
      private static const danadyp:Number = 1.3;
      
      private var wajal:Sound3D;
      
      private var position:Vector3 = new Vector3();
      
      private var alive:Boolean;
      
      public function Vyjazoc(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function init(_arg_1:Sound, _arg_2:Vector3) : void
      {
         this.wajal = Sound3D.create(_arg_1,danadyp,vimune,vufaqacod,hiqelypy);
         this.position.copy(_arg_2);
         this.alive = true;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : void
      {
         if(!this.wajal.rehyv())
         {
            this.wajal.play(0,99999);
         }
         this.wajal.guma(_arg_2.position,this.position,_arg_2.ziko);
      }
      
      public function destroy() : void
      {
         this.wajal.stop();
         Sound3D.destroy(this.wajal);
         this.wajal = null;
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(!_arg_1)
         {
            this.wajal.stop();
         }
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.copy(this.position);
      }
      
      public function get bag() : int
      {
         return !this.alive ? int(0) : int(1);
      }
   }
}

