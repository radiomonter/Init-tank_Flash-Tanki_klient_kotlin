package obfuscation.cujewipo
{
   import alternativa.engine3d.materials.Material;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.rofa.Jyj;
   
   public class Punakade extends PooledObject implements Vypalati
   {
      
      public static const WIDTH:Number = 48;
      
      private var position:Vector3 = new Vector3();
      
      private var direction:Vector3 = new Vector3();
      
      private var mesupaba:Number;
      
      private var taqa:int;
      
      private var tin:Mykolo;
      
      private var container:Scene3DContainer;
      
      public function Punakade(_arg_1:Pool)
      {
         super(_arg_1);
         this.tin = new Mykolo();
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Number, _arg_5:Material, _arg_6:int) : void
      {
         this.position.copy(_arg_1);
         this.direction.copy(_arg_2);
         this.taqa = _arg_6;
         this.mesupaba = 1 / _arg_6;
         this.tin.init(WIDTH,_arg_3,_arg_4,_arg_5);
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.taqa < 0)
         {
            return false;
         }
         this.taqa -= _arg_1;
         this.tin.alpha -= this.mesupaba * _arg_1;
         Jyj.moruqogi(this.tin,this.position,this.direction,_arg_2.position);
         return true;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.tin);
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.tin);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.taqa = -1;
      }
   }
}

