package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import obfuscation.kofen.Vector3d;
   
   public class Kyvuqufu
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var cafolo:BattleReadinessService;
      
      private var nyhes:Boolean = true;
      
      public function Kyvuqufu(_arg_1:Boolean)
      {
         super();
         this.nyhes = _arg_1;
      }
      
      public function nocyryl(_arg_1:Vector3d, _arg_2:Vector3d) : void
      {
         var _local_3:Vector3 = new Vector3(_arg_1.x,_arg_1.y,_arg_1.z);
         var _local_4:Vector3 = new Vector3(-Math.sin(_arg_2.z),Math.cos(_arg_2.z),0);
         if(this.nyhes)
         {
            this.nyhes = false;
            battleService.bofoh();
            battleService.gonuju();
            battleService.rutewa(_local_3,_local_4);
            cafolo.jiju();
         }
         else
         {
            battleService.pafobome(_local_3,_local_4);
         }
      }
   }
}

