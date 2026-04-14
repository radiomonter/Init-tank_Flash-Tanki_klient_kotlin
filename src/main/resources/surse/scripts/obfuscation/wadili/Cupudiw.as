package obfuscation.wadili
{
   public class Cupudiw
   {
      
      private var sogeqone:Number;
      
      private var lodi:Number;
      
      private var kyjip:Number;
      
      private var _key:String;
      
      private var jihabu:Number;
      
      public function Cupudiw(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:String = null, _arg_5:Number = 0)
      {
         super();
         this.sogeqone = _arg_1;
         this.lodi = _arg_2;
         this.kyjip = _arg_3;
         this._key = _arg_4;
         this.jihabu = _arg_5;
      }
      
      public function get brightness() : Number
      {
         return this.sogeqone;
      }
      
      public function set brightness(_arg_1:Number) : void
      {
         this.sogeqone = _arg_1;
      }
      
      public function get contrast() : Number
      {
         return this.lodi;
      }
      
      public function set contrast(_arg_1:Number) : void
      {
         this.lodi = _arg_1;
      }
      
      public function get hue() : Number
      {
         return this.kyjip;
      }
      
      public function set hue(_arg_1:Number) : void
      {
         this.kyjip = _arg_1;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function set key(_arg_1:String) : void
      {
         this._key = _arg_1;
      }
      
      public function get saturation() : Number
      {
         return this.jihabu;
      }
      
      public function set saturation(_arg_1:Number) : void
      {
         this.jihabu = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BCSHStruct [";
         _local_1 += "brightness = " + this.brightness + " ";
         _local_1 += "contrast = " + this.contrast + " ";
         _local_1 += "hue = " + this.hue + " ";
         _local_1 += "key = " + this.key + " ";
         _local_1 += "saturation = " + this.saturation + " ";
         return _local_1 + "]";
      }
   }
}

