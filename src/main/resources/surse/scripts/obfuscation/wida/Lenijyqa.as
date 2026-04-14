package obfuscation.wida
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.StringPair;
   
   public class Lenijyqa implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var bahury:ICodec;
      
      private var diricuvuk:ICodec;
      
      public function Lenijyqa()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.bahury = _arg_1.getCodec(new TypeCodecInfo(String,false));
         this.diricuvuk = _arg_1.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:StringPair = new StringPair();
         _local_2.key = this.bahury.decode(_arg_1) as String;
         _local_2.value = this.diricuvuk.decode(_arg_1) as String;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:StringPair = StringPair(_arg_2);
         this.bahury.encode(_arg_1,_local_3.key);
         this.diricuvuk.encode(_arg_1,_local_3.value);
      }
   }
}

