package obfuscation.qejoqa
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import mx.utils.StringUtil;
   
   public class Lyd
   {
      
      private var left:Number;
      
      private var right:Number;
      
      private var distance:Number;
      
      private var tank:Tank;
      
      public function Lyd(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Tank)
      {
         super();
         this.left = _arg_1;
         this.right = _arg_2;
         this.distance = _arg_3;
         this.tank = _arg_4;
      }
      
      public function gah() : Number
      {
         return this.left;
      }
      
      public function dopewiqi() : Number
      {
         return this.right;
      }
      
      public function wyky() : Number
      {
         return this.distance;
      }
      
      public function wybejazav() : Tank
      {
         return this.tank;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("[{0}, {1}], distance={2}, user={3}",this.left.toFixed(2),this.right.toFixed(2),this.distance.toFixed(0),this.tank.tankData.userName);
      }
   }
}

