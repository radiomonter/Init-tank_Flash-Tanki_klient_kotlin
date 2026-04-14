package obfuscation.hapog
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.MapCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import flash.utils.Dictionary;
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   
   public class Gibyzozik implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var sowacifah:ICodec;
      
      public function Gibyzozik()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.sowacifah = _arg_1.getCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:LoginParameters = new LoginParameters();
         _local_2.parameters = this.sowacifah.decode(_arg_1) as Dictionary;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:LoginParameters = LoginParameters(_arg_2);
         this.sowacifah.encode(_arg_1,_local_3.parameters);
      }
   }
}

