package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.sfx.GraphicEffect;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class Dus extends PooledObject implements GraphicEffect
   {
      
      private static const pajuzovaj:Vector3 = new Vector3();
      
      private static const cugu:Vector3 = new Vector3();
      
      private static const cojo:Matrix4 = new Matrix4();
      
      private var caru:Javuvyh;
      
      private var bopuvi:int;
      
      private var turret:Object3D;
      
      private var somip:Vector3 = new Vector3();
      
      private var container:Scene3DContainer;
      
      public function Dus(_arg_1:Pool)
      {
         super(_arg_1);
         this.caru = new Javuvyh(1,1,0.5,0);
         this.caru.dow(0,0,0,1,1,1,1,0);
         this.caru.shadowMapAlphaThreshold = 2;
         this.caru.depthMapAlphaThreshold = 2;
         this.caru.useShadowMap = false;
         this.caru.useLight = false;
      }
      
      public function init(_arg_1:Vector3, _arg_2:Object3D, _arg_3:TextureMaterial, _arg_4:int, _arg_5:Number, _arg_6:Number) : void
      {
         this.somip.copy(_arg_1);
         this.turret = _arg_2;
         this.bopuvi = _arg_4;
         this.caru.setMaterialToAllFaces(_arg_3);
         this.caru.width = _arg_5;
         this.caru.length = _arg_6;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.bopuvi < 0)
         {
            return false;
         }
         this.bopuvi -= _arg_1;
         cojo.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         cojo.transformVector(this.somip,cugu);
         cojo.getAxis(1,pajuzovaj);
         Jyj.moruqogi(this.caru,cugu,pajuzovaj,_arg_2.position);
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.caru);
         this.container = null;
         this.turret = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.bopuvi = -1;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.container = _arg_1;
         _arg_1.addChild(this.caru);
      }
   }
}

