package alternativa.tanks.services.battleinput
{
   import alternativa.tanks.utils.BitMask;
   import flash.events.EventDispatcher;
   
   public class Wyj extends EventDispatcher implements BattleInputService
   {
      
      private const rituq:BitMask = new BitMask();
      
      public function Wyj()
      {
         super();
      }
      
      public function lock(_arg_1:Tyd) : void
      {
         var _local_2:Boolean = this.jep();
         var _local_3:Boolean = this.miwyraze();
         this.rituq.setBits(_arg_1.jevatotu());
         if(!_local_2 && this.jep())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_LOCKED));
         }
         if(!_local_3 && this.miwyraze())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_LOCKED));
         }
      }
      
      public function unlock(_arg_1:Tyd) : void
      {
         var _local_2:Boolean = this.jep();
         var _local_3:Boolean = this.miwyraze();
         this.rituq.clearBits(_arg_1.jevatotu());
         if(_local_2 && !this.jep())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_UNLOCKED));
         }
         if(_local_3 && !this.miwyraze())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_UNLOCKED));
         }
      }
      
      public function miwyraze() : Boolean
      {
         return !this.rituq.isEmpty();
      }
      
      public function jep() : Boolean
      {
         return this.rituq.hasAnyBit(Tyd.byzidaj.jevatotu());
      }
   }
}

