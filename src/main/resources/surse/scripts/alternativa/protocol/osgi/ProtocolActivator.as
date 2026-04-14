package alternativa.protocol.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.primitive.ByteCodec;
   import alternativa.protocol.codec.primitive.DoubleCodec;
   import alternativa.protocol.codec.primitive.FloatCodec;
   import alternativa.protocol.codec.primitive.IntCodec;
   import alternativa.protocol.codec.primitive.LongCodec;
   import alternativa.protocol.codec.primitive.ShortCodec;
   import alternativa.protocol.codec.primitive.UByteCodec;
   import alternativa.protocol.codec.primitive.UIntCodec;
   import alternativa.protocol.codec.primitive.UShortCodec;
   import alternativa.protocol.impl.Protocol;
   import alternativa.types.Byte;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import alternativa.types.Short;
   import alternativa.types.UByte;
   import alternativa.types.UShort;
   
   public class ProtocolActivator implements IBundleActivator
   {
      
      public function ProtocolActivator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_2:IProtocol = Protocol.defaultInstance;
         _arg_1.registerService(IProtocol,_local_2);
         _local_2.registerCodecForType(Byte,new ByteCodec());
         _local_2.registerCodecForType(Float,new FloatCodec());
         _local_2.registerCodecForType(Long,new LongCodec());
         _local_2.registerCodecForType(Short,new ShortCodec());
         _local_2.registerCodecForType(UByte,new UByteCodec());
         _local_2.registerCodecForType(UShort,new UShortCodec());
         _local_2.registerCodecForType(uint,new UIntCodec());
         _local_2.registerCodecForType(int,new IntCodec());
         _local_2.registerCodecForType(Number,new DoubleCodec());
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

