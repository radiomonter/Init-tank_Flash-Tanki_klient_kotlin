package alternativa.tanks.controllers.battlelist
{
   import alternativa.types.Long;
   import flash.events.Event;
   
   public class CreateBattleClickEvent extends Event
   {
      
      public static const CREATE_BATTLE_CLICK:String = "CreateBattleClickEvent.CREATE_BATTLE_CLICK";
      
      public function CreateBattleClickEvent(_arg_1:String, _arg_2:Long, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

