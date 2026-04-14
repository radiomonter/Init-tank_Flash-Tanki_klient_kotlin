package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.utils.MathUtils;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.Vuwuci;
   
   public class Cuqubyci
   {
      
      private static const wari:PhysicsMaterial = new PhysicsMaterial(0,1);
      
      private static const lodytyw:PhysicsMaterial = new PhysicsMaterial(0,0.2);
      
      public function Cuqubyci()
      {
         super();
      }
      
      public static function tonecudu(_arg_1:Vector3, _arg_2:Number, _arg_3:Vuwuci) : void
      {
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = _arg_2 - 10;
         var _local_7:Number = _arg_1.y;
         var _local_8:Number = _local_6 / 2;
         var _local_9:Number = 0.82;
         var _local_10:Number = 1 - (1 - _local_9) * (1 - _local_9) * _local_7 * _local_7 / (_local_8 * _local_8);
         if(_local_10 > 0)
         {
            _local_10 = Math.sqrt(_local_10);
         }
         else
         {
            _local_10 = 1 - (1 - _local_9) * _local_7 / _local_8;
         }
         var _local_11:Number = (_local_9 - 1) * _local_7 / ((1 + _local_10) * _local_8);
         var _local_12:Number = _local_10 * _local_8 - _local_11 * _local_7;
         var _local_13:Number = (1 - _local_9) * _local_7 / ((1 + _local_10) * _local_8);
         var _local_14:Number = (1 - _local_10) * _local_8 / ((1 - _local_9) * _local_7);
         if(MathUtils.numbersEqual(_local_13,_local_14,0.00001) || _local_13 < _local_14)
         {
            _local_4 = _local_9 * _local_7;
            _local_5 = _local_11 * _local_4 + _local_12;
         }
         else
         {
            _local_4 = (1 - _local_10) * _local_8 / _local_11 + _local_7;
            _local_5 = _local_8;
         }
         var _local_15:Number = _local_5 - _local_10 * _local_8;
         var _local_16:Number = _local_7 - _local_4;
         var _local_17:Number = Math.sqrt(_local_15 * _local_15 + _local_16 * _local_16) / 2;
         _local_15 = (1 + _local_10) * _local_8;
         _local_16 = (1 - _local_9) * _local_7;
         var _local_18:Number = Math.sqrt(_local_15 * _local_15 + _local_16 * _local_16) / 2;
         var _local_19:CollisionBox = new CollisionBox(new Vector3(_arg_1.x,_local_17,_local_18),Myw.dyhan,lodytyw);
         var _local_20:Matrix4 = new Matrix4();
         var _local_21:Number = Math.atan(_local_13);
         _local_20.setRotationMatrix(-_local_21,0,0);
         var _local_22:Number = _local_9 * _local_7 + _local_18 * Math.sin(_local_21) - _local_17 * Math.cos(_local_21);
         var _local_23:Number = -_local_8 + _local_18 * Math.cos(_local_21) + _local_17 * Math.sin(_local_21) - (_arg_1.z - _local_6 / 2);
         _local_20.setPosition(new Vector3(0,_local_22,_local_23));
         _arg_3.body.addCollisionShape(_local_19,_local_20);
         _arg_3.dusiruv.push(_local_19);
         _local_19 = new CollisionBox(new Vector3(_arg_1.x,_local_17,_local_18),Myw.dyhan,lodytyw);
         _local_20.setRotationMatrix(_local_21,0,0);
         _local_20.setPosition(new Vector3(0,-_local_22,_local_23));
         _arg_3.body.addCollisionShape(_local_19,_local_20);
         _arg_3.dusiruv.push(_local_19);
         var _local_24:Number = _arg_2 * 3 / 4;
         var _local_25:Vector3 = new Vector3(_arg_1.x,_arg_1.y * _local_9,_local_24 / 2);
         var _local_26:Matrix4 = new Matrix4();
         _local_26.m23 = _local_25.z - _arg_1.z;
         var _local_27:CollisionBox = new CollisionBox(_local_25,Myw.dyhan,lodytyw);
         _arg_3.body.addCollisionShape(_local_27,_local_26);
         _arg_3.dusiruv.push(_local_27);
         var _local_28:Number = _arg_2 * 3 / 4;
         var _local_29:Vector3 = new Vector3(_arg_1.x,_arg_1.y * _local_9,_local_28 / 2);
         var _local_30:Matrix4 = new Matrix4();
         _local_30.m23 = _arg_2 - _local_29.z - _arg_1.z;
         var _local_31:CollisionBox = new CollisionBox(_local_29,Myw.dyhan,wari);
         _arg_3.body.addCollisionShape(_local_31,_local_30);
         _arg_3.dusiruv.push(_local_31);
      }
      
      public static function byhory(_arg_1:Vector3, _arg_2:Number, _arg_3:Vuwuci) : void
      {
         var _local_4:Vector3 = new Vector3(_arg_1.x,_arg_1.y,_arg_2 / 2);
         var _local_5:CollisionBox = new CollisionBox(_local_4,0,lodytyw);
         var _local_6:Matrix4 = new Matrix4();
         _local_6.m23 = _arg_2 / 2 - _arg_1.z;
         _arg_3.body.addCollisionShape(_local_5,_local_6);
         _arg_3.paqu = _local_5;
      }
   }
}

