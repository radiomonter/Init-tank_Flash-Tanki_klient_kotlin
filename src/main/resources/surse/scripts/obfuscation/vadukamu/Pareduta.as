package obfuscation.vadukamu
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.LengthCodecHelper;
   import alternativa.protocol.info.TypeCodecInfo;
   import flash.utils.Dictionary;
   
   public class Pareduta implements ICodec
   {
      
      private var keyCodec:ICodec;
      
      private var valueCodec:ICodec;
      
      private var wihur:Boolean;
      
      private var tolym:Boolean;
      
      public function Pareduta(_arg_1:Boolean, _arg_2:Boolean)
      {
         super();
         this.wihur = _arg_1;
         this.tolym = _arg_2;
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.keyCodec = _arg_1.getCodec(new TypeCodecInfo(String,false));
         if(this.wihur)
         {
            this.keyCodec = new OptionalCodecDecorator(this.keyCodec);
         }
         this.valueCodec = _arg_1.getCodec(new TypeCodecInfo(String,false));
         if(this.tolym)
         {
            this.valueCodec = new OptionalCodecDecorator(this.valueCodec);
         }
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_4:int = 0;
         var _local_2:int = LengthCodecHelper.decodeLength(_arg_1);
         var _local_3:Dictionary = new Dictionary();
         while(_local_4 < _local_2)
         {
            _local_3[this.keyCodec.decode(_arg_1)] = this.valueCodec.decode(_arg_1);
            _local_4++;
         }
         return _local_3;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_5:int = 0;
         var _local_3:* = undefined;
         if(_arg_2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _local_4:Dictionary = Dictionary(_arg_2);
         for(_local_3 in _local_4)
         {
            _local_5++;
         }
         LengthCodecHelper.encodeLength(_arg_1,_local_5);
         for(_local_3 in _local_4)
         {
            this.keyCodec.encode(_arg_1,_local_3);
            this.valueCodec.encode(_arg_1,_local_4[_local_3]);
         }
      }
   }
}

