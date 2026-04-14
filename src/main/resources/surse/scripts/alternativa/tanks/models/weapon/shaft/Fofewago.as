package alternativa.tanks.models.weapon.shaft
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
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
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import alternativa.tanks.models.weapon.WeaponConst;
   import alternativa.tanks.models.weapon.WeaponForces;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Tirufyne;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.cefivofyh.Puwid;
   import obfuscation.garud.Hoqeg;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Sev;
   import obfuscation.garud.Vaba;
   import obfuscation.kofen.Vector3d;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.zajun.Pureta;
   import obfuscation.zajun.Qiqa;
   import obfuscation.zajun.Ropinu;
   
   public class Fofewago extends Ropinu implements Pureta, IWeaponModel, Pyge, BattleEventListener, Sev
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const rynivitoq:Number = 10000000000;
      
      private var dejysa:Baba;
      
      private var hubihyvaz:Dictionary = new Dictionary();
      
      private var weapons:Dictionary = new Dictionary();
      
      private var fyz:ClientObject;
      
      private var wudi:Dictionary = new Dictionary();
      
      public function Fofewago()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.tomohu);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.bijoja();
      }
      
      private static function kulyre(_arg_1:ClientObject) : DistanceWeakening
      {
         var _local_2:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_3:Puwid = Puwid(_local_2.getModelsByInterface(Puwid)[0]);
         return _local_3.wawosale(_arg_1);
      }
      
      private static function fireru(_arg_1:ClientObject) : Roguqine
      {
         var _local_2:Mili = WeaponsManager.getShaftSFX(_arg_1);
         return _local_2.fireru(_arg_1);
      }
      
      private static function qijozyby(_arg_1:Vector3, _arg_2:Body, _arg_3:Vector3) : Zymohac
      {
         var _local_4:Vector3d = null;
         var _local_5:Vector3d = null;
         var _local_6:Vector3d = null;
         var _local_7:ClientObject = null;
         var _local_8:int = 0;
         var _local_9:Vector3 = null;
         if(_arg_2 != null)
         {
            _local_7 = _arg_2.tank.bebosaca();
            _local_8 = _arg_2.tank.incarnation;
            _local_9 = _arg_3;
            _local_6 = BattleUtils.tazotipo(_local_9);
            BattleUtils.globalToLocal(_arg_2,_local_9);
            _local_4 = BattleUtils.tazotipo(_local_9);
            _local_5 = BattleUtils.tazotipo(_arg_2.state.position);
         }
         return new Zymohac(BattleUtils.qoqozezig(_arg_1),_local_4,_local_7,_local_8,_local_5,_local_6);
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Qiqa = getInitParam();
         _local_2.tututi = BattleUtils.pamo(_local_2.tututi);
         _local_2.wybokukic = BattleUtils.pamo(_local_2.wybokukic);
         _arg_1.putParams(Qiqa,_local_2);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function lyl(_arg_1:ClientObject) : void
      {
         var _local_2:Dilewa = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.legify();
         }
      }
      
      [Obfuscation(rename="false")]
      public function cijafe(_arg_1:ClientObject, _arg_2:Vector3d, _arg_3:ClientObject, _arg_4:Vector3d, _arg_5:Number) : void
      {
         var _local_6:Vector3 = null;
         var _local_7:Body = null;
         var _local_8:Tank = null;
         var _local_9:Dilewa = this.weapons[_arg_1];
         if(_local_9 != null)
         {
            _local_9.legify();
            if(_arg_3 != null)
            {
               _local_8 = this.wudi[_arg_3];
               if(_local_8 == null)
               {
                  _local_7 = null;
               }
               else
               {
                  _local_7 = _local_8.qiniwu();
                  _local_6 = BattleUtils.haq(_arg_4);
                  BattleUtils.localToGlobal(_local_8.qiniwu(),_local_6);
               }
            }
            _local_9.gijaguzu(BattleUtils.dydyb(_arg_2),_local_7,_local_6,_arg_5);
         }
      }
      
      [Obfuscation(rename="false")]
      public function vywovygak(_arg_1:ClientObject) : void
      {
         var _local_2:Dilewa = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.govuz();
         }
      }
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         this.fyz = _arg_1;
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Qiqa = _local_2.turret.getParams(Qiqa) as Qiqa;
         var _local_4:Cymone = Cymone(OSGi.getInstance().getService(Cymone));
         var _local_5:Vodujyse = _local_4.honyna(_local_2.turret);
         var _local_6:Lerih = new Lerih();
         var _local_7:Wyd = new Wyd(_arg_1);
         var _local_8:Fetajid = new Tirufyne(_arg_1,_local_2.turret.id,rynivitoq);
         var _local_9:WeaponForces = new WeaponForces(_local_3.aimingImpact * WeaponConst.hetohiky.getNumber(),_local_5.rokakop());
         var _local_10:Weapon = new Hora(_local_7,battleService,battleEventDispatcher,this,_local_3,_local_9,_local_6,this.hubihyvaz,Vaba(_local_4.hak(_local_2)),_local_8,kulyre(_local_2.turret));
         this.weapons[_arg_1] = _local_10;
         return _local_10;
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Qiqa = _local_2.turret.getParams(Qiqa) as Qiqa;
         var _local_4:Cymone = Cymone(OSGi.getInstance().getService(Cymone));
         var _local_5:Vodujyse = _local_4.honyna(_local_2.turret);
         var _local_6:Roguqine = fireru(_arg_1);
         var _local_7:Rib = _arg_1.getParams(Rib) as Rib;
         var _local_8:TankSpecification = _local_2.pohamozu;
         var _local_9:Weapon = new Dilewa(_local_5.rokakop(),_local_3,_local_6,_local_7,_local_8);
         this.weapons[_arg_1] = _local_9;
         return _local_9;
      }
      
      public function hac(_arg_1:int, _arg_2:Vector3, _arg_3:Body, _arg_4:Vector3) : void
      {
         var _local_5:Zymohac = qijozyby(_arg_2,_arg_3,_arg_4);
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.mepekicy(_arg_1,_local_5.lozybom,_local_5.tank,_local_5.hitPoint,_local_5.incarnation,_local_5.zigi,_local_5.targetPositionGlobal);
      }
      
      public function vir(_arg_1:int, _arg_2:Vector3, _arg_3:Body, _arg_4:Vector3) : void
      {
         var _local_5:Zymohac = qijozyby(_arg_2,_arg_3,_arg_4);
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.baco(_arg_1,_local_5.lozybom,_local_5.tank,_local_5.hitPoint,_local_5.incarnation,_local_5.zigi,_local_5.targetPositionGlobal);
      }
      
      public function jefogud(_arg_1:int) : void
      {
         server.wulasydym(_arg_1);
      }
      
      public function devitiwy() : void
      {
         server.fytet();
      }
      
      public function tafowacyb() : void
      {
         server.vemiw();
      }
      
      private function tomohu(_arg_1:Senyveky) : void
      {
         this.kucik(_arg_1.tank);
         this.wudi[_arg_1.tank.bebosaca()] = _arg_1.tank;
      }
      
      private function kucik(_arg_1:Tank) : void
      {
         var _local_2:TankSkin = _arg_1.bij();
         this.hubihyvaz[_local_2.repijumu()] = _arg_1;
         this.hubihyvaz[_local_2.qenokeru()] = _arg_1;
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         var _local_2:ClientObject = _arg_1.tank.bebosaca();
         if(_local_2 == this.fyz)
         {
            this.fyz = null;
         }
         delete this.weapons[_local_2];
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         delete this.wudi[_arg_1.tank.bebosaca()];
         this.jalijuz(_arg_1.tank.bij());
      }
      
      private function jalijuz(_arg_1:TankSkin) : void
      {
         delete this.hubihyvaz[_arg_1.repijumu()];
         delete this.hubihyvaz[_arg_1.qenokeru()];
      }
      
      public function vitowe() : void
      {
      }
      
      public function createLocalTurretController(_arg_1:Rib, _arg_2:Num) : Hoqeg
      {
         var _local_3:Qiqa = _arg_2.turret.getParams(Qiqa) as Qiqa;
         var _local_4:Sef = new Sef(_local_3.kuri);
         return new Vaba(_arg_1,_local_4,_local_3.gusu);
      }
   }
}

