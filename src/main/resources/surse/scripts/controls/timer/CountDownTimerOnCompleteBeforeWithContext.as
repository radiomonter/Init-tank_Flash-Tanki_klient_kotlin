package controls.timer
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class CountDownTimerOnCompleteBeforeWithContext implements CountDownTimerOnCompleteBefore
   {
      
      private var contextObject:IGameObject;
      
      private var listener:CountDownTimerOnCompleteBefore;
      
      public function CountDownTimerOnCompleteBeforeWithContext(_arg_1:IGameObject, _arg_2:CountDownTimerOnCompleteBefore)
      {
         super();
         this.contextObject = _arg_1;
         this.listener = _arg_2;
      }
      
      public function onCompleteBefore(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         Model.object = this.contextObject;
         this.listener.onCompleteBefore(_arg_1,_arg_2);
         Model.popObject();
      }
   }
}

