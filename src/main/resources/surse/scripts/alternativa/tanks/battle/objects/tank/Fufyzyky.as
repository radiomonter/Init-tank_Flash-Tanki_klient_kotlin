package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix3;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Fufyzyky implements Qory
   {
      
      private static const position:Vector3 = new Vector3();
      
      private static const qylyhi:Matrix3 = new Matrix3();
      
      private static const gapokowyg:EncryptedNumber = new EncryptedNumberImpl(Math.PI / 10.4719);
      
      private static const ramuc:Vector3 = new Vector3();
      
      private const wawusi:Vector3 = new Vector3();
      
      private const vupag:Quaternion = new Quaternion();
      
      private var tank:Tank;
      
      public function Fufyzyky(_arg_1:Tank)
      {
         super();
         this.tank = _arg_1;
      }
      
      private static function qihyqi(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Number
      {
         _arg_1 += _arg_2 * _arg_3;
         return _arg_1 + (_arg_4 - _arg_1) * _arg_5;
      }
      
      public function reset() : void
      {
         var _local_1:BodyState = this.tank.qiniwu().prevState;
         this.wawusi.copy(_local_1.position);
         this.vupag.copy(_local_1.orientation);
      }
      
      public function update(_arg_1:Number) : void
      {
         var _local_2:Body = this.tank.qiniwu();
         var _local_3:BodyState = _local_2.prevState;
         var _local_4:Vector3 = _local_3.velocity;
         var _local_5:Vector3 = this.tank.roca;
         var _local_6:Number = gapokowyg.getNumber();
         this.wawusi.x = qihyqi(this.wawusi.x,_local_4.x,_arg_1,_local_5.x,_local_6);
         this.wawusi.y = qihyqi(this.wawusi.y,_local_4.y,_arg_1,_local_5.y,_local_6);
         this.wawusi.z = qihyqi(this.wawusi.z,_local_4.z,_arg_1,_local_5.z,_local_6);
         var _local_7:Vector3 = _local_3.angularVelocity;
         this.vupag.addScaledVector(_local_7,_arg_1);
         this.vupag.slerp(this.vupag,this.tank.lygulo,_local_6);
         this.vupag.getEulerAngles(ramuc);
         this.vupag.toMatrix3(qylyhi);
         position.copy(this.tank.bilofydur);
         position.transform3(qylyhi);
         position.add(this.wawusi);
         this.tank.bij().muruqad(position,ramuc);
      }
   }
}

