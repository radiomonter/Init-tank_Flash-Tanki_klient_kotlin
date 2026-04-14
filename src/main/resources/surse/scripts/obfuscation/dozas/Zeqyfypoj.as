package obfuscation.dozas
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
   import alternativa.tanks.models.weapon.ConicAreaData;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import alternativa.tanks.models.weapon.shared.Hebesed;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.dewa.Cuq;
   import obfuscation.dewa.Pahofi;
   import obfuscation.dewa.Qepof;
   import obfuscation.jete.Fodehuqym;
   import obfuscation.jete.Hiharec;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.qef.Fedubuti;
   import obfuscation.vynoq.Duhuj;
   import obfuscation.vynoq.Luzim;
   import obfuscation.vynoq.Peg;
   
   public class Zeqyfypoj extends Pahofi implements Qepof, IWeaponModel, Duhuj, BattleEventListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private const targets:Vector.<ClientObject> = new Vector.<ClientObject>();
      
      private const targetIncarnations:Vector.<int> = new Vector.<int>();
      
      private var fyz:ClientObject;
      
      private var weapons:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      public function Zeqyfypoj()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.bijoja();
      }
      
      private static function wyj(_arg_1:ClientObject) : Hiharec
      {
         return Hiharec(_arg_1.getParams(Hiharec));
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Cuq = getInitParam();
         var _local_3:ConicAreaData = new ConicAreaData(_local_2.damageAreaConeAngle,BattleUtils.pamo(_local_2.damageAreaRange));
         _arg_1.putParams(ConicAreaData,_local_3);
      }
      
      [Obfuscation(rename="false")]
      public function startFire(_arg_1:ClientObject) : void
      {
         var _local_2:Fedubuti = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.startFire();
         }
      }
      
      [Obfuscation(rename="false")]
      public function kowywer(_arg_1:ClientObject) : void
      {
         var _local_2:Fedubuti = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.kowywer();
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
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
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         this.fyz = _arg_1;
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Peg = this.fireru(_arg_1);
         var _local_4:TanksCollisionDetector = battleService.getBattleRunner().soc();
         var _local_5:ConicAreaData = ConicAreaData(_local_2.turret.getParams(ConicAreaData));
         var _local_6:Hebesed = new Hebesed(_local_5.fediri(),_local_5.riv(),Fodehuqym.bigob,Fodehuqym.fotuwym,_local_4,battleService.moq());
         var _local_7:Lerih = new Lerih();
         var _local_8:Hiharec = wyj(_local_2.turret);
         var _local_9:Weapon = new Luzim(_local_8.waqatyw(),_local_8.gefifoho(),_local_8.bezab(),_local_8.huzyz(),_local_6,_local_7,this,_local_3);
         this.weapons[_arg_1] = _local_9;
         return _local_9;
      }
      
      private function fireru(_arg_1:ClientObject) : Peg
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:ConicAreaData = ConicAreaData(_local_2.turret.getParams(ConicAreaData));
         var _local_4:Hah = WeaponsManager.getFrezeeSFXModel(_arg_1);
         return _local_4.jyvemoz(_local_3.fediri(),_local_3.riv(),_arg_1);
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Weapon = new Fedubuti(this.fireru(_arg_1));
         this.weapons[_arg_1] = _local_2;
         return _local_2;
      }
      
      public function start(_arg_1:int) : void
      {
         server.fycubi(_arg_1);
      }
      
      public function stop(_arg_1:int) : void
      {
         server.ciceh(_arg_1);
      }
      
      public function onTick(_arg_1:Weapon, _arg_2:Vector.<Body>, _arg_3:Vector.<Number>, _arg_4:Vector.<Vector3>, _arg_5:int) : void
      {
         var _local_6:Vector.<Vector3d> = null;
         var _local_7:Vector.<Vector3d> = null;
         var _local_8:int = 0;
         var _local_9:Body = null;
         if(_arg_1 == this.weapons[this.fyz])
         {
            this.fosidob(_arg_2);
            _local_6 = new Vector.<Vector3d>(_arg_2.length);
            _local_7 = new Vector.<Vector3d>(_arg_2.length);
            _local_8 = 0;
            while(_local_8 < _arg_2.length)
            {
               _local_9 = _arg_2[_local_8];
               _local_6[_local_8] = BattleUtils.tazotipo(_local_9.state.position);
               _local_7[_local_8] = BattleUtils.tazotipo(_arg_4[_local_8]);
               _local_8++;
            }
            this.dejysa.dispatchEvent(Vegepos.figahe);
            server.gepiq(_arg_5,this.targets,this.targetIncarnations,_local_6,_local_7);
            this.targets.length = 0;
            this.targetIncarnations.length = 0;
         }
      }
      
      private function fosidob(_arg_1:Vector.<Body>) : void
      {
         var _local_2:Body = null;
         var _local_3:Tank = null;
         var _local_4:int = 0;
         while(_local_4 < _arg_1.length)
         {
            _local_2 = Body(_arg_1[_local_4]);
            _local_3 = _local_2.tank;
            this.targets[_local_4] = _local_3.bebosaca();
            this.targetIncarnations[_local_4] = _local_3.tankData.incarnation;
            _local_4++;
         }
         this.targets.length = _arg_1.length;
         this.targetIncarnations.length = _arg_1.length;
      }
   }
}

