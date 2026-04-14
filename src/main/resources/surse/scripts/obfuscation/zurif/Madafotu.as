package obfuscation.zurif
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   
   public class Madafotu implements ICodec
   {
      
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var qunyduhuh:ICodec;
      
      private var watod:ICodec;
      
      private var nypofuji:ICodec;
      
      private var haraj:ICodec;
      
      public function Madafotu()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.qunyduhuh = _arg_1.getCodec(new TypeCodecInfo(Boolean,false));
         this.watod = _arg_1.getCodec(new TypeCodecInfo(Boolean,false));
         this.nypofuji = _arg_1.getCodec(new TypeCodecInfo(int,false));
         this.haraj = _arg_1.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:TimePeriodModelCC = new TimePeriodModelCC();
         _local_2.isEnabled = this.qunyduhuh.decode(_arg_1) as Boolean;
         _local_2.isTimeless = this.watod.decode(_arg_1) as Boolean;
         _local_2.timeLeftInSeconds = this.nypofuji.decode(_arg_1) as int;
         _local_2.timeToStartInSeconds = this.haraj.decode(_arg_1) as int;
         return _local_2;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_3:TimePeriodModelCC = TimePeriodModelCC(_arg_2);
         this.qunyduhuh.encode(_arg_1,_local_3.isEnabled);
         this.watod.encode(_arg_1,_local_3.isTimeless);
         this.nypofuji.encode(_arg_1,_local_3.timeLeftInSeconds);
         this.haraj.encode(_arg_1,_local_3.timeToStartInSeconds);
      }
   }
}

