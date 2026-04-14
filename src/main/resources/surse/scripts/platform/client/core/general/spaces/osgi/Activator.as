package platform.client.core.general.spaces.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import obfuscation.fiw.Cojypu;
   import obfuscation.fiw.Hyraloziv;
   import obfuscation.nibofog.Buj;
   import obfuscation.nibofog.Cuhar;
   import obfuscation.nibofog.Fydagaje;
   import obfuscation.nibofog.Mohymy;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsData;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   import platform.client.fp10.core.registry.ModelRegistry;
   
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
         var _local_3:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _local_3.register(Long.getLong(191355032,163351191),Long.getLong(748816660,1488436371));
         _local_3.register(Long.getLong(191355032,163351191),Long.getLong(1779039460,1862164506));
         _local_3.register(Long.getLong(191355032,163351191),Long.getLong(2104499555,54326167));
         var _local_4:IProtocol = IProtocol(osgi.getService(IProtocol));
         _local_2 = new Fydagaje();
         _local_4.registerCodec(new TypeCodecInfo(ObjectsData,false),_local_2);
         _local_4.registerCodec(new TypeCodecInfo(ObjectsData,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Buj();
         _local_4.registerCodec(new TypeCodecInfo(ObjectsDependencies,false),_local_2);
         _local_4.registerCodec(new TypeCodecInfo(ObjectsDependencies,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Hyraloziv();
         _local_4.registerCodec(new TypeCodecInfo(ModelData,false),_local_2);
         _local_4.registerCodec(new TypeCodecInfo(ModelData,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Cuhar(false);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,false),false,1),_local_2);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Cuhar(true);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,true),false,1),_local_2);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Mohymy(false);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,false),false,1),_local_2);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Mohymy(true);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,true),false,1),_local_2);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Cojypu(false);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),false,1),_local_2);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Cojypu(true);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,true),false,1),_local_2);
         _local_4.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,true),true,1),new OptionalCodecDecorator(_local_2));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

