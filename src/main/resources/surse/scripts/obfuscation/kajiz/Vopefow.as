package obfuscation.kajiz
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   
   public class Vopefow
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private const zuke:Number = 0.9999;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var fesuhum:Number;
      
      private var filter:IRayCollisionFilter;
      
      private var retyf:Boolean = false;
      
      public function Vopefow(_arg_1:Number, _arg_2:IRayCollisionFilter)
      {
         super();
         this.fesuhum = _arg_1;
         this.filter = _arg_2;
         this.collisionDetector = battleService.getBattleRunner().soc();
      }
      
      public function sab() : void
      {
         this.retyf = true;
      }
      
      protected function raycast(_arg_1:AllGlobalGunParams, _arg_2:Vector3, _arg_3:RayHit) : Boolean
      {
         var _local_4:Vector3 = null;
         if(!this.retyf || _arg_2.dot(_arg_1.direction) > this.zuke)
         {
            _local_4 = _arg_1.hiwanu;
         }
         else
         {
            _local_4 = _arg_1.vegenel;
         }
         if(this.collisionDetector.raycast(_local_4,_arg_2,Myw.WEAPON,this.fesuhum,this.filter,_arg_3))
         {
            _arg_3.staticHit = !BattleUtils.pote(_arg_3.shape.body) || Zicoha.fyfujuwub(_local_4,_arg_3.position);
            return true;
         }
         return false;
      }
   }
}

