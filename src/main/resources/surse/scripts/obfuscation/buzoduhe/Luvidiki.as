package obfuscation.buzoduhe
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Luvidiki
   {
      
      private var tesuf:EncryptedNumber;
      
      private var zawubaqy:EncryptedNumber;
      
      private var minSplashDamagePercent:EncryptedNumber;
      
      private var ked:EncryptedNumber;
      
      public function Luvidiki(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.tesuf = new EncryptedNumberImpl(_arg_1);
         this.zawubaqy = new EncryptedNumberImpl(_arg_2);
         this.minSplashDamagePercent = new EncryptedNumberImpl(_arg_3);
         this.ked = new EncryptedNumberImpl(_arg_4);
      }
      
      public function wozoj() : Number
      {
         return this.zawubaqy.getNumber();
      }
      
      public function rokakop(_arg_1:Number) : Number
      {
         return this.ked.getNumber() * this.bemum(_arg_1);
      }
      
      private function bemum(_arg_1:Number) : Number
      {
         var _local_2:Number = this.tesuf.getNumber();
         var _local_3:Number = this.zawubaqy.getNumber();
         var _local_4:Number = this.minSplashDamagePercent.getNumber();
         if(_arg_1 < _local_2)
         {
            return 1;
         }
         if(_arg_1 > _local_3)
         {
            return 0.1 * _local_4;
         }
         return 0.01 * (_local_4 + (_local_3 - _arg_1) * (100 - _local_4) / (_local_3 - _local_2));
      }
   }
}

