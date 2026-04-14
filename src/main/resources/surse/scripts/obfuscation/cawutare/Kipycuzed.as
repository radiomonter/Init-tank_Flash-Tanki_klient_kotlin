package obfuscation.cawutare
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.TankControlLockBits;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   
   public class Kipycuzed
   {
      
      [Inject]
      public static var bafat:BattleInputService;
      
      private var user:Tank;
      
      public function Kipycuzed(_arg_1:Tank)
      {
         super();
         this.user = _arg_1;
         bafat.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.wufaj);
         bafat.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.nusonubi);
      }
      
      private function wufaj(_arg_1:BattleInputLockEvent) : void
      {
         var _local_2:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_2.rusif(this.user.bebosaca(),TankControlLockBits.INPUT);
         _local_2.sihobi(this.user.bebosaca()).covymyf(TankControlLockBits.INPUT,true);
      }
      
      private function nusonubi(_arg_1:BattleInputLockEvent) : void
      {
         var _local_2:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         _local_2.lyli(this.user.bebosaca(),TankControlLockBits.INPUT);
         _local_2.sihobi(this.user.bebosaca()).fygojamo(TankControlLockBits.INPUT);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         bafat.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.wufaj);
         bafat.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.nusonubi);
         this.user = null;
      }
   }
}

