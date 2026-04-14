package obfuscation.megogi
{
   import alternativa.math.Vector3;
   import mx.utils.StringUtil;
   
   public class Jyzeqet
   {
      
      private var direction:Vector3;
      
      private var angle:Number;
      
      private var wazuk:Number;
      
      private var jagalune:Number;
      
      public function Jyzeqet(_arg_1:Vector3, _arg_2:Number, _arg_3:Number, _arg_4:Number = 0)
      {
         super();
         this.direction = _arg_1.clone();
         this.angle = _arg_2;
         this.wazuk = _arg_3;
         this.jagalune = _arg_4;
      }
      
      public static function comparator(_arg_1:Jyzeqet, _arg_2:Jyzeqet) : Number
      {
         return _arg_2.wazuk - _arg_1.wazuk;
      }
      
      public function jesenebo() : Vector3
      {
         return this.direction;
      }
      
      public function qytewesa() : Number
      {
         return this.angle;
      }
      
      public function bid() : Number
      {
         return this.wazuk;
      }
      
      public function cyjoseco() : Number
      {
         return this.jagalune;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("TargetingDirection[direction={0}, angle={1}, maxPriority={2}]",this.direction,this.angle.toFixed(2),this.wazuk.toFixed(0));
      }
   }
}

