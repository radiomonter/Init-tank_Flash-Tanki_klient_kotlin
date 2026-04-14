package controls
{
   import assets.icons.InputCheckIcon;
   import utils.tweener.TweenLite;
   
   public class ValidationIcon extends InputCheckIcon
   {
      
      private static const OFF:int = 0;
      
      private static const PROGRESS:int = 1;
      
      private static const VALID:int = 2;
      
      private static const INVALID:int = 3;
      
      public var fadeTime:Number;
      
      private var currentState:int = -1;
      
      public function ValidationIcon()
      {
         super();
         this.turnOff();
      }
      
      private function setCompleteVisible(_arg_1:Boolean) : void
      {
         visible = _arg_1;
         if(!visible)
         {
            gotoAndStop(this.currentState);
            if(this.currentState != OFF)
            {
               visible = true;
               if(this.fadeTime > 0)
               {
                  alpha = 0;
                  TweenLite.to(this,this.fadeTime,{"alpha":1});
               }
            }
         }
      }
      
      private function changeState(_arg_1:int) : void
      {
         if(this.currentState != _arg_1)
         {
            this.currentState = _arg_1;
            if(this.fadeTime > 0)
            {
               TweenLite.to(this,this.fadeTime,{
                  "alpha":0,
                  "onComplete":this.setCompleteVisible,
                  "onCompleteParams":[false]
               });
            }
            else
            {
               this.setCompleteVisible(false);
            }
         }
      }
      
      public function startProgress() : void
      {
         this.changeState(PROGRESS);
      }
      
      public function turnOff() : void
      {
         this.changeState(OFF);
      }
      
      public function markAsValid() : void
      {
         this.changeState(VALID);
      }
      
      public function markAsInvalid() : void
      {
         this.changeState(INVALID);
      }
   }
}

