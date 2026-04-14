package alternativa.tanks.models.weapon
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class ConicAreaData
   {
      
      private var coneAngle:EncryptedNumber;
      
      private var range:EncryptedNumber;
      
      public function ConicAreaData(_arg_1:Number, _arg_2:Number)
      {
         super();
         this.coneAngle = new EncryptedNumberImpl(_arg_1);
         this.range = new EncryptedNumberImpl(_arg_2);
      }
      
      public function riv() : Number
      {
         return this.coneAngle.getNumber();
      }
      
      public function fediri() : Number
      {
         return this.range.getNumber();
      }
   }
}

