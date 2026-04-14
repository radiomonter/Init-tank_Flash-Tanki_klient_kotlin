package alternativa.tanks.gui
{
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Nebaqyce implements CountDownTimerOnCompleteBefore
   {
      
      public var item:IGameObject;
      
      public var timer:CountDownTimer;
      
      private var garageWindow:Jec;
      
      public function Nebaqyce(_arg_1:IGameObject, _arg_2:CountDownTimer, _arg_3:Jec)
      {
         super();
         this.item = _arg_1;
         this.timer = _arg_2;
         this.garageWindow = _arg_3;
         this.timer.addListener(CountDownTimerOnCompleteBefore,this);
      }
      
      public function onCompleteBefore(_arg_1:CountDownTimer, _arg_2:Boolean) : void
      {
         this.garageWindow.removeItemFromStore(this.item);
      }
      
      public function removeListener() : void
      {
         this.timer.removeListener(CountDownTimerOnCompleteBefore,this);
      }
   }
}

