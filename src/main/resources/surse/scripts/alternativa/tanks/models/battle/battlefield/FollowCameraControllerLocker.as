package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import obfuscation.jewyti.Duso;
   
   public class FollowCameraControllerLocker
   {
      
      [Inject]
      public static var norata:BattleInputService;
      
      private var ziqowa:Duso;
      
      public function FollowCameraControllerLocker(_arg_1:Duso)
      {
         super();
         this.ziqowa = _arg_1;
         norata.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.wufaj);
         norata.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.nusonubi);
         if(norata.miwyraze())
         {
            _arg_1.benos();
         }
      }
      
      private function wufaj(_arg_1:BattleInputLockEvent) : void
      {
         this.ziqowa.benos();
      }
      
      private function nusonubi(_arg_1:BattleInputLockEvent) : void
      {
         this.ziqowa.ficik();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.ziqowa = null;
         norata.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.wufaj);
         norata.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.nusonubi);
      }
   }
}

