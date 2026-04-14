package alternativa.tanks.gui.tankpreview
{
   import flash.utils.Dictionary;
   
   public class TankPreviewStateMachine
   {
      
      private var eventTransitions:Dictionary = new Dictionary();
      
      private var currentState:TankPreviewState;
      
      public function TankPreviewStateMachine()
      {
         super();
      }
      
      public function addTransition(_arg_1:TankPreviewEvent, _arg_2:TankPreviewState, _arg_3:TankPreviewState) : void
      {
         var _local_4:Dictionary = this.eventTransitions[_arg_1];
         if(_local_4 == null)
         {
            _local_4 = new Dictionary();
            this.eventTransitions[_arg_1] = _local_4;
         }
         _local_4[_arg_2] = _arg_3;
      }
      
      public function handleEvent(_arg_1:TankPreviewState, _arg_2:TankPreviewEvent) : void
      {
         var _local_3:Dictionary = this.eventTransitions[_arg_2];
         if(_local_3 == null)
         {
            throw new NoTransitionsFoundError();
         }
         var _local_4:TankPreviewState = _local_3[_arg_1];
         if(_local_4 == null)
         {
            throw new NewStateMissingError();
         }
         _arg_1.exit();
         _local_4.enter();
         this.currentState = _local_4;
      }
      
      public function setCurrentState(_arg_1:TankPreviewState) : void
      {
         this.currentState = _arg_1;
         this.currentState.enter();
      }
      
      public function updateCurrentState() : void
      {
         this.currentState.update();
      }
   }
}

