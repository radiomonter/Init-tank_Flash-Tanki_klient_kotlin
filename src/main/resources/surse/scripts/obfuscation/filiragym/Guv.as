package obfuscation.filiragym
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.description.DescriptionModelCC;
   
   public class Guv implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var pulus:ICodec;
      
      private var zemebajo:ICodec;
      
      public function Guv()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.pulus = _arg_1.getCodec(new TypeCodecInfo(String,true));
         this.zemebajo = _arg_1.getCodec(new TypeCodecInfo(String,true));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:DescriptionModelCC = new DescriptionModelCC();
         _local_2.description = this.pulus.decode(_arg_1) as String;
         _local_2.name = this.zemebajo.decode(_arg_1) as String;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:DescriptionModelCC = DescriptionModelCC(_arg_2);
         this.pulus.encode(_arg_1,_local_3.description);
         this.zemebajo.encode(_arg_1,_local_3.name);
      }
   }
}

