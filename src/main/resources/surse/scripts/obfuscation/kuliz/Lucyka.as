package obfuscation.kuliz
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class Lucyka implements ICodec
   {
      
      public function Lucyka()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:ValidationStatus = null;
         var _local_3:int = _arg_1.reader.readInt();
         switch(_local_3)
         {
            case 0:
               _local_2 = ValidationStatus.TOO_SHORT;
               break;
            case 1:
               _local_2 = ValidationStatus.TOO_LONG;
               break;
            case 2:
               _local_2 = ValidationStatus.NOT_UNIQUE;
               break;
            case 3:
               _local_2 = ValidationStatus.NOT_MATCH_PATTERN;
               break;
            case 4:
               _local_2 = ValidationStatus.FORBIDDEN;
               break;
            case 5:
               _local_2 = ValidationStatus.CORRECT;
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

