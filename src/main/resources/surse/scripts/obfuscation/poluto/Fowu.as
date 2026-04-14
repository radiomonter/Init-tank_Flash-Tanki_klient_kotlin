package obfuscation.poluto
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.services.targeting.Qizytyv;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import obfuscation.garud.Curah;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Vazu;
   
   public class Fowu implements Curah, Qizytyv, Vazu
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      [Inject]
      private var qadylak:Boolean = false;
      
      private var myhop:Rib;
      
      private var jugagova:Number;
      
      private var speed:Number;
      
      private var winypojo:Vector3 = new Vector3();
      
      private var cubef:Number;
      
      private var repopi:Matrix3 = new Matrix3();
      
      private var camera:GameCamera;
      
      public function Fowu(_arg_1:Rib, _arg_2:Number)
      {
         super();
         this.myhop = _arg_1;
         this.jugagova = _arg_2;
         this.speed = this.jugagova;
         this.camera = battleService.getBattleScene3D().cewubu();
      }
      
      public function tick(_arg_1:Number) : void
      {
         var _local_2:Object3D = null;
         var _local_3:Vector3 = null;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         if(this.qadylak)
         {
            this.myhop.rolo(0);
         }
         else
         {
            _local_2 = Num.cimise.tank.bij().rocipaga();
            this.repopi = BattleUtils.musivahi;
            this.repopi.setRotationMatrixForObject3D(_local_2);
            _local_3 = BattleUtils.vemoleg;
            this.repopi.transformVectorInverse(this.camera.kifotabim,_local_3);
            _local_4 = Math.atan2(-_local_3.x,_local_3.y) + this.myhop.jesenebo();
            this.myhop.nivecoqig(_local_4);
            _local_5 = Math.atan2(_local_3.z,_local_3.y);
            if(Math.abs(_local_5 - this.cubef) > 0.0001)
            {
               _local_6 = this.speed * _arg_1;
               this.cubef = MathUtils.clamp(_local_5,this.cubef - _local_6,this.cubef + _local_6);
            }
            this.molonof();
         }
      }
      
      public function enter() : void
      {
         vekol.addListener(this);
         this.cubef = 0;
         this.qadylak = false;
         this.molonof();
      }
      
      public function exit() : void
      {
         vekol.removeListener(this);
         this.cubef = -Math.PI / 2;
         this.winypojo.x = 0;
         this.winypojo.y = 0;
         this.winypojo.z = -1;
      }
      
      public function mouseRightButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         this.qadylak = _arg_1;
         return true;
      }
      
      public function buwo(_arg_1:Vector3) : void
      {
         _arg_1.copy(this.winypojo);
      }
      
      public function sew(_arg_1:Number) : void
      {
         this.speed = this.jugagova * _arg_1;
      }
      
      private function molonof() : void
      {
         var _local_1:Vector3 = BattleUtils.vemoleg;
         _local_1.reset(0,Math.cos(this.cubef),Math.sin(this.cubef));
         this.repopi.transformVector(_local_1,this.winypojo);
      }
      
      public function mouseAbsoluteMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseLeftButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(_arg_1:int) : void
      {
      }
      
      public function keyboardButton(_arg_1:uint, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseLocked(_arg_1:Boolean) : void
      {
      }
   }
}

