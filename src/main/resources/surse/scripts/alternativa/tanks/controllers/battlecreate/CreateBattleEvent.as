package alternativa.tanks.controllers.battlecreate
{
   import flash.events.Event;
   import obfuscation.fabuqy.Qumafi;
   
   public class CreateBattleEvent extends Event
   {
      
      public static const CREATE_BATTLE:String = "CreateBattleEvent.CREATE_BATTLE";
      
      public var battleCreateParams:Qumafi;
      
      public function CreateBattleEvent(_arg_1:String, _arg_2:Qumafi, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.battleCreateParams = _arg_2;
      }
   }
}

