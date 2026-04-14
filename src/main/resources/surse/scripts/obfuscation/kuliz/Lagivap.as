package obfuscation.kuliz
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Byte;
   import alternativa.types.Short;
   import platform.client.models.commons.types.Timestamp;
   
   public class Lagivap implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var huzebukuk:ICodec;
      
      private var dibujop:ICodec;
      
      private var mig:ICodec;
      
      private var tybahuqid:ICodec;
      
      private var vuraqyg:ICodec;
      
      private var sypidej:ICodec;
      
      public function Lagivap()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.huzebukuk = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         this.dibujop = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         this.mig = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         this.tybahuqid = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         this.vuraqyg = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         this.sypidej = _arg_1.getCodec(new TypeCodecInfo(Short,false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:Timestamp = new Timestamp();
         _local_2.day = this.huzebukuk.decode(_arg_1) as int;
         _local_2.hours = this.dibujop.decode(_arg_1) as int;
         _local_2.minutes = this.mig.decode(_arg_1) as int;
         _local_2.month = this.tybahuqid.decode(_arg_1) as int;
         _local_2.seconds = this.vuraqyg.decode(_arg_1) as int;
         _local_2.year = this.sypidej.decode(_arg_1) as int;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:Timestamp = Timestamp(_arg_2);
         this.huzebukuk.encode(_arg_1,_local_3.day);
         this.dibujop.encode(_arg_1,_local_3.hours);
         this.mig.encode(_arg_1,_local_3.minutes);
         this.tybahuqid.encode(_arg_1,_local_3.month);
         this.vuraqyg.encode(_arg_1,_local_3.seconds);
         this.sypidej.encode(_arg_1,_local_3.year);
      }
   }
}

