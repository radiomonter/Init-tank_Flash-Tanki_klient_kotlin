package obfuscation.qusen
{
   import obfuscation.kofen.Vector3d;
   
   public class Pukimule
   {
      
      private var tebob:Vector3d;
      
      private var lumyj:int;
      
      private var sozujygu:Vector3d;
      
      private var tysonivo:Vector3d;
      
      private var _position:Vector3d;
      
      public function Pukimule(_arg_1:Vector3d = null, _arg_2:int = 0, _arg_3:Vector3d = null, _arg_4:Vector3d = null, _arg_5:Vector3d = null)
      {
         super();
         this.tebob = _arg_1;
         this.lumyj = _arg_2;
         this.sozujygu = _arg_3;
         this.tysonivo = _arg_4;
         this._position = _arg_5;
      }
      
      public function get angularVelocity() : Vector3d
      {
         return this.tebob;
      }
      
      public function set angularVelocity(_arg_1:Vector3d) : void
      {
         this.tebob = _arg_1;
      }
      
      public function get control() : int
      {
         return this.lumyj;
      }
      
      public function set control(_arg_1:int) : void
      {
         this.lumyj = _arg_1;
      }
      
      public function get linearVelocity() : Vector3d
      {
         return this.sozujygu;
      }
      
      public function set linearVelocity(_arg_1:Vector3d) : void
      {
         this.sozujygu = _arg_1;
      }
      
      public function get orientation() : Vector3d
      {
         return this.tysonivo;
      }
      
      public function set orientation(_arg_1:Vector3d) : void
      {
         this.tysonivo = _arg_1;
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
         var _local_1:* = "MoveCommand [";
         _local_1 += "angularVelocity = " + this.angularVelocity + " ";
         _local_1 += "control = " + this.control + " ";
         _local_1 += "linearVelocity = " + this.linearVelocity + " ";
         _local_1 += "orientation = " + this.orientation + " ";
         _local_1 += "position = " + this.position + " ";
         return _local_1 + "]";
      }
   }
}

