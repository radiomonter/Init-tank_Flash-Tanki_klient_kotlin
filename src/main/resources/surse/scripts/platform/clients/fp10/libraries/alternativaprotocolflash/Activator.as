package platform.clients.fp10.libraries.alternativaprotocolflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.Protocol;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Byte;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import alternativa.types.Short;
   import alternativa.types.UByte;
   import alternativa.types.UShort;
   import obfuscation.nadan.Cuponepyk;
   import obfuscation.nadan.Holako;
   import obfuscation.zopycenaz.Cuponepyk;
   import obfuscation.zopycenaz.Gupy;
   import obfuscation.zopycenaz.Holako;
   import obfuscation.zopycenaz.Jup;
   import obfuscation.zopycenaz.Toj;
   import obfuscation.zopycenaz.Tyqusaty;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var codec:ICodec = null;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         var protocol:IProtocol = Protocol.defaultInstance;
         codec = new Tyqusaty(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Tyqusaty(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,true),true,1),new OptionalCodecDecorator(codec));
         codec = new Jup(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Jup(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,true),true,1),new OptionalCodecDecorator(codec));
         codec = new Toj(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Toj(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,true),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.zopycenaz.Holako(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.zopycenaz.Holako(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,true),true,1),new OptionalCodecDecorator(codec));
         codec = new Gupy(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,false),true,1),new OptionalCodecDecorator(codec));
         codec = new Gupy(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,true),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.zopycenaz.Cuponepyk(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,false),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.zopycenaz.Cuponepyk(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,true),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.nadan.Holako(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,false),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.nadan.Holako(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,true),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.nadan.Cuponepyk(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,false),true,1),new OptionalCodecDecorator(codec));
         codec = new obfuscation.nadan.Cuponepyk(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,true),true,1),new OptionalCodecDecorator(codec));
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            Protocol.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return Protocol.clientLog;
         });
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

