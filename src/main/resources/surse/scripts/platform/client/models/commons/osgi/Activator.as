package platform.client.models.commons.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.EnumCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import obfuscation.filiragym.Cabevini;
   import obfuscation.filiragym.Guv;
   import obfuscation.kuliz.Fafoseda;
   import obfuscation.kuliz.Lagivap;
   import obfuscation.kuliz.Lucyka;
   import obfuscation.kuliz.Riwizas;
   import obfuscation.zurif.Madafotu;
   import obfuscation.zurif.Wecumaco;
   import platform.client.models.commons.description.DescriptionModelCC;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   import platform.client.models.commons.types.Timestamp;
   import platform.client.models.commons.types.ValidationStatus;
   
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
         _local_2 = new Guv();
         _local_3.registerCodec(new TypeCodecInfo(DescriptionModelCC,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(DescriptionModelCC,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Madafotu();
         _local_3.registerCodec(new TypeCodecInfo(TimePeriodModelCC,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(TimePeriodModelCC,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Lagivap();
         _local_3.registerCodec(new TypeCodecInfo(Timestamp,false),_local_2);
         _local_3.registerCodec(new TypeCodecInfo(Timestamp,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Lucyka();
         _local_3.registerCodec(new EnumCodecInfo(ValidationStatus,false),_local_2);
         _local_3.registerCodec(new EnumCodecInfo(ValidationStatus,true),new OptionalCodecDecorator(_local_2));
         _local_2 = new Cabevini(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Cabevini(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Wecumaco(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Wecumaco(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Fafoseda(false);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Fafoseda(true);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,true),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Riwizas(false);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,false),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,false),true,1),new OptionalCodecDecorator(_local_2));
         _local_2 = new Riwizas(true);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,true),false,1),_local_2);
         _local_3.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,true),true,1),new OptionalCodecDecorator(_local_2));
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

