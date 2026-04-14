package obfuscation.poluto
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Tesik;
   import obfuscation.garud.Vazu;
   
   public class Wewewyjy extends Rutyqy implements Vazu
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var camera:GameCamera;
      
      public function Wewewyjy(_arg_1:Rib)
      {
         super(_arg_1);
         fugatatyr(new Tesik(GameActionEnum.CHASSIS_LEFT_MOVEMENT,GameActionEnum.CHASSIS_RIGHT_MOVEMENT,GameActionEnum.CENTER_TURRET,GameActionEnum.CHASSIS_FORWARD_MOVEMENT,GameActionEnum.CHASSIS_BACKWARD_MOVEMENT));
         this.camera = battleService.getBattleScene3D().cewubu();
      }
      
      public function buwo(_arg_1:Vector3) : void
      {
         _arg_1.copy(this.camera.kifotabim);
      }
      
      override protected function hivasucy(_arg_1:GameActionEnum, _arg_2:Boolean) : void
      {
         super.hivasucy(_arg_1,_arg_2);
         switch(_arg_1)
         {
            case GameActionEnum.ROTATE_TURRET_LEFT:
               myhop.rotateLeft(_arg_2);
               return;
            case GameActionEnum.ROTATE_TURRET_RIGHT:
               myhop.rotateRight(_arg_2);
               return;
            case GameActionEnum.CENTER_TURRET:
               myhop.center(_arg_2);
         }
      }
   }
}

