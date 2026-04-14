package obfuscation.kisagehy
{
   public class Dyrur
   {
      
      private var _alpha:Number;
      
      private var _color:int;
      
      private var wec:Number;
      
      private var feg:Number;
      
      public function Dyrur(_arg_1:Number = 0, _arg_2:int = 0, _arg_3:Number = 0, _arg_4:Number = 0)
      {
         super();
         this._alpha = _arg_1;
         this._color = _arg_2;
         this.wec = _arg_3;
         this.feg = _arg_4;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(_arg_1:Number) : void
      {
         this._alpha = _arg_1;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function set color(_arg_1:int) : void
      {
         this._color = _arg_1;
      }
      
      public function get farLimit() : Number
      {
         return this.wec;
      }
      
      public function set farLimit(_arg_1:Number) : void
      {
         this.wec = _arg_1;
      }
      
      public function get nearLimit() : Number
      {
         return this.feg;
      }
      
      public function set nearLimit(_arg_1:Number) : void
      {
         this.feg = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "FogParams [";
         _local_1 += "alpha = " + this.alpha + " ";
         _local_1 += "color = " + this.color + " ";
         _local_1 += "farLimit = " + this.farLimit + " ";
         _local_1 += "nearLimit = " + this.nearLimit + " ";
         return _local_1 + "]";
      }
   }
}

