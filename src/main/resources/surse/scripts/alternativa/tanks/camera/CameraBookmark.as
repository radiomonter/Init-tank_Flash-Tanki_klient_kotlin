package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   
   public class CameraBookmark
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public var position:Vector3 = new Vector3();
      
      public var puzacydab:Vector3 = new Vector3();
      
      public function CameraBookmark()
      {
         super();
      }
      
      public function kaqyp() : void
      {
         var _local_1:GameCamera = battleService.getBattleScene3D().cewubu();
         this.position.x = _local_1.x;
         this.position.y = _local_1.y;
         this.position.z = _local_1.z;
         this.puzacydab.x = _local_1.rotationX;
         this.puzacydab.y = _local_1.rotationY;
         this.puzacydab.z = _local_1.rotationZ;
      }
   }
}

