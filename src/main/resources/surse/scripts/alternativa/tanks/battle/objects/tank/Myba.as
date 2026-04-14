package alternativa.tanks.battle.objects.tank
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Myba implements Cokunuf
   {
      
      private var currentValue:EncryptedNumber;
      
      private var duwy:EncryptedNumber;
      
      private var dudecy:Number;
      
      private var dywykowe:Number;
      
      public function Myba(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.dudecy = _arg_1;
         this.dywykowe = _arg_2;
         this.duwy = new EncryptedNumberImpl(_arg_3);
         this.currentValue = new EncryptedNumberImpl(_arg_4);
      }
      
      public function reset(_arg_1:Number) : void
      {
         this.currentValue.setNumber(_arg_1);
         this.duwy.setNumber(_arg_1);
      }
      
      public function update(_arg_1:Number) : Number
      {
         var _local_2:Number = this.currentValue.getNumber();
         var _local_3:Number = this.duwy.getNumber();
         if(_local_2 < _local_3)
         {
            _local_2 += this.dudecy * _arg_1;
            if(_local_2 > _local_3)
            {
               _local_2 = _local_3;
            }
         }
         else if(_local_2 > _local_3)
         {
            _local_2 -= this.dywykowe * _arg_1;
            if(_local_2 < _local_3)
            {
               _local_2 = _local_3;
            }
         }
         this.currentValue.setNumber(_local_2);
         return _local_2;
      }
      
      public function ravik(_arg_1:Number) : void
      {
         this.duwy.setNumber(_arg_1);
      }
      
      public function vur() : Number
      {
         return this.duwy.getNumber();
      }
   }
}

