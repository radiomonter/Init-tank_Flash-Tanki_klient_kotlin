package alternativa.tanks.controllers.battlecreate
{
   import flash.events.Event;
   
   public class CheckBattleNameEvent extends Event
   {
      
      public static const CHECK_NAME:String = "CheckBattleNameEvent.CHECK_NAME";
      
      public var battleName:String;
      
      public function CheckBattleNameEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.battleName = _arg_2;
      }
   }
}

