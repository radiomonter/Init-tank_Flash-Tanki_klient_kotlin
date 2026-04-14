package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import obfuscation.kofen.Vector3d;
   import obfuscation.qusen.Pukimule;
   
   public class Vetezo
   {
      
      private static const nearDistance:Number = 30;
      
      private static const rijefavec:Number = nearDistance * nearDistance;
      
      private static const dytejeho:Number = 50;
      
      private static const qitawypit:Number = dytejeho * dytejeho;
      
      private static const jyrokuko:Number = 4;
      
      private static const symyr:Number = jyrokuko / 180 * Math.PI;
      
      private static const biqabova:Number = 10;
      
      private static const cul:Number = biqabova / 180 * Math.PI;
      
      public function Vetezo()
      {
         super();
      }
      
      public static function qeker(_arg_1:Pukimule, _arg_2:Pukimule) : void
      {
         nuguw(_arg_1.angularVelocity,_arg_2.angularVelocity);
         nuguw(_arg_1.linearVelocity,_arg_2.linearVelocity);
         nuguw(_arg_1.orientation,_arg_2.orientation);
         nuguw(_arg_1.position,_arg_2.position);
         _arg_2.control = _arg_1.control;
      }
      
      public static function nuguw(_arg_1:Vector3d, _arg_2:Vector3d) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      public static function sinajeje(_arg_1:Vector3, _arg_2:Vector3d) : Number
      {
         var _local_3:Number = _arg_1.x - _arg_2.x;
         var _local_4:Number = _arg_1.y - _arg_2.y;
         var _local_5:Number = _arg_1.z - _arg_2.z;
         return _local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5;
      }
      
      public static function rorubez(_arg_1:Pukimule, _arg_2:Pukimule) : Boolean
      {
         return hiciseciz(_arg_1,_arg_2) && lad(_arg_1,_arg_2) && wozaminu(_arg_1,_arg_2) && vymyc(_arg_1,_arg_2);
      }
      
      private static function hiciseciz(_arg_1:Pukimule, _arg_2:Pukimule) : Boolean
      {
         return vakavajora(_arg_1.position,_arg_2.position) < rijefavec;
      }
      
      private static function wozaminu(_arg_1:Pukimule, _arg_2:Pukimule) : Boolean
      {
         return vakavajora(_arg_1.linearVelocity,_arg_2.linearVelocity) < qitawypit;
      }
      
      private static function lad(_arg_1:Pukimule, _arg_2:Pukimule) : Boolean
      {
         var _local_3:Vector3d = _arg_2.orientation;
         var _local_4:Vector3d = _arg_1.orientation;
         return Math.abs(_local_4.x - _local_3.x) < symyr && Math.abs(_local_4.y - _local_3.y) < symyr && Math.abs(_local_4.z - _local_3.z) < symyr;
      }
      
      private static function vymyc(_arg_1:Pukimule, _arg_2:Pukimule) : Boolean
      {
         var _local_3:Vector3d = _arg_2.angularVelocity;
         var _local_4:Vector3d = _arg_1.angularVelocity;
         return Math.abs(_local_4.x - _local_3.x) < cul && Math.abs(_local_4.y - _local_3.y) < cul && Math.abs(_local_4.z - _local_3.z) < cul;
      }
      
      private static function vakavajora(_arg_1:Vector3d, _arg_2:Vector3d) : Number
      {
         var _local_3:Number = _arg_1.x - _arg_2.x;
         var _local_4:Number = _arg_1.y - _arg_2.y;
         var _local_5:Number = _arg_1.z - _arg_2.z;
         return _local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5;
      }
      
      private static function lolumag(_arg_1:Vector3d, _arg_2:Vector3d) : Number
      {
         var _local_3:Number = length(_arg_1);
         var _local_4:Number = length(_arg_2);
         return (_arg_1.x * _arg_2.x + _arg_1.y * _arg_2.y + _arg_1.z * _arg_2.z) / _local_3 / _local_4;
      }
      
      private static function length(_arg_1:Vector3d) : Number
      {
         return Math.sqrt(_arg_1.x * _arg_1.x + _arg_1.y * _arg_1.y + _arg_1.z * _arg_1.z);
      }
      
      public static function pumyn(_arg_1:Pukimule, _arg_2:Pukimule) : String
      {
         return dac(_arg_1,_arg_2) + " " + rinej(_arg_1,_arg_2) + " " + huqyfyzu(_arg_1,_arg_2) + " " + taqytav(_arg_1,_arg_2) + " " + hafinos(_arg_1,_arg_2);
      }
      
      private static function hafinos(_arg_1:Pukimule, _arg_2:Pukimule) : String
      {
         return (!hiciseciz(_arg_1,_arg_2) ? "F" : "T") + (!lad(_arg_1,_arg_2) ? "F" : "T") + (!wozaminu(_arg_1,_arg_2) ? "F" : "T") + (!vymyc(_arg_1,_arg_2) ? "F" : "T");
      }
      
      private static function dac(_arg_1:Pukimule, _arg_2:Pukimule) : String
      {
         return "dist: [" + vakavajora(_arg_1.position,_arg_2.position) + "/" + rijefavec + "]";
      }
      
      private static function rinej(_arg_1:Pukimule, _arg_2:Pukimule) : String
      {
         var _local_3:Vector3d = _arg_2.orientation;
         var _local_4:Vector3d = _arg_1.orientation;
         return "ori: [X:" + Math.abs(_local_4.x - _local_3.x) + "/" + symyr + "];[Y:" + Math.abs(_local_4.x - _local_3.x) + "/" + symyr + "];[Z:" + Math.abs(_local_4.x - _local_3.x) + "/" + symyr + "]";
      }
      
      private static function huqyfyzu(_arg_1:Pukimule, _arg_2:Pukimule) : String
      {
         return "lV: [" + vakavajora(_arg_1.linearVelocity,_arg_2.linearVelocity) + "/" + qitawypit + "]";
      }
      
      private static function taqytav(_arg_1:Pukimule, _arg_2:Pukimule) : String
      {
         var _local_3:Vector3d = _arg_2.angularVelocity;
         var _local_4:Vector3d = _arg_1.angularVelocity;
         return "oV: [X:" + Math.abs(_local_4.x - _local_3.x) + "/" + cul + "];[Y:" + Math.abs(_local_4.x - _local_3.x) + "/" + cul + "];[Z:" + Math.abs(_local_4.x - _local_3.x) + "/" + cul + "]";
      }
   }
}

