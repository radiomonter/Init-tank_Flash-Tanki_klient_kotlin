package obfuscation.zoniseg
{
   import alternativa.engine3d.materials.Material;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.rofa.Jyj;
   
   public class Kik extends PooledObject implements GraphicEffect
   {
      
      private var container:Scene3DContainer;
      
      private var trail:Mibip;
      
      private var vyzepopo:Vector3 = new Vector3();
      
      private var direction:Vector3 = new Vector3();
      
      private var rocob:Number;
      
      private var vosuje:Number;
      
      private var qejyvu:Number;
      
      private var wymot:int;
      
      private var time:int;
      
      public function Kik(_arg_1:Pool)
      {
         super(_arg_1);
         this.trail = new Mibip();
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Material, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:int) : void
      {
         this.vyzepopo.copy(_arg_1);
         this.direction.diff(_arg_2,_arg_1);
         var _local_9:Number = this.direction.length();
         this.direction.scale(1 / _local_9);
         this.rocob = _arg_5;
         this.vosuje = _arg_6;
         this.qejyvu = _arg_7;
         this.wymot = _arg_8;
         this.trail.init(_arg_4,_local_9,_arg_3,_arg_7);
         this.time = 0;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_4:Number = NaN;
         var _local_3:Number = NaN;
         if(this.time > this.wymot)
         {
            return false;
         }
         Jyj.moruqogi(this.trail,this.vyzepopo,this.direction,_arg_2.position);
         _local_4 = this.time / this.wymot;
         _local_3 = Math.sqrt(_local_4);
         this.trail.scaleX = this.rocob + (this.vosuje - this.rocob) * _local_3;
         this.trail.alpha = 1 - _local_4;
         this.trail.update(_local_3);
         this.time += _arg_1;
         return true;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.trail);
      }
      
      public function destroy() : void
      {
         this.trail.clear();
         this.container.removeChild(this.trail);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.time = this.wymot + 1;
      }
   }
}

