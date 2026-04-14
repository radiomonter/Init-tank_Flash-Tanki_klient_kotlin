package alternativa.tanks.models.weapons.targeting.priority
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import obfuscation.qejoqa.Lyd;
   import obfuscation.zima.Mol;
   
   public class Fylem
   {
      
      private var ced:Mol;
      
      private var tos:Number;
      
      public function Fylem(_arg_1:Mol, _arg_2:Number = 0)
      {
         super();
         this.ced = _arg_1;
         this.tos = _arg_2;
      }
      
      public function weme(_arg_1:Number, _arg_2:Vector.<Lyd>) : Number
      {
         var _local_3:Lyd = null;
         var _local_4:Number = 0;
         var _local_5:int = _arg_2.length - 1;
         while(_local_5 >= 0)
         {
            _local_3 = _arg_2[_local_5];
            _local_4 = Math.max(this.jotudaset(_local_3,_arg_1) + this.tos * _local_4,_local_4);
            _local_5--;
         }
         return _local_4;
      }
      
      private function jotudaset(_arg_1:Lyd, _arg_2:Number) : Number
      {
         return this.ced.roruqily(_arg_1.wybejazav(),_arg_1.wyky(),_arg_2);
      }
      
      public function wacezu(_arg_1:Number, _arg_2:Vector.<RayHit>) : Number
      {
         var _local_3:RayHit = null;
         var _local_4:Number = 1;
         var _local_5:Number = 0;
         for each(_local_3 in _arg_2)
         {
            _local_5 += this.kigulise(_arg_1,_local_3) * _local_4;
            _local_4 *= this.tos;
         }
         return _local_5;
      }
      
      private function kigulise(_arg_1:Number, _arg_2:RayHit) : Number
      {
         var _local_3:Body = _arg_2.shape.body;
         if(_arg_2.staticHit)
         {
            return 0;
         }
         return this.ced.roruqily(_local_3.tank,_arg_2.t,_arg_1);
      }
   }
}

