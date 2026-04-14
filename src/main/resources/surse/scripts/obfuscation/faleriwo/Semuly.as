package obfuscation.faleriwo
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.LengthCodecHelper;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.socialnetwork.models.socialnetworkparameters.SocialNetworkParametersCC;
   
   public class Semuly implements ICodec
   {
      
      private var elementCodec:ICodec;
      
      private var syrerehyh:Boolean;
      
      public function Semuly(_arg_1:Boolean)
      {
         super();
         this.syrerehyh = _arg_1;
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.elementCodec = _arg_1.getCodec(new TypeCodecInfo(SocialNetworkParametersCC,false));
         if(this.syrerehyh)
         {
            this.elementCodec = new OptionalCodecDecorator(this.elementCodec);
         }
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_4:int = 0;
         var _local_2:int = LengthCodecHelper.decodeLength(_arg_1);
         var _local_3:Vector.<SocialNetworkParametersCC> = new Vector.<SocialNetworkParametersCC>(_local_2,true);
         while(_local_4 < _local_2)
         {
            _local_3[_local_4] = SocialNetworkParametersCC(this.elementCodec.decode(_arg_1));
            _local_4++;
         }
         return _local_3;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_3:SocialNetworkParametersCC = null;
         var _local_6:int = 0;
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_4:Vector.<SocialNetworkParametersCC> = Vector.<SocialNetworkParametersCC>(_arg_2);
         var _local_5:int = int(_local_4.length);
         LengthCodecHelper.encodeLength(_arg_1,_local_5);
         while(_local_6 < _local_5)
         {
            this.elementCodec.encode(_arg_1,_local_4[_local_6]);
            _local_6++;
         }
      }
   }
}

