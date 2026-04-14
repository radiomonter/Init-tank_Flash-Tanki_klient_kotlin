package obfuscation.lyguh
{
   import obfuscation.kofen.Vector3d;
   
   public class Codyw
   {
      
      private var hylebo:Boolean;
      
      private var nema:String;
      
      private var zin:String;
      
      private var _position:Vector3d;
      
      public function Codyw(_arg_1:Boolean = false, _arg_2:String = null, _arg_3:String = null, _arg_4:Vector3d = null)
      {
         super();
         this.hylebo = _arg_1;
         this.nema = _arg_2;
         this.zin = _arg_3;
         this._position = _arg_4;
      }
      
      public function get activated() : Boolean
      {
         return this.hylebo;
      }
      
      public function set activated(_arg_1:Boolean) : void
      {
         this.hylebo = _arg_1;
      }
      
      public function get mineId() : String
      {
         return this.nema;
      }
      
      public function set mineId(_arg_1:String) : void
      {
         this.nema = _arg_1;
      }
      
      public function get ownerId() : String
      {
         return this.zin;
      }
      
      public function set ownerId(_arg_1:String) : void
      {
         this.zin = _arg_1;
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
         var _local_1:* = "BattleMine [";
         _local_1 += "activated = " + this.activated + " ";
         _local_1 += "mineId = " + this.mineId + " ";
         _local_1 += "ownerId = " + this.ownerId + " ";
         _local_1 += "position = " + this.position + " ";
         return _local_1 + "]";
      }
   }
}

