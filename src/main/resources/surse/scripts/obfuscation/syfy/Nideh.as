package obfuscation.syfy
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Float;
   import alternativa.types.Short;
   import platform.core.general.resource.types.imageframe.ResourceImageFrameParams;
   
   public class Nideh implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var zokolekoz:ICodec;
      
      private var cemy:ICodec;
      
      private var wizy:ICodec;
      
      private var mezek:ICodec;
      
      public function Nideh()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.zokolekoz = _arg_1.getCodec(new TypeCodecInfo(Float,false));
         this.cemy = _arg_1.getCodec(new TypeCodecInfo(int,false));
         this.wizy = _arg_1.getCodec(new TypeCodecInfo(int,false));
         this.mezek = _arg_1.getCodec(new TypeCodecInfo(Short,false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:ResourceImageFrameParams = new ResourceImageFrameParams();
         _local_2.fps = this.zokolekoz.decode(_arg_1) as Number;
         _local_2.frameHeight = this.cemy.decode(_arg_1) as int;
         _local_2.frameWidth = this.wizy.decode(_arg_1) as int;
         _local_2.numFrames = this.mezek.decode(_arg_1) as int;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:ResourceImageFrameParams = ResourceImageFrameParams(_arg_2);
         this.zokolekoz.encode(_arg_1,_local_3.fps);
         this.cemy.encode(_arg_1,_local_3.frameHeight);
         this.wizy.encode(_arg_1,_local_3.frameWidth);
         this.mezek.encode(_arg_1,_local_3.numFrames);
      }
   }
}

