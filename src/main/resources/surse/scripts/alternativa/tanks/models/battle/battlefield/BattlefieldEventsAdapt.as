package alternativa.tanks.models.battle.battlefield
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattlefieldEventsAdapt implements BattlefieldEvents
   {
      
      private var object:IGameObject;
      
      private var impl:BattlefieldEvents;
      
      public function BattlefieldEventsAdapt(_arg_1:IGameObject, _arg_2:BattlefieldEvents)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function notedeg() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.notedeg();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

