package obfuscation.bez
{
   import obfuscation.kofen.Vector3d;
   
   public class Lij
   {
      
      private var nosejefib:int;
      
      private var _direction:Vector3d;
      
      private var _position:Vector3d;
      
      public function Lij(_arg_1:int = 0, _arg_2:Vector3d = null, _arg_3:Vector3d = null)
      {
         super();
         this.nosejefib = _arg_1;
         this._direction = _arg_2;
         this._position = _arg_3;
      }
      
      public function get fuwymolut() : int
      {
         return this.nosejefib;
      }
      
      public function set fuwymolut(_arg_1:int) : void
      {
         this.nosejefib = _arg_1;
      }
      
      public function get direction() : Vector3d
      {
         return this._direction;
      }
      
      public function set direction(_arg_1:Vector3d) : void
      {
         this._direction = _arg_1;
      }
      
      public function get position() : Vector3d
      {
         return this._position;
      }
      
      public function set position(_arg_1:Vector3d) : void
      {
         this._position = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ShellState [";
         _local_1 += "clientTime = " + this.fuwymolut + " ";
         _local_1 += "direction = " + this.direction + " ";
         _local_1 += "position = " + this.position + " ";
         return _local_1 + "]";
      }
   }
}

