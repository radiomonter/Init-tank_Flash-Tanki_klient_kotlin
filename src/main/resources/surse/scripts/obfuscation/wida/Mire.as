package obfuscation.wida
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   
   public class Mire implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var wekewewo:ICodec;
      
      private var kerudile:ICodec;
      
      public function Mire()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.wekewewo = _arg_1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),false,1));
         this.kerudile = _arg_1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),false,1));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:LocalizedFileFormat = new LocalizedFileFormat();
         _local_2.images = this.wekewewo.decode(_arg_1) as Vector.<ImagePair>;
         _local_2.strings = this.kerudile.decode(_arg_1) as Vector.<StringPair>;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:LocalizedFileFormat = LocalizedFileFormat(_arg_2);
         this.wekewewo.encode(_arg_1,_local_3.images);
         this.kerudile.encode(_arg_1,_local_3.strings);
      }
   }
}

