package alternativa.tanks.bonuses
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import obfuscation.ronadylez.Vyhesuz;
   
   public class BonusObject3DBase implements Object3DWrapper, Vyhesuz
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      protected var object:Object3D;
      
      private var ownAlpha:Number = 1;
      
      private var alphaMultiplier:Number = 1;
      
      public function BonusObject3DBase()
      {
         super();
      }
      
      public function setPosition(_arg_1:Vector3) : void
      {
         this.object.x = _arg_1.x;
         this.object.y = _arg_1.y;
         this.object.z = _arg_1.z;
      }
      
      public function setPositionComponents(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.object.x = _arg_1;
         this.object.y = _arg_2;
         this.object.z = _arg_3;
      }
      
      public function setRotation(_arg_1:Vector3) : void
      {
         this.object.rotationX = _arg_1.x;
         this.object.rotationY = _arg_1.y;
         this.object.rotationZ = _arg_1.z;
      }
      
      public function setRotationComponents(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.object.rotationX = _arg_1;
         this.object.rotationY = _arg_2;
         this.object.rotationZ = _arg_3;
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.x = this.object.x;
         _arg_1.y = this.object.y;
         _arg_1.z = this.object.z;
      }
      
      public function readRotation(_arg_1:Vector3) : void
      {
         _arg_1.x = this.object.rotationX;
         _arg_1.y = this.object.rotationY;
         _arg_1.z = this.object.rotationZ;
      }
      
      public function getAlpha() : Number
      {
         return this.ownAlpha;
      }
      
      public function setAlpha(_arg_1:Number) : void
      {
         this.ownAlpha = _arg_1;
         this.updateAlpha();
      }
      
      public function setAlphaMultiplier(_arg_1:Number) : void
      {
         this.alphaMultiplier = _arg_1;
         this.updateAlpha();
      }
      
      protected function updateAlpha() : void
      {
         this.object.alpha = this.alphaMultiplier * this.ownAlpha;
      }
      
      public function readTransform(_arg_1:Matrix4) : void
      {
         _arg_1.setMatrix(this.object.x,this.object.y,this.object.z,this.object.rotationX,this.object.rotationY,this.object.rotationZ);
      }
      
      public function addToScene() : void
      {
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.addObject(this.object);
         _local_1.tiziqec.add(this);
      }
      
      public function removeFromScene() : void
      {
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.removeObject(this.object);
         _local_1.tiziqec.remove(this);
      }
      
      public function addZ(_arg_1:Number) : void
      {
         this.object.z += _arg_1;
      }
   }
}

