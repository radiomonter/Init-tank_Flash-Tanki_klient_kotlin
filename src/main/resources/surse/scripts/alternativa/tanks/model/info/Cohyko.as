package alternativa.tanks.model.info
{
   import alternativa.types.Long;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   
   public class Cohyko
   {
      
      [Inject]
      public static var addressService:AddressService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public function Cohyko()
      {
         super();
      }
      
      public static function wefyzonyk() : String
      {
         return "";
      }
      
      public static function kejuhaty(_arg_1:Long) : String
      {
         return intToUhex(_arg_1.high) + intToUhex(_arg_1.low);
      }
      
      private static function intToUhex(_arg_1:int) : String
      {
         var _local_2:String = null;
         var _local_3:uint = 0;
         if(_arg_1 >= 0)
         {
            _local_2 = _arg_1.toString(16);
         }
         else
         {
            _local_3 = uint(_arg_1 & ~2147483648 | 0x80000000);
            _local_2 = _local_3.toString(16);
         }
         var _local_4:int = 8 - _local_2.length;
         while(_local_4 > 0)
         {
            _local_2 = "0" + _local_2;
            _local_4--;
         }
         return _local_2;
      }
   }
}

