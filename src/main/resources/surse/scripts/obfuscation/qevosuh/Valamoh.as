package obfuscation.qevosuh
{
   public class Valamoh
   {
      
      private var lukuqote:Vector.<Cuge>;
      
      public function Valamoh(_arg_1:Vector.<Cuge> = null)
      {
         super();
         this.lukuqote = _arg_1;
      }
      
      public function get effects() : Vector.<Cuge>
      {
         return this.lukuqote;
      }
      
      public function set effects(_arg_1:Vector.<Cuge>) : void
      {
         this.lukuqote = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "LightingSFXModelCC [";
         _local_1 += "effects = " + this.effects + " ";
         return _local_1 + "]";
      }
   }
}

