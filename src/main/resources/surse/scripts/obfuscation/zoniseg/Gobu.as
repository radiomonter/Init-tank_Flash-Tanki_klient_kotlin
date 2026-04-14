package obfuscation.zoniseg
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Gobu
   {
      
      private var ferolohet:EncryptedInt;
      
      private var weakeningCoeff:EncryptedNumber;
      
      public function Gobu(_arg_1:int, _arg_2:Number)
      {
         super();
         this.ferolohet = new EncryptedIntImpl(_arg_1);
         this.weakeningCoeff = new EncryptedNumberImpl(_arg_2);
      }
      
      public function fojym() : int
      {
         return this.ferolohet.getInt();
      }
      
      public function levicedu() : Number
      {
         return this.weakeningCoeff.getNumber();
      }
   }
}

