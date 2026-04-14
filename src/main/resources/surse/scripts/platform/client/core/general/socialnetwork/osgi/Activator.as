package platform.client.core.general.socialnetwork.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.EnumCodecInfo;
   import alternativa.protocol.info.MapCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import obfuscation.faleriwo.Falovo;
   import obfuscation.faleriwo.Semuly;
   import obfuscation.hapog.Gibyzozik;
   import obfuscation.hapog.Lahuwo;
   import obfuscation.hapog.Noduqiqaz;
   import obfuscation.hapog.Tosyn;
   import obfuscation.vadukamu.Pareduta;
   import platform.client.core.general.socialnetwork.models.socialnetworkparameters.SocialNetworkParametersCC;
   import platform.client.core.general.socialnetwork.types.Gender;
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   
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
         _local_2 = new Falovo();
         _local_3.registerCodec(new TypeCodecInfo(SocialNetworkParametersCC,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(SocialNetworkParametersCC,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Noduqiqaz();
         _local_3.registerCodec(new EnumCodecInfo(Gender,false),_local_2);
         _local_3.registerCodec(new EnumCodecInfo(Gender,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Gibyzozik();
         _local_3.registerCodec(new TypeCodecInfo(LoginParameters,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(LoginParameters,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Pareduta(false,false);
         _local_3.registerCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),false),_local_2);
         _local_3.registerCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Semuly(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Semuly(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Tosyn(false);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Tosyn(true);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Lahuwo(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Lahuwo(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,true),true,1),new OptionalCodecDecorator(_local_2));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

