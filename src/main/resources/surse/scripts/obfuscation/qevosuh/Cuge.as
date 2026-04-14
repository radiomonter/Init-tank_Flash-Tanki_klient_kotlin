package obfuscation.qevosuh
{
   public class Cuge
   {
      
      private var _name:String;
      
      private var tucihoz:Vector.<Coce>;
      
      public function Cuge(_arg_1:String = null, _arg_2:Vector.<Coce> = null)
      {
         super();
         this._name = _arg_1;
         this.tucihoz = _arg_2;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get duzym() : Vector.<Coce>
      {
         return this.tucihoz;
      }
      
      public function set duzym(_arg_1:Vector.<Coce>) : void
      {
         this.tucihoz = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "LightingEfect [";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "records = " + this.duzym + " ";
         return _local_1 + "]";
      }
   }
}

