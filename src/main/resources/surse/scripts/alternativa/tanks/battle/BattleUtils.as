package alternativa.tanks.battle
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.geom.Vector3D;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.zodo.Zozaqywa;
   
   public class BattleUtils
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public static const vemoleg:Vector3 = new Vector3();
      
      public static const musivahi:Matrix3 = new Matrix3();
      
      private static const hufavenaz:EncryptedInt = new EncryptedIntImpl(100);
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const verumonuv:RayHit = new RayHit();
      
      private static const zurutocif:Number = 0.22;
      
      public function BattleUtils()
      {
         super();
      }
      
      public static function pamo(_arg_1:Number) : Number
      {
         return _arg_1 * hufavenaz.getInt();
      }
      
      public static function coqopale(_arg_1:BattleTeam) : BattleTeam
      {
         return _arg_1 == BattleTeam.BLUE ? BattleTeam.RED : BattleTeam.BLUE;
      }
      
      public static function gegigerod(_arg_1:Vector3d) : Boolean
      {
         return _arg_1 != null && isFinite(_arg_1.x) && isFinite(_arg_1.y) && isFinite(_arg_1.z);
      }
      
      public static function tazotipo(_arg_1:Vector3) : Vector3d
      {
         return new Vector3d(_arg_1.x,_arg_1.y,_arg_1.z);
      }
      
      public static function qoqozezig(_arg_1:Vector3) : Vector3d
      {
         return _arg_1 == null ? null : new Vector3d(_arg_1.x,_arg_1.y,_arg_1.z);
      }
      
      public static function colufugi(_arg_1:Vector3, _arg_2:Vector3d) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      public static function nuguw(_arg_1:Vector3d, _arg_2:Vector3d) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      public static function haq(_arg_1:Vector3d) : Vector3
      {
         return new Vector3(_arg_1.x,_arg_1.y,_arg_1.z);
      }
      
      public static function dydyb(_arg_1:Vector3d) : Vector3
      {
         return _arg_1 == null ? null : new Vector3(_arg_1.x,_arg_1.y,_arg_1.z);
      }
      
      public static function pavuze(_arg_1:Vector3d, _arg_2:Vector3) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      public static function vyb(_arg_1:Vector3, _arg_2:Vector3D) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      public static function globalToLocal(_arg_1:Body, _arg_2:Vector3) : void
      {
         _arg_2.subtract(_arg_1.state.position);
         _arg_2.transformTransposed3(_arg_1.baseMatrix);
      }
      
      public static function localToGlobal(_arg_1:Body, _arg_2:Vector3) : void
      {
         _arg_2.transform3(_arg_1.baseMatrix);
         _arg_2.add(_arg_1.state.position);
      }
      
      public static function zumymiko(_arg_1:String, _arg_2:Number = 0) : Number
      {
         var _local_3:Number = Number(_arg_1);
         return !isNaN(_local_3) ? Number(_local_3) : Number(_arg_2);
      }
      
      public static function lun(_arg_1:Object, _arg_2:Array) : String
      {
         return "";
      }
      
      public static function pote(_arg_1:Body) : Boolean
      {
         return _arg_1 != null && _arg_1.tank != null;
      }
      
      public static function cetyryju(_arg_1:Body, _arg_2:AllGlobalGunParams) : Boolean
      {
         var _local_3:CollisionDetector = null;
         var _local_4:Vector3 = _arg_1.state.position;
         _direction.diff(_arg_2.hiwanu,_local_4);
         if(_arg_1.scene != null)
         {
            _local_3 = _arg_1.scene.collisionDetector;
            return !_local_3.raycastStatic(_local_4,_direction,Myw.dyhan,1,null,verumonuv);
         }
         return false;
      }
      
      public static function kakogylyh(_arg_1:AllGlobalGunParams) : Boolean
      {
         var _local_2:TanksCollisionDetector = battleService.getBattleRunner().soc();
         var _local_3:Number = Vector3.distanceBetween(_arg_1.hiwanu,_arg_1.vegenel);
         return _local_2.raycastStatic(_arg_1.hiwanu,_arg_1.direction,Myw.dyhan,_local_3,null,verumonuv);
      }
      
      public static function cudizyqi(_arg_1:Tank) : Zozaqywa
      {
         var _local_2:Zozaqywa = new Zozaqywa();
         _local_2.target = _arg_1;
         _local_2.position = BattleUtils.tazotipo(_arg_1.qiniwu().state.position);
         _arg_1.qiniwu().state.orientation.getEulerAngles(vemoleg);
         _local_2.orientation = tazotipo(vemoleg);
         _local_2.turretAngle = _arg_1.zoju();
         return _local_2;
      }
      
      public static function raqyni(_arg_1:Vector.<Tank>) : Vector.<Zozaqywa>
      {
         var _local_3:int = 0;
         var _local_2:Vector.<Zozaqywa> = new Vector.<Zozaqywa>(_arg_1.length);
         while(_local_3 < _arg_1.length)
         {
            _local_2[_local_3] = cudizyqi(_arg_1[_local_3]);
            _local_3++;
         }
         return _local_2;
      }
      
      public static function fodipu(_arg_1:Vector3d) : Boolean
      {
         return isNaN(_arg_1.x) || isNaN(_arg_1.y) || isNaN(_arg_1.z);
      }
      
      public static function hojekaz(_arg_1:Body) : Boolean
      {
         return _arg_1.baseMatrix.m22 < zurutocif;
      }
      
      public static function qusaleh(_arg_1:Vector.<Vector3>) : Vector.<Vector3d>
      {
         var _local_3:int = 0;
         var _local_2:Vector.<Vector3d> = new Vector.<Vector3d>(_arg_1.length);
         while(_local_3 < _arg_1.length)
         {
            _local_2[_local_3] = tazotipo(_arg_1[_local_3]);
            _local_3++;
         }
         return _local_2;
      }
   }
}

