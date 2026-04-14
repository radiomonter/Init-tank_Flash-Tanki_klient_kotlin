package obfuscation.fiw
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   
   public class Hyraloziv implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var visem:ICodec;
      
      private var gecis:ICodec;
      
      public function Hyraloziv()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.visem = _arg_1.getCodec(new TypeCodecInfo(Object,false));
         this.gecis = _arg_1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:ModelData = new ModelData();
         _local_2.data = this.visem.decode(_arg_1) as Object;
         _local_2.id = this.gecis.decode(_arg_1) as Long;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:ModelData = ModelData(_arg_2);
         this.visem.encode(_arg_1,_local_3.data);
         this.gecis.encode(_arg_1,_local_3.id);
      }
   }
}

