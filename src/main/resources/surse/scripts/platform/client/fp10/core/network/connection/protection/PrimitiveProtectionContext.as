package platform.client.fp10.core.network.connection.protection
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import platform.client.fp10.core.network.connection.IProtectionContext;
   
   public class PrimitiveProtectionContext implements IProtectionContext
   {
      
      public static const INSTANCE:PrimitiveProtectionContext = new PrimitiveProtectionContext();
      
      public function PrimitiveProtectionContext()
      {
         super();
      }
      
      public function wrap(_arg_1:IDataOutput, _arg_2:ByteArray) : void
      {
         _arg_1.writeBytes(_arg_2,_arg_2.position);
      }
      
      public function unwrap(_arg_1:ByteArray, _arg_2:IDataInput) : void
      {
         _arg_2.readBytes(_arg_1,_arg_1.position);
      }
      
      public function reset() : void
      {
      }
   }
}

