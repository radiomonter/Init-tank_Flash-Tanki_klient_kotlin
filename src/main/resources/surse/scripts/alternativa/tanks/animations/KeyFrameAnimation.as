package alternativa.tanks.animations
{
   public class KeyFrameAnimation
   {
      
      private var track:AnimationTrack;
      
      private var currentFrame:int;
      
      private var time:Number;
      
      private var animatedValue:AnimatedValue;
      
      public function KeyFrameAnimation(_arg_1:AnimationTrack, _arg_2:AnimatedValue)
      {
         super();
         this.track = _arg_1;
         this.animatedValue = _arg_2;
      }
      
      public function start() : void
      {
         this.time = this.track.getMinTime();
         this.currentFrame = 0;
      }
      
      public function isComplete() : Boolean
      {
         return this.currentFrame == this.track.getNumFrames() - 1;
      }
      
      public function update(_arg_1:Number) : void
      {
         if(!this.isComplete())
         {
            this.time += _arg_1;
            while(this.time > this.track.getFrameTime(this.currentFrame + 1))
            {
               ++this.currentFrame;
               if(this.isComplete())
               {
                  this.time = this.track.getMaxTime();
                  break;
               }
            }
            this.animatedValue.setAnimatedValue(this.getValue());
         }
      }
      
      private function getValue() : Number
      {
         var _local_1:Number = NaN;
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(this.isComplete())
         {
            return this.track.getFrameTime(this.currentFrame);
         }
         _local_1 = this.track.getFrameTime(this.currentFrame);
         _local_2 = this.track.getFrameTime(this.currentFrame + 1);
         _local_3 = this.track.getFrameValue(this.currentFrame);
         _local_4 = this.track.getFrameValue(this.currentFrame + 1);
         return _local_3 + (_local_4 - _local_3) * (this.time - _local_1) / (_local_2 - _local_1);
      }
   }
}

