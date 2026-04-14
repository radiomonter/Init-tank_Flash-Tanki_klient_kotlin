package obfuscation.fymimywi
{
   import obfuscation.kumopurut.Sohezit;
   import obfuscation.pawikoz.Fojuhe;
   import obfuscation.pawikoz.Tyryhu;
   
   public class Nofir extends Tyryhu
   {
      
      public var daly:int = 10;
      
      public function Nofir()
      {
         super();
         bosevo = 6;
      }
      
      public function addLine(_arg_1:Fojuhe) : void
      {
         var _local_2:Fojuhe = null;
         feramul(_arg_1);
         if(container.numChildren > this.daly)
         {
            _local_2 = rac();
            if(_local_2 != null)
            {
               _local_2.removeEventListener(Sohezit.nasun,this.cywasu);
               _local_2.removeEventListener(Sohezit.nepih,this.updateUid);
            }
         }
         _arg_1.addEventListener(Sohezit.nasun,this.cywasu);
         _arg_1.addEventListener(Sohezit.nepih,this.updateUid);
         _arg_1.x = -_arg_1.width - 10;
      }
      
      private function cywasu(_arg_1:Sohezit) : void
      {
         if(container.contains(_arg_1.line))
         {
            rac();
         }
         _arg_1.line.removeEventListener(Sohezit.nasun,this.cywasu);
      }
      
      private function updateUid(_arg_1:Sohezit) : void
      {
         var _local_2:Fojuhe = _arg_1.line;
         _local_2.x = -_local_2.width - 10;
         _local_2.removeEventListener(Sohezit.nepih,this.cywasu);
      }
   }
}

