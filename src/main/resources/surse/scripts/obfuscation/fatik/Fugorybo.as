package obfuscation.fatik
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
   import obfuscation.kewic.Budysajoz;
   import obfuscation.kewic.Jylicuten;
   import obfuscation.kewic.Pafijoban;
   
   public class Fugorybo extends Budysajoz implements Jylicuten, IWeaponModel, Vanebegum, BattleEventListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private var dejysa:Baba;
      
      private var weapons:Dictionary = new Dictionary();
      
      public function Fugorybo()
      {
         super();
         this.pec();
      }
      
      private static function mogyreqek(_arg_1:Number) : Number
      {
         return _arg_1 * 32767;
      }
      
      private static function vybury(_arg_1:Number) : Number
      {
         return _arg_1 / 32767;
      }
      
      private static function fireru(_arg_1:ClientObject) : Vevizajis
      {
         return WeaponsManager.getRicochetSFXModel(_arg_1);
      }
      
      private function pec() : void
      {
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.bijoja();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function cijafe(_arg_1:ClientObject, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         var _local_5:Cykulez = this.weapons[_arg_1];
         if(_local_5 != null)
         {
            shotDirection.reset(vybury(_arg_2),vybury(_arg_3),vybury(_arg_4)).normalize();
            _local_5.pekuna(shotDirection);
         }
      }
      
      [Obfuscation(rename="false")]
      public function nakole(_arg_1:ClientObject) : void
      {
         var _local_2:Cykulez = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.kyw();
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Pafijoban = getInitParam();
         _local_2.shellRadius = BattleUtils.pamo(_local_2.shellRadius);
         _local_2.shellSpeed = BattleUtils.pamo(_local_2.shellSpeed);
         _local_2.shotDistance = BattleUtils.pamo(_local_2.shotDistance);
         _arg_1.putParams(Pafijoban,_local_2);
      }
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Weapon = new Docokesy(_arg_1,_local_2.turret.getParams(Pafijoban) as Pafijoban,fireru(_arg_1),this);
         this.weapons[_arg_1] = _local_3;
         return _local_3;
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Weapon = new Cykulez(_arg_1,_local_2.turret.getParams(Pafijoban) as Pafijoban,fireru(_arg_1));
         this.weapons[_arg_1] = _local_3;
         return _local_3;
      }
      
      public function lydyn(_arg_1:int, _arg_2:int, _arg_3:Vector3) : void
      {
         if(battleService.lurimire())
         {
            this.dejysa.dispatchEvent(Vegepos.figahe);
            server.jytig(_arg_1,_arg_2,mogyreqek(_arg_3.x),mogyreqek(_arg_3.y),mogyreqek(_arg_3.z));
         }
      }
      
      public function hab(_arg_1:int) : void
      {
         if(battleService.lurimire())
         {
            this.dejysa.dispatchEvent(Vegepos.figahe);
            server.hiq(_arg_1);
         }
      }
      
      public function fanucaqy(_arg_1:int, _arg_2:Body, _arg_3:Vector.<Vector3>) : void
      {
         var _local_4:Tank = null;
         if(battleService.lurimire())
         {
            _local_4 = _arg_2.tank;
            server.nuzahiti(battleService.hulivyjam(),_local_4.bebosaca(),_arg_1,BattleUtils.tazotipo(_arg_2.state.position),BattleUtils.qusaleh(_arg_3));
         }
      }
      
      public function dyfac(_arg_1:int, _arg_2:Vector.<Vector3>) : void
      {
         if(battleService.lurimire())
         {
            server.sivi(battleService.hulivyjam(),_arg_1,BattleUtils.qusaleh(_arg_2));
         }
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         delete this.weapons[_arg_1.tank.bebosaca()];
      }
   }
}

