package alternativa.tanks.models.weapon.smoky
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import alternativa.tanks.models.weapon.WeaponForces;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Qibakid;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.byg.Kamybeqed;
   import obfuscation.byg.Viwu;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.cefivofyh.Puwid;
   import obfuscation.kevidery.Cyzak;
   import obfuscation.kofen.Vector3d;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.samelosin.Fabiwo;
   
   public class Riqicuso extends Kamybeqed implements Viwu, IWeaponModel, Pohe, BattleEventListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const kegifep:Number = 1000000;
      
      private var dejysa:Baba;
      
      private var weapons:Dictionary = new Dictionary();
      
      private var tov:Dictionary = new Dictionary();
      
      private var puwobyj:Fiwyge;
      
      public function Riqicuso()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.bijoja();
      }
      
      private static function pizo(_arg_1:ClientObject) : Vodujyse
      {
         var _local_2:Cymone = Cymone(OSGi.getInstance().getService(Cymone));
         return _local_2.honyna(_arg_1);
      }
      
      private static function kulyre(_arg_1:ClientObject) : DistanceWeakening
      {
         var _local_2:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_3:Puwid = Puwid(_local_2.getModelsByInterface(Puwid)[0]);
         return _local_3.wawosale(_arg_1);
      }
      
      private static function fireru(_arg_1:ClientObject) : Rubelyvo
      {
         var _local_2:Cyzak = WeaponsManager.getSmokySFX(_arg_1);
         return _local_2.fireru(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function pekuna(_arg_1:ClientObject) : void
      {
         var _local_2:Tujepeku = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.rulok();
         }
      }
      
      [Obfuscation(rename="false")]
      public function lepyfipyg(_arg_1:ClientObject, _arg_2:Vector3d) : void
      {
         var _local_3:Tujepeku = this.weapons[_arg_1];
         if(_local_3 != null)
         {
            _local_3.bizy(BattleUtils.haq(_arg_2));
         }
      }
      
      [Obfuscation(rename="false")]
      public function gulib(_arg_1:ClientObject, _arg_2:ClientObject, _arg_3:Vector3d, _arg_4:Number, _arg_5:Boolean) : void
      {
         var _local_6:Tank = null;
         var _local_7:Vector3 = null;
         var _local_8:Tujepeku = this.weapons[_arg_1];
         if(_local_8 != null)
         {
            _local_6 = this.tov[_arg_2];
            if(_local_6 != null)
            {
               _local_7 = BattleUtils.haq(_arg_3);
               BattleUtils.localToGlobal(_local_6.qiniwu(),_local_7);
               _local_8.vacapyno(_local_6,_local_7,_arg_4,_arg_5);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function zugebyto(_arg_1:ClientObject) : void
      {
         var _local_2:Tank = this.tov[_arg_1];
         this.puwobyj.lurekuly(_local_2.qiniwu().state.position);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         var _local_2:WeaponObject = new WeaponObject(_arg_1);
         var _local_3:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_4:Fabiwo = WeaponsManager.shotDatas[_local_3.turret.id];
         var _local_5:Fetajid = new Qibakid(_arg_1,_local_2,kegifep);
         var _local_6:Vodujyse = pizo(_local_3.turret);
         var _local_7:WeaponForces = new WeaponForces(_local_6.rokakop(),_local_6.razo());
         this.puwobyj = new Fiwyge(_local_4.reloadMsec.value,_local_7,_local_5,kulyre(_local_3.turret),fireru(_arg_1),this,new Lerih());
         this.weapons[_arg_1] = this.puwobyj;
         return this.puwobyj;
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Vodujyse = pizo(_local_2.turret);
         var _local_4:WeaponForces = new WeaponForces(_local_3.rokakop(),_local_3.razo());
         var _local_5:Weapon = new Tujepeku(_local_4,fireru(_arg_1));
         this.weapons[_arg_1] = _local_5;
         return _local_5;
      }
      
      public function lydyn(_arg_1:int) : void
      {
         server.jytig(_arg_1);
      }
      
      public function dyp(_arg_1:int, _arg_2:Vector3) : void
      {
         server.cynebarej(_arg_1,BattleUtils.tazotipo(_arg_2));
      }
      
      public function zevidu(_arg_1:int, _arg_2:Vector3, _arg_3:Body) : void
      {
         var _local_4:Tank = _arg_3.tank;
         var _local_5:Vector3 = _arg_2.clone();
         BattleUtils.globalToLocal(_arg_3,_local_5);
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.vitu(_arg_1,_local_4.bebosaca(),_local_4.incarnation,BattleUtils.tazotipo(_arg_3.state.position),BattleUtils.tazotipo(_local_5),BattleUtils.tazotipo(_arg_2));
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         this.tov[_arg_1.tank.tankData.user] = _arg_1.tank;
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         delete this.tov[_arg_1.tank.tankData.user];
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         var _local_2:Weapon = this.weapons[_arg_1.tank.tankData.user];
         if(_local_2 == this.puwobyj)
         {
            this.puwobyj = null;
         }
         delete this.weapons[_arg_1.tank.tankData.user];
      }
   }
}

