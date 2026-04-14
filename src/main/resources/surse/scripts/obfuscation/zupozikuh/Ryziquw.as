package obfuscation.zupozikuh
{
   internal class Ryziquw implements Covofuk
   {
      
      private var message:Jecyvedu;
      
      private var bypa:int;
      
      private var hiwu:int;
      
      private var sijozazyw:Number;
      
      private var qohucug:Number;
      
      private var hejy:Number;
      
      public function Ryziquw(_arg_1:Jecyvedu, _arg_2:int, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.message = _arg_1;
         this.bypa = _arg_2;
         this.sijozazyw = _arg_3;
         this.qohucug = _arg_4;
         this.hejy = _arg_4 - _arg_3;
      }
      
      public function init() : void
      {
         this.message.setAlpha(this.sijozazyw);
         this.hiwu = this.bypa;
      }
      
      public function update(_arg_1:int) : Boolean
      {
         if(this.hiwu <= 0)
         {
            return false;
         }
         this.hiwu -= _arg_1;
         if(this.hiwu < 0)
         {
            this.hiwu = 0;
         }
         this.message.setAlpha(this.qohucug - this.hejy * this.hiwu / this.bypa);
         return true;
      }
      
      public function foriz(_arg_1:int) : void
      {
         this.bypa = _arg_1;
      }
   }
}

