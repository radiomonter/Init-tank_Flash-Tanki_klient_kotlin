package alternativa.tanks.gui.tankpreview
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class ManualRotationState implements TankPreviewState
   {
      
      private var stateMachine:TankPreviewStateMachine;
      
      private var stage:Stage;
      
      private var context:TankPreviewContext;
      
      private var camera:Camera3D;
      
      private var startingRotatonZ:Number;
      
      private var startingMouseX:Number;
      
      private var times:Vector.<int> = new Vector.<int>(2);
      
      private var rotations:Vector.<Number> = new Vector.<Number>(2);
      
      private var cameraContainer:Object3D;
      
      public function ManualRotationState(_arg_1:TankPreviewStateMachine, _arg_2:Stage, _arg_3:TankPreviewContext, _arg_4:Camera3D, _arg_5:Object3D)
      {
         super();
         this.stateMachine = _arg_1;
         this.stage = _arg_2;
         this.context = _arg_3;
         this.camera = _arg_4;
         this.cameraContainer = _arg_5;
      }
      
      public function enter() : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.startingRotatonZ = this.cameraContainer.rotationZ;
         this.startingMouseX = this.stage.mouseX;
         this.times[0] = getTimer();
         this.times[1] = this.times[0];
         this.rotations[0] = this.cameraContainer.rotationZ;
         this.rotations[1] = this.rotations[0];
      }
      
      public function update() : void
      {
         this.cameraContainer.rotationZ = this.getRotationZ();
         this.times[1] = this.times[0];
         this.times[0] = getTimer();
         this.rotations[1] = this.rotations[0];
         this.rotations[0] = this.cameraContainer.rotationZ;
      }
      
      public function exit() : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
      }
      
      private function onStageMouseUp(_arg_1:MouseEvent) : void
      {
         this.cameraContainer.rotationZ = this.getRotationZ();
         var _local_2:Number = (getTimer() - this.times[1]) / 1000;
         if(_local_2 == 0)
         {
            _local_2 = 0.1;
         }
         this.context.angularSpeed = (this.cameraContainer.rotationZ - this.rotations[1]) / _local_2;
         this.stateMachine.handleEvent(this,TankPreviewEvent.STOP_MANUAL_ROTATION);
      }
      
      private function getRotationZ() : Number
      {
         var _local_1:Number = 2 * Math.PI / this.camera.view.width;
         return this.startingRotatonZ + (this.startingMouseX - this.stage.mouseX) * _local_1;
      }
   }
}

