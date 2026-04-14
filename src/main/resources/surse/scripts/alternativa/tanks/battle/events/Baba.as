package alternativa.tanks.battle.events
{
   import flash.utils.Dictionary;
   
   public class Baba implements BattleEventListener
   {
      
      private var dispatcher:BattleEventDispatcher;
      
      private var listener:BattleEventListener;
      
      private var fecy:Dictionary = new Dictionary();
      
      public function Baba(_arg_1:BattleEventDispatcher, _arg_2:BattleEventListener = null)
      {
         super();
         this.dispatcher = _arg_1;
         if(_arg_2 == null)
         {
            _arg_2 = this;
         }
         this.listener = _arg_2;
      }
      
      public function jikina(_arg_1:Class, _arg_2:Function) : void
      {
         this.fecy[_arg_1] = _arg_2;
      }
      
      public function bijoja() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.fecy)
         {
            this.dispatcher.pugu(_local_1,this.listener);
         }
      }
      
      public function ciqon() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.fecy)
         {
            this.dispatcher.kujo(_local_1,this.listener);
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Function = this.fecy[_arg_1.constructor];
         if(_local_2 != null)
         {
            _local_2(_arg_1);
         }
      }
      
      public function dispatchEvent(_arg_1:Object) : void
      {
         this.dispatcher.dispatchEvent(_arg_1);
      }
   }
}

