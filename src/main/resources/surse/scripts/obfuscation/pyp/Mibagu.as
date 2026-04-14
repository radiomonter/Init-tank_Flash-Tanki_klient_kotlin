package obfuscation.pyp
{
   public class Mibagu
   {
      
      private var lekoge:Boolean;
      
      public function Mibagu(_arg_1:Boolean = false)
      {
         super();
         this.lekoge = _arg_1;
      }
      
      public function get hetosaz() : Boolean
      {
         return this.lekoge;
      }
      
      public function set hetosaz(_arg_1:Boolean) : void
      {
         this.lekoge = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ClientStoredSettings [";
         _local_1 += "showDamageEnabled = " + this.hetosaz + " ";
         return _local_1 + "]";
      }
   }
}

