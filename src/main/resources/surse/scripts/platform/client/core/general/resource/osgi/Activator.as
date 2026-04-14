package platform.client.core.general.resource.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import obfuscation.syfy.Katito;
   import obfuscation.syfy.Nideh;
   import platform.core.general.resource.types.imageframe.ResourceImageFrameParams;
   
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
         _local_2 = new Nideh();
         _local_3.registerCodec(new TypeCodecInfo(ResourceImageFrameParams,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(ResourceImageFrameParams,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Katito(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Katito(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,true),true,1),new OptionalCodecDecorator(_local_2));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

