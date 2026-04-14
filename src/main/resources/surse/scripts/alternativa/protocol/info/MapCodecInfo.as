package alternativa.protocol.info
{
   import alternativa.protocol.ICodecInfo;
   
   public class MapCodecInfo extends CodecInfo
   {
      
      private var _keyCodec:ICodecInfo;
      
      private var _valueCodec:ICodecInfo;
      
      public function MapCodecInfo(_arg_1:ICodecInfo, _arg_2:ICodecInfo, _arg_3:Boolean)
      {
         super(_arg_3);
         this._keyCodec = _arg_1;
         this._valueCodec = _arg_2;
      }
      
      public function get keyCodec() : ICodecInfo
      {
         return this._keyCodec;
      }
      
      public function get valueCodec() : ICodecInfo
      {
         return this._valueCodec;
      }
   }
}

