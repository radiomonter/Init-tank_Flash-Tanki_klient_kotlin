package platform.loading.codecs
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ModelDataCodec implements ICodec
   {
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      private var longCodec:ICodec;
      
      public function ModelDataCodec()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.longCodec = _arg_1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:Object = null;
         var _local_3:Long = Long(this.longCodec.decode(_arg_1));
         if(_local_3.low == 0 && _local_3.high == 0)
         {
            return new ModelData(this.longCodec.decode(_arg_1),_local_3);
         }
         var _local_4:ICodec = modelRegister.getModelConstructorCodec(_local_3);
         if(_local_4 == null)
         {
            throw new Error("Constructor codec not found for model " + _local_3);
         }
         _local_2 = _local_4.decode(_arg_1);
         return new ModelData(_local_2,_local_3);
      }
   }
}

