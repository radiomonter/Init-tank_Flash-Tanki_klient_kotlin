package obfuscation.faleriwo
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.socialnetwork.models.socialnetworkparameters.SocialNetworkParametersCC;
   
   public class Falovo implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var pocod:ICodec;
      
      private var fehagyju:ICodec;
      
      public function Falovo()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.pocod = _arg_1.getCodec(new TypeCodecInfo(Boolean,false));
         this.fehagyju = _arg_1.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:SocialNetworkParametersCC = new SocialNetworkParametersCC();
         _local_2.hasOwnPaymentSystem = this.pocod.decode(_arg_1) as Boolean;
         _local_2.hasSocialFunction = this.fehagyju.decode(_arg_1) as Boolean;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:SocialNetworkParametersCC = SocialNetworkParametersCC(_arg_2);
         this.pocod.encode(_arg_1,_local_3.hasOwnPaymentSystem);
         this.fehagyju.encode(_arg_1,_local_3.hasSocialFunction);
      }
   }
}

