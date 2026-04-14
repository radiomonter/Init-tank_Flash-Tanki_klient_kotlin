package obfuscation.nibofog
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsData;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Fydagaje implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var byhet:ICodec;
      
      private var ker:ICodec;
      
      public function Fydagaje()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.byhet = _arg_1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),false,1));
         this.ker = _arg_1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(IGameObject,false),false,1));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:ObjectsData = new ObjectsData();
         _local_2.modelsData = this.byhet.decode(_arg_1) as Vector.<ModelData>;
         _local_2.objects = this.ker.decode(_arg_1) as Vector.<IGameObject>;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:ObjectsData = ObjectsData(_arg_2);
         this.byhet.encode(_arg_1,_local_3.modelsData);
         this.ker.encode(_arg_1,_local_3.objects);
      }
   }
}

