package alternativa.tanks.animations
{
   public class AnimationTrack
   {
      
      private var times:Vector.<Number>;
      
      private var values:Vector.<Number>;
      
      private var numFrames:int;
      
      private var minTime:Number;
      
      private var maxTime:Number;
      
      public function AnimationTrack(_arg_1:Vector.<Number>, _arg_2:Vector.<Number>)
      {
         super();
         this.times = _arg_1;
         this.values = _arg_2;
         this.numFrames = _arg_1.length;
         this.minTime = _arg_1[0];
         this.maxTime = _arg_1[this.numFrames - 1];
      }
      
      public function getFrameTime(_arg_1:int) : Number
      {
         return this.times[_arg_1];
      }
      
      public function getNumFrames() : int
      {
         return this.numFrames;
      }
      
      public function getMinTime() : Number
      {
         return this.minTime;
      }
      
      public function getMaxTime() : Number
      {
         return this.maxTime;
      }
      
      public function getFrameValue(_arg_1:int) : Number
      {
         return this.values[_arg_1];
      }
   }
}

