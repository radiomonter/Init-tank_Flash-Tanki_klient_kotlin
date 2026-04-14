package obfuscation.raryzuzif
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   
   public class Wywowema
   {
      
      private static const baq:PhysicsMaterial = new PhysicsMaterial(0,1);
      
      private static const qyzyp:int = 255;
      
      private static const namibe:Vector3 = new Vector3();
      
      private static const position:Vector3 = new Vector3();
      
      private static const rotation:Vector3 = new Vector3();
      
      private static const myzusedit:Matrix3 = new Matrix3();
      
      public function Wywowema()
      {
         super();
      }
      
      public static function parse(_arg_1:XML) : Vector.<CollisionShape>
      {
         var _local_2:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         rimowo(cowe(_arg_1),_local_2);
         rimowo(ber(_arg_1),_local_2);
         rimowo(goqivuli(_arg_1),_local_2);
         return _local_2;
      }
      
      private static function rimowo(_arg_1:Vector.<CollisionShape>, _arg_2:Vector.<CollisionShape>) : void
      {
         var _local_3:CollisionShape = null;
         for each(_local_3 in _arg_1)
         {
            _arg_2.push(_local_3);
         }
      }
      
      private static function cowe(_arg_1:XML) : Vector.<CollisionShape>
      {
         var _local_2:XML = null;
         var _local_3:CollisionShape = null;
         var _local_4:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         var _local_5:XMLList = _arg_1.elements("collision-geometry")[0].elements("collision-plane");
         for each(_local_2 in _local_5)
         {
            namibe.x = 0.5 * Number(_local_2.width);
            namibe.y = 0.5 * Number(_local_2.length);
            namibe.z = 0;
            _local_3 = new CollisionRect(namibe,qyzyp,baq);
            faciz(_local_3,_local_2);
            _local_4.push(_local_3);
         }
         return _local_4;
      }
      
      private static function ber(_arg_1:XML) : Vector.<CollisionShape>
      {
         var _local_2:XML = null;
         var _local_3:CollisionShape = null;
         var _local_4:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         var _local_5:XMLList = _arg_1.elements("collision-geometry")[0].elements("collision-box");
         for each(_local_2 in _local_5)
         {
            gudedoqeb(_local_2.size,namibe);
            namibe.scale(0.5);
            _local_3 = new CollisionBox(namibe,qyzyp,baq);
            faciz(_local_3,_local_2);
            _local_4.push(_local_3);
         }
         return _local_4;
      }
      
      private static function goqivuli(_arg_1:XML) : Vector.<CollisionShape>
      {
         var _local_2:XML = null;
         var _local_3:CollisionShape = null;
         var _local_4:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         var _local_5:Vector3 = new Vector3();
         var _local_6:Vector3 = new Vector3();
         var _local_7:Vector3 = new Vector3();
         var _local_8:XMLList = _arg_1.elements("collision-geometry")[0].elements("collision-triangle");
         for each(_local_2 in _local_8)
         {
            gudedoqeb(_local_2.v0,_local_5);
            gudedoqeb(_local_2.v1,_local_6);
            gudedoqeb(_local_2.v2,_local_7);
            _local_3 = new CollisionTriangle(_local_5,_local_6,_local_7,qyzyp,baq);
            faciz(_local_3,_local_2);
            _local_4.push(_local_3);
         }
         return _local_4;
      }
      
      private static function faciz(_arg_1:CollisionShape, _arg_2:XML) : void
      {
         gudedoqeb(_arg_2.position,position);
         gudedoqeb(_arg_2.rotation,rotation);
         myzusedit.setRotationMatrix(rotation.x,rotation.y,rotation.z);
         _arg_1.transform.setFromMatrix3(myzusedit,position);
      }
      
      private static function gudedoqeb(_arg_1:XMLList, _arg_2:Vector3) : void
      {
         var _local_3:XML = null;
         if(_arg_1.length() > 0)
         {
            _local_3 = _arg_1[0];
            _arg_2.x = parseFloat(_local_3.x);
            _arg_2.y = parseFloat(_local_3.y);
            _arg_2.z = parseFloat(_local_3.z);
         }
         else
         {
            _arg_2.reset(0,0,0);
         }
      }
   }
}

