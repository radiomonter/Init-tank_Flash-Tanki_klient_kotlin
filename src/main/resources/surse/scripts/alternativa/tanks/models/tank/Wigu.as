package alternativa.tanks.models.tank
{
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidator;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Wigu implements AutoClosable
   {
      
      [Inject]
      public static var pypiw:DataValidator;
      
      private var kase:DataUnitValidator;
      
      public function Wigu(_arg_1:DataUnitValidator)
      {
         super();
         this.kase = _arg_1;
         pypiw.addValidator(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         pypiw.removeValidator(this.kase);
         this.kase = null;
      }
   }
}

