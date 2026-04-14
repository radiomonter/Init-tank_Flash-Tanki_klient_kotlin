package obfuscation.hapog
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import platform.client.core.general.socialnetwork.types.Gender;
   
   public class Noduqiqaz implements ICodec
   {
      
      public function Noduqiqaz()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:Gender = null;
         var _local_3:int = _arg_1.reader.readInt();
         switch(_local_3)
         {
            case 0:
               _local_2 = Gender.MALE;
               break;
            case 1:
               _local_2 = Gender.FEMALE;
               break;
            case 2:
               _local_2 = Gender.NONE;
         }
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:int = int(_arg_2.value);
         _arg_1.writer.writeInt(_local_3);
      }
   }
}

