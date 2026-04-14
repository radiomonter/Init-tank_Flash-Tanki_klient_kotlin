package obfuscation.nibofog
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.fp10.core.resource.Resource;
   
   public class Buj implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var gakijake:ICodec;
      
      private var mazabovo:ICodec;
      
      public function Buj()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.gakijake = _arg_1.getCodec(new TypeCodecInfo(int,false));
         this.mazabovo = _arg_1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Resource,false),false,1));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:ObjectsDependencies = new ObjectsDependencies();
         _local_2.callbackId = this.gakijake.decode(_arg_1) as int;
         _local_2.resources = this.mazabovo.decode(_arg_1) as Vector.<Resource>;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:ObjectsDependencies = ObjectsDependencies(_arg_2);
         this.gakijake.encode(_arg_1,_local_3.callbackId);
         this.mazabovo.encode(_arg_1,_local_3.resources);
      }
   }
}

