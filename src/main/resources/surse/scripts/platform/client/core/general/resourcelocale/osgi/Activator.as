package platform.client.core.general.resourcelocale.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import obfuscation.wida.Cejihavuk;
   import obfuscation.wida.Ceqa;
   import obfuscation.wida.Fiqicunu;
   import obfuscation.wida.Fyfa;
   import obfuscation.wida.Lenijyqa;
   import obfuscation.wida.Mire;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(_arg_1:OSGi) : void
      {
         var _local_2:ICodec = null;
         osgi = _arg_1;
         var _local_3:IProtocol = IProtocol(osgi.getService(IProtocol));
         _local_2 = new Cejihavuk();
         _local_3.registerCodec(new TypeCodecInfo(ImagePair,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(ImagePair,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Mire();
         _local_3.registerCodec(new TypeCodecInfo(LocalizedFileFormat,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(LocalizedFileFormat,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Lenijyqa();
         _local_3.registerCodec(new TypeCodecInfo(StringPair,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(StringPair,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Ceqa(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Ceqa(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Fyfa(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Fyfa(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Fiqicunu(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Fiqicunu(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,true),true,1),new OptionalCodecDecorator(_local_2));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

