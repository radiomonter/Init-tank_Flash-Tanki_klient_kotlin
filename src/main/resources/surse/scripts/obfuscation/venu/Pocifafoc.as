package obfuscation.venu
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.kofen.Vector3d;
   import obfuscation.samona.Diqije;
   import obfuscation.samona.Dyw;
   import obfuscation.samona.Syvyviho;
   
   public class Pocifafoc extends Syvyviho implements Dyw, IWeaponModel, Jihidy, BattleEventListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var weapons:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      public function Pocifafoc()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.bijoja();
      }
      
      private static function fireru(_arg_1:ClientObject) : Virijih
      {
         return WeaponsManager.getTwinsSFX(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Diqije = getInitParam();
         _local_2.distance = BattleUtils.pamo(_local_2.distance);
         _local_2.speed = BattleUtils.pamo(_local_2.speed);
         _local_2.shellRadius = BattleUtils.pamo(_local_2.shellRadius);
         _arg_1.putParams(Diqije,_local_2);
      }
      
      [Obfuscation(rename="false")]
      public function cijafe(_arg_1:ClientObject, _arg_2:int, _arg_3:int, _arg_4:Vector3d) : void
      {
         var _local_5:Jyk = null;
         if(battleService.lurimire())
         {
            _local_5 = this.weapons[_arg_1];
            if(_local_5 != null)
            {
               _local_5.cijafe(_arg_2,_arg_3,BattleUtils.haq(_arg_4));
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function nakole(_arg_1:ClientObject, _arg_2:int) : void
      {
         var _local_3:Jyk = null;
         if(battleService.lurimire())
         {
            _local_3 = this.weapons[_arg_1];
            if(_local_3 != null)
            {
               _local_3.nakole(_arg_2);
            }
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Weapon = new Duq(_arg_1,_local_2.turret,_local_2.turret.getParams(Diqije) as Diqije,fireru(_arg_1),this);
         this.weapons[_arg_1] = _local_3;
         return _local_3;
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Weapon = new Jyk(_arg_1,_local_2.turret.getParams(Diqije) as Diqije,fireru(_arg_1));
         this.weapons[_arg_1] = _local_3;
         return _local_3;
      }
      
      public function lydyn(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Vector3) : void
      {
         if(battleService.lurimire())
         {
            this.dejysa.dispatchEvent(Vegepos.figahe);
            server.jytig(_arg_1,_arg_3,_arg_2,BattleUtils.tazotipo(_arg_4));
         }
      }
      
      public function hab(_arg_1:int, _arg_2:int) : void
      {
         if(battleService.lurimire())
         {
            this.dejysa.dispatchEvent(Vegepos.figahe);
            server.hiq(_arg_1,_arg_2);
         }
      }
      
      public function fanucaqy(_arg_1:int, _arg_2:Body, _arg_3:Vector3) : void
      {
         var _local_4:Tank = null;
         var _local_5:ClientObject = null;
         var _local_6:Vector3d = null;
         if(battleService.lurimire())
         {
            _local_4 = _arg_2.tank;
            _local_5 = _local_4.bebosaca();
            _local_6 = BattleUtils.tazotipo(_arg_2.state.position);
            server.nuzahiti(battleService.hulivyjam(),_arg_1,_local_5,_local_6,BattleUtils.tazotipo(_arg_3));
         }
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         delete this.weapons[_arg_1.tank.bebosaca()];
      }
      
      public function dyfac(_arg_1:int, _arg_2:Vector3) : void
      {
         if(battleService.lurimire())
         {
            server.sivi(battleService.hulivyjam(),_arg_1,BattleUtils.tazotipo(_arg_2));
         }
      }
   }
}

