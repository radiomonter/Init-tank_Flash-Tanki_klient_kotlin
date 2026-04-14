package alternativa.tanks.models.battle.gui.chat
{
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Tiwawi implements AutoClosable
   {
      
      [Inject]
      public static var norata:BattleInputService;
      
      private var chat:Suku;
      
      public function Tiwawi(_arg_1:Suku)
      {
         super();
         this.chat = _arg_1;
         norata.addEventListener(BattleInputLockEvent.CHAT_LOCKED,this.teqol);
         norata.addEventListener(BattleInputLockEvent.CHAT_UNLOCKED,this.zuheby);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         norata.removeEventListener(BattleInputLockEvent.CHAT_LOCKED,this.teqol);
         norata.removeEventListener(BattleInputLockEvent.CHAT_UNLOCKED,this.zuheby);
         this.chat = null;
      }
      
      private function teqol(_arg_1:BattleInputLockEvent) : void
      {
         this.chat.nijav();
         this.chat.locked = true;
      }
      
      private function zuheby(_arg_1:BattleInputLockEvent) : void
      {
         this.chat.locked = false;
      }
   }
}

