package obfuscation.garud
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.BattleView;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.weapon.shaft.Sef;
   
   use namespace alternativa3d;
   
   public class Rorucozok
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var camera:GameCamera;
      
      private var josizanep:Sef;
      
      public function Rorucozok(_arg_1:Sef)
      {
         super();
         this.josizanep = _arg_1;
         this.camera = battleService.getBattleScene3D().cewubu();
      }
      
      public function update(_arg_1:Vector3) : void
      {
         var _local_2:BattleView = null;
         var _local_3:Number = this.camera.focalLength;
         var _local_4:Number = this.camera.viewSizeX;
         var _local_5:Number = this.camera.viewSizeY;
         var _local_6:Number = Math.atan((_local_5 + this.josizanep.height / 2) / _local_3);
         var _local_7:Number = Math.atan((_local_4 + this.josizanep.width / 2) / _local_3);
         var _local_8:Matrix3 = BattleUtils.musivahi;
         _local_8.setRotationMatrixForObject3D(this.camera);
         var _local_9:Vector3 = BattleUtils.vemoleg;
         _local_8.transformVectorInverse(_arg_1,_local_9);
         var _local_10:Number = Math.atan2(_local_9.x,_local_9.z);
         var _local_11:Number = Math.atan2(_local_9.y,_local_9.z);
         this.josizanep.visible = Math.abs(_local_11) <= _local_6 && Math.abs(_local_10) <= _local_7;
         if(this.josizanep.visible)
         {
            _local_2 = battleService.getBattleView();
            this.josizanep.x = _local_2.lizo() + Math.tan(_local_10) * _local_3 + _local_4 - this.josizanep.width / 2;
            this.josizanep.y = _local_2.sohysatu() + Math.tan(_local_11) * _local_3 + _local_5 - this.josizanep.height / 2;
         }
      }
   }
}

