package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.utils.MathUtils;
   
   public class Wedisatoj extends Dyqiw implements Zynomy
   {
      
      private static const kyquzawuj:Number = 3000;
      
      private static const sinesi:Vector3 = new Vector3();
      
      private var p1:Vector3 = new Vector3();
      
      private var p2:Vector3 = new Vector3();
      
      private var kerocur:Vector3 = new Vector3();
      
      private var kijejep:Vector3 = new Vector3();
      
      private var segelehe:Number;
      
      private var distance:Number;
      
      private var acceleration:Number;
      
      private var speed:Number;
      
      private var zifiv:AngleValues = new AngleValues();
      
      private var cecekabyq:AngleValues = new AngleValues();
      
      public var duration:int;
      
      public function Wedisatoj(_arg_1:int)
      {
         super();
         this.duration = _arg_1;
      }
      
      public function init(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.p1.copy(turono());
         this.p2.copy(this.p1);
         this.kijejep.copy(_arg_1);
         this.kerocur.copy(this.kijejep);
         this.p2.z = this.kerocur.z = (this.p1.z > this.kijejep.z ? this.p1.z : this.kijejep.z) + kyquzawuj;
         var _local_3:Number = 4000000 / (this.duration * this.duration);
         this.zifiv.init(MathUtils.clampAngle(pemyw()),_arg_2.x,_local_3);
         this.cecekabyq.init(MathUtils.clampAngle(fofiza()),_arg_2.z,_local_3);
         var _local_4:Vector3 = new Vector3();
         _local_4.diff(this.kijejep,this.p1);
         this.segelehe = _local_4.length();
         this.acceleration = this.segelehe * _local_3;
         this.distance = 0;
         this.speed = 0;
      }
      
      override public function update(_arg_1:int, _arg_2:int) : void
      {
         if(this.speed < 0)
         {
            return;
         }
         if(this.distance > 0.5 * this.segelehe && this.acceleration > 0)
         {
            this.acceleration = -this.acceleration;
            this.zifiv.reverseAcceleration();
            this.cecekabyq.reverseAcceleration();
         }
         var _local_3:Number = 0.001 * _arg_2;
         var _local_4:Number = this.acceleration * _local_3;
         this.distance += (this.speed + 0.5 * _local_4) * _local_3;
         this.speed += _local_4;
         if(this.distance > this.segelehe)
         {
            this.distance = this.segelehe;
         }
         this.jyle(this.distance / this.segelehe,this.p1,this.p2,this.kerocur,this.kijejep,sinesi);
         setPosition(sinesi);
         wawaj(this.zifiv.update(_local_3),0,this.cecekabyq.update(_local_3));
      }
      
      private function jyle(_arg_1:Number, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3, _arg_5:Vector3, _arg_6:Vector3) : void
      {
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = 1 - _arg_1;
         _local_7 = _local_9 * _local_9;
         var _local_10:Number = 3 * _arg_1 * _local_7;
         _local_7 *= _local_9;
         _local_8 = _arg_1 * _arg_1;
         var _local_11:Number = 3 * _local_8 * _local_9;
         _local_8 *= _arg_1;
         _arg_6.x = _local_7 * _arg_2.x + _local_10 * _arg_3.x + _local_11 * _arg_4.x + _local_8 * _arg_5.x;
         _arg_6.y = _local_7 * _arg_2.y + _local_10 * _arg_3.y + _local_11 * _arg_4.y + _local_8 * _arg_5.y;
         _arg_6.z = _local_7 * _arg_2.z + _local_10 * _arg_3.z + _local_11 * _arg_4.z + _local_8 * _arg_5.z;
      }
   }
}

