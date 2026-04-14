package obfuscation.jihadufef
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
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Qibakid;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.buzoduhe.Lyfiqok;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.cefivofyh.Puwid;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kuqavyb.Kubyceb;
   import obfuscation.kuqavyb.Lapesap;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.pekyfo.Byma;
   import obfuscation.samelosin.Fabiwo;
   
   public class Mihadiwo extends Lapesap implements Kubyceb, IWeaponModel, BattleEventListener, Suzanufiv
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const rynivitoq:Number = 1000000;
      
      private var weapons:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      public function Mihadiwo()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.bijoja();
      }
      
      private static function honyna(_arg_1:ClientObject) : Vodujyse
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
      
      private static function fireru(_arg_1:ClientObject) : Gerucykoq
      {
         var _local_2:Cuzaqyv = WeaponsManager.getThunderSFX(_arg_1);
         return _local_2.fireru(_arg_1);
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
         var _local_5:Vodujyse = honyna(_local_3.turret);
         var _local_6:DistanceWeakening = kulyre(_local_3.turret);
         var _local_7:Lyfiqok = new Lyfiqok();
         _local_7.putInitParams(Byma(_local_3.turret.getParams(Byma)));
         _local_7.objectLoaded(_local_3.turret);
         var _local_8:Gerucykoq = fireru(_arg_1);
         var _local_9:Fetajid = new Qibakid(_arg_1,_local_2,rynivitoq);
         var _local_10:WeaponForces = new WeaponForces(_local_5.rokakop(),_local_5.razo());
         var _local_11:Weapon = new Masevyfe(_local_4.reloadMsec.value,_local_10,_local_6,_local_9,_local_7,_local_8,this);
         this.weapons[_arg_1] = _local_11;
         return _local_11;
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Vodujyse = honyna(_local_2.turret);
         var _local_4:DistanceWeakening = kulyre(_local_2.turret);
         var _local_5:Gerucykoq = fireru(_arg_1);
         var _local_6:Lyfiqok = new Lyfiqok();
         _local_6.putInitParams(Byma(_local_2.turret.getParams(Byma)));
         _local_6.objectLoaded(_local_2.turret);
         var _local_7:WeaponForces = new WeaponForces(_local_3.rokakop(),_local_3.razo());
         var _local_8:Weapon = new Ciwenukic(_local_7,_local_4,_local_6,_local_5);
         this.weapons[_arg_1] = _local_8;
         return _local_8;
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         delete this.weapons[_arg_1.tank.bebosaca()];
      }
      
      [Obfuscation(rename="false")]
      public function pekuna(_arg_1:ClientObject) : void
      {
         var _local_2:Ciwenukic = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.pekuna();
         }
      }
      
      [Obfuscation(rename="false")]
      public function lepyfipyg(_arg_1:ClientObject, _arg_2:Vector3d) : void
      {
         var _local_3:Ciwenukic = this.weapons[_arg_1];
         if(_local_3 != null)
         {
            _local_3.lepyfipyg(BattleUtils.haq(_arg_2));
         }
      }
      
      [Obfuscation(rename="false")]
      public function gulib(_arg_1:ClientObject, _arg_2:ClientObject, _arg_3:Vector3d) : void
      {
         var _local_4:ITankModel = null;
         var _local_5:Tank = null;
         var _local_6:Vector3 = null;
         var _local_7:Ciwenukic = this.weapons[_arg_1];
         if(_local_7 != null)
         {
            _local_4 = TankModel(OSGi.getInstance().getService(ITankModel));
            _local_5 = _local_4.getTankData(_arg_2).tank;
            if(_local_5.qiniwu() != null)
            {
               _local_6 = BattleUtils.haq(_arg_3);
               BattleUtils.localToGlobal(_local_5.qiniwu(),_local_6);
               _local_7.gulib(_local_5,_local_6);
            }
         }
      }
      
      public function lydyn(_arg_1:int) : void
      {
         server.cyvog(_arg_1);
      }
      
      public function dyp(_arg_1:int, _arg_2:Vector3, _arg_3:Vector.<String>, _arg_4:Vector.<Number>) : void
      {
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.ril(_arg_1,BattleUtils.tazotipo(_arg_2),_arg_3,_arg_4);
      }
      
      public function zevidu(_arg_1:int, _arg_2:Vector3, _arg_3:Body, _arg_4:Vector.<String>, _arg_5:Vector.<Number>) : void
      {
         var _local_6:Vector3 = _arg_2.clone();
         BattleUtils.globalToLocal(_arg_3,_local_6);
         var _local_7:Vector3d = BattleUtils.tazotipo(_local_6);
         var _local_8:Tank = _arg_3.tank;
         var _local_9:int = _local_8.incarnation;
         var _local_10:Vector3d = BattleUtils.tazotipo(_arg_3.state.position);
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.tapoly(_arg_1,_local_7,_local_8.bebosaca(),_local_9,_local_10,BattleUtils.tazotipo(_arg_2),_arg_4,_arg_5);
      }
   }
}

