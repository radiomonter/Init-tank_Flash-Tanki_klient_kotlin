package alternativa.tanks.gui.tankpreview
{
   import alternativa.engine3d.core.Object3D;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AutoRotationState implements TankPreviewState
   {
      
      private static const MAX_ANGULAR_SPEED:Number = Math.PI * 5 / 180;
      
      private static const ANGULAR_ACCELERATION:Number = Math.PI * 5 / 180;
      
      private var stateMachine:TankPreviewStateMachine;
      
      private var eventSource:IEventDispatcher;
      
      private var angularSpeed:Number = 0;
      
      private var lastTime:int;
      
      private var cameraContainer:Object3D;
      
      public function AutoRotationState(_arg_1:TankPreviewStateMachine, _arg_2:IEventDispatcher, _arg_3:Object3D)
      {
         super();
         this.stateMachine = _arg_1;
         this.eventSource = _arg_2;
         this.cameraContainer = _arg_3;
      }
      
      public function enter() : void
      {
         this.eventSource.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.lastTime = getTimer();
         this.angularSpeed = 0;
      }
      
      public function update() : void
      {
         var _local_1:Number = this.updateLastTimeAndGetTimeDelta();
         this.calculateAngularSpeed(_local_1);
         this.cameraContainer.rotationZ += this.angularSpeed * _local_1;
      }
      
      private function updateLastTimeAndGetTimeDelta() : Number
      {
         var _local_1:int = getTimer();
         var _local_2:Number = (_local_1 - this.lastTime) / 1000;
         this.lastTime = _local_1;
         if(_local_2 == 0)
         {
            _local_2 = 0.1;
         }
         return _local_2;
      }
      
      private function calculateAngularSpeed(_arg_1:Number) : void
      {
         if(this.angularSpeed < MAX_ANGULAR_SPEED)
         {
            this.angularSpeed += ANGULAR_ACCELERATION * _arg_1;
            if(this.angularSpeed > MAX_ANGULAR_SPEED)
            {
               this.angularSpeed = MAX_ANGULAR_SPEED;
            }
         }
      }
      
      public function exit() : void
      {
         this.eventSource.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function onMouseDown(_arg_1:MouseEvent) : void
      {
         this.stateMachine.handleEvent(this,TankPreviewEvent.MOUSE_DOWN);
      }
   }
}

