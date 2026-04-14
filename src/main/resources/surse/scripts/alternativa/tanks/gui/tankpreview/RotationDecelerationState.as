package alternativa.tanks.gui.tankpreview
{
   import alternativa.engine3d.core.Object3D;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class RotationDecelerationState implements TankPreviewState
   {
      
      private static const MIN_ROTATION_SPEED:Number = 0.02;
      
      private var stateMachine:TankPreviewStateMachine;
      
      private var eventSource:IEventDispatcher;
      
      private var context:TankPreviewContext;
      
      private var lastTime:int;
      
      private var cameraContainer:Object3D;
      
      public function RotationDecelerationState(_arg_1:TankPreviewStateMachine, _arg_2:IEventDispatcher, _arg_3:TankPreviewContext, _arg_4:Object3D)
      {
         super();
         this.stateMachine = _arg_1;
         this.eventSource = _arg_2;
         this.context = _arg_3;
         this.cameraContainer = _arg_4;
      }
      
      public function enter() : void
      {
         this.eventSource.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.lastTime = getTimer();
      }
      
      public function update() : void
      {
         var _local_1:int = getTimer();
         var _local_2:Number = (_local_1 - this.lastTime) / 1000;
         this.lastTime = _local_1;
         this.cameraContainer.rotationZ += this.context.angularSpeed * _local_2;
         if(Math.abs(this.context.angularSpeed) > MIN_ROTATION_SPEED)
         {
            this.context.angularSpeed *= Math.exp(-1.5 * _local_2);
         }
         else
         {
            this.context.angularSpeed = 0;
            this.stateMachine.handleEvent(this,TankPreviewEvent.ROTATION_STOPPED);
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

