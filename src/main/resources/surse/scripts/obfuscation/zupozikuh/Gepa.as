package obfuscation.zupozikuh
{
   internal class Gepa implements Covofuk
   {
      
      private var wymot:int;
      
      private var hiwu:int;
      
      public function Gepa(_arg_1:int)
      {
         super();
         this.wymot = _arg_1;
      }
      
      public function init() : void
      {
         this.hiwu = this.wymot;
      }
      
      public function update(_arg_1:int) : Boolean
      {
         if(this.hiwu <= 0)
         {
            return false;
         }
         this.hiwu -= _arg_1;
         return true;
      }
      
      public function foriz(_arg_1:int) : void
      {
         this.wymot = _arg_1;
      }
   }
}

