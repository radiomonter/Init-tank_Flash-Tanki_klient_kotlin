package obfuscation.zodo
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.kofen.Vector3d;
   
   public class Zozaqywa
   {
      
      private var tysonivo:Vector3d;
      
      private var _position:Vector3d;
      
      private var _target:Tank;
      
      private var nyqohi:Number;
      
      public function Zozaqywa(_arg_1:Vector3d = null, _arg_2:Vector3d = null, _arg_3:Tank = null, _arg_4:Number = 0)
      {
         super();
         this.tysonivo = _arg_1;
         this._position = _arg_2;
         this._target = _arg_3;
         this.nyqohi = _arg_4;
      }
      
      public function get orientation() : Vector3d
      {
         return this.tysonivo;
      }
      
      public function set orientation(_arg_1:Vector3d) : void
      {
         this.tysonivo = _arg_1;
      }
      
      public function get position() : Vector3d
      {
         return this._position;
      }
      
      public function set position(_arg_1:Vector3d) : void
      {
         this._position = _arg_1;
      }
      
      public function get target() : Tank
      {
         return this._target;
      }
      
      public function set target(_arg_1:Tank) : void
      {
         this._target = _arg_1;
      }
      
      public function get turretAngle() : Number
      {
         return this.nyqohi;
      }
      
      public function set turretAngle(_arg_1:Number) : void
      {
         this.nyqohi = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TargetPosition [";
         _local_1 += "orientation = " + this.orientation + " ";
         _local_1 += "position = " + this.position + " ";
         _local_1 += "target = " + this.target + " ";
         _local_1 += "turretAngle = " + this.turretAngle + " ";
         return _local_1 + "]";
      }
   }
}

