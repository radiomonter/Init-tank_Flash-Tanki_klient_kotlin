package platform.core.general.resource.types.imageframe
{
   public class ResourceImageFrameParams
   {
      
      private var _fps:Number;
      
      private var _frameHeight:int;
      
      private var _frameWidth:int;
      
      private var _numFrames:int;
      
      public function ResourceImageFrameParams(_arg_1:Number = 0, _arg_2:int = 0, _arg_3:int = 0, _arg_4:int = 0)
      {
         super();
         this._fps = _arg_1;
         this._frameHeight = _arg_2;
         this._frameWidth = _arg_3;
         this._numFrames = _arg_4;
      }
      
      public function get fps() : Number
      {
         return this._fps;
      }
      
      public function set fps(_arg_1:Number) : void
      {
         this._fps = _arg_1;
      }
      
      public function get frameHeight() : int
      {
         return this._frameHeight;
      }
      
      public function set frameHeight(_arg_1:int) : void
      {
         this._frameHeight = _arg_1;
      }
      
      public function get frameWidth() : int
      {
         return this._frameWidth;
      }
      
      public function set frameWidth(_arg_1:int) : void
      {
         this._frameWidth = _arg_1;
      }
      
      public function get numFrames() : int
      {
         return this._numFrames;
      }
      
      public function set numFrames(_arg_1:int) : void
      {
         this._numFrames = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ResourceImageFrameParams [";
         _local_1 += "fps = " + this.fps + " ";
         _local_1 += "frameHeight = " + this.frameHeight + " ";
         _local_1 += "frameWidth = " + this.frameWidth + " ";
         _local_1 += "numFrames = " + this.numFrames + " ";
         return _local_1 + "]";
      }
   }
}

