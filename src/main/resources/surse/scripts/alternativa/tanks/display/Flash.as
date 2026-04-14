package alternativa.tanks.display
{
   import flash.utils.getTimer;
   
   public class Flash
   {
      
      private static const SHOW:int = 1;
      
      private static const FADE:int = 2;
      
      private static const DONE:int = 3;
      
      private var maxOffset:uint;
      
      private var flashDuration:int;
      
      private var fadeDuration:int;
      
      private var state:int = 3;
      
      private var startTime:int;
      
      public function Flash(_arg_1:uint, _arg_2:int, _arg_3:int)
      {
         super();
         this.maxOffset = _arg_1;
         this.flashDuration = _arg_2;
         this.fadeDuration = _arg_3;
      }
      
      public static function getDefault() : Flash
      {
         return new Flash(255,100,300);
      }
      
      public function isActive() : Boolean
      {
         return this.state != DONE;
      }
      
      public function init() : void
      {
         this.startTime = getTimer();
         this.state = SHOW;
      }
      
      public function getColorOffset(_arg_1:int) : uint
      {
         var _local_2:uint = 0;
         switch(this.state)
         {
            case SHOW:
               if(_arg_1 < this.startTime + this.flashDuration)
               {
                  _local_2 = uint(this.maxOffset * (_arg_1 - this.startTime) / this.flashDuration);
               }
               else
               {
                  _local_2 = this.maxOffset;
                  this.startTime += this.flashDuration + this.fadeDuration;
                  this.state = FADE;
               }
               break;
            case FADE:
               if(_arg_1 < this.startTime)
               {
                  _local_2 = uint(this.maxOffset * (this.startTime - _arg_1) / this.fadeDuration);
               }
               else
               {
                  this.state = DONE;
                  _local_2 = 0;
               }
         }
         return _local_2;
      }
   }
}

