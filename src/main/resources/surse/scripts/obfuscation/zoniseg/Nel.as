package obfuscation.zoniseg
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
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Mybuwine;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.hufikutu.Judyf;
   import obfuscation.hufikutu.Lybi;
   import obfuscation.hufikutu.Vivubefav;
   import obfuscation.kofen.Vector3d;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.samelosin.Fabiwo;
   
   public class Nel extends Judyf implements Lybi, IWeaponModel, BattleEventListener, Pyp
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var weapons:Dictionary = new Dictionary();
      
      private var wudi:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      public function Nel()
      {
         super();
         this.pec();
      }
      
      private static function pizo(_arg_1:ClientObject) : Vodujyse
      {
         var _local_2:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_3:Cymone = Cymone(OSGi.getInstance().getService(Cymone));
         return _local_3.honyna(_arg_1);
      }
      
      private static function fireru(_arg_1:ClientObject) : Benywani
      {
         var _local_2:Lofur = WeaponsManager.getRailgunSFX(_arg_1);
         return _local_2.fireru(_arg_1);
      }
      
      private static function lezowu(_arg_1:Vector.<Vector3d>) : Vector.<Vector3>
      {
         var _local_2:Vector.<Vector3> = null;
         var _local_3:int = 0;
         var _local_4:Vector3d = null;
         if(_arg_1 != null)
         {
            _local_2 = new Vector.<Vector3>(_arg_1.length);
            _local_3 = 0;
            while(_local_3 < _arg_1.length)
            {
               _local_4 = _arg_1[_local_3];
               if(!BattleUtils.gegigerod(_local_4))
               {
                  return null;
               }
               _local_2[_local_3] = BattleUtils.haq(_local_4);
               _local_3++;
            }
            return _local_2;
         }
         return null;
      }
      
      private static function retyzezuc(_arg_1:Vector.<ClientObject>, _arg_2:Dictionary) : Vector.<Body>
      {
         var _local_3:Vector.<Body> = null;
         var _local_4:int = 0;
         var _local_5:Tank = null;
         if(_arg_1 != null)
         {
            _local_3 = new Vector.<Body>(_arg_1.length);
            _local_4 = 0;
            while(_local_4 < _arg_1.length)
            {
               _local_5 = _arg_2[_arg_1[_local_4]];
               if(_local_5 == null)
               {
                  _local_3[_local_4] = null;
               }
               else
               {
                  _local_3[_local_4] = _local_5.qiniwu();
               }
               _local_4++;
            }
            return _local_3;
         }
         return null;
      }
      
      private function pec() : void
      {
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.bijoja();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Vivubefav = getInitParam();
         _arg_1.putParams(Gobu,new Gobu(_local_2.chargingTimeMsec,_local_2.weakeningCoeff));
      }
      
      [Obfuscation(rename="false")]
      public function sygydyjo(_arg_1:ClientObject) : void
      {
         var _local_2:Fupufigu = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.sygydyjo();
         }
      }
      
      [Obfuscation(rename="false")]
      public function cijafe(_arg_1:ClientObject, _arg_2:Vector3d, _arg_3:Vector.<ClientObject>, _arg_4:Vector.<Vector3d>) : void
      {
         var _local_5:Vector.<Vector3> = null;
         var _local_6:Vector.<Body> = null;
         var _local_7:int = 0;
         var _local_8:Body = null;
         var _local_9:Fupufigu = this.weapons[_arg_1];
         if(_local_9 != null)
         {
            _local_5 = lezowu(_arg_4);
            if(_local_5 != null)
            {
               _local_6 = retyzezuc(_arg_3,this.wudi);
               if(_arg_3 != null)
               {
                  if(_arg_3.length == _local_5.length)
                  {
                     _local_7 = 0;
                     while(_local_7 < _arg_3.length)
                     {
                        _local_8 = _local_6[_local_7];
                        if(_local_8 != null && _local_8.tank != null)
                        {
                           BattleUtils.localToGlobal(_local_8,_local_5[_local_7]);
                        }
                        _local_7++;
                     }
                  }
                  else
                  {
                     _arg_3 = null;
                     _local_5 = null;
                  }
               }
            }
            _local_9.cijafe(BattleUtils.dydyb(_arg_2),_local_6,_local_5);
         }
      }
      
      [Obfuscation(rename="false")]
      public function nakole(_arg_1:ClientObject) : void
      {
         var _local_2:Fupufigu = this.weapons[_arg_1];
         if(_local_2 != null)
         {
            _local_2.nakole();
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Fabiwo = WeaponsManager.shotDatas[_local_2.turret.id];
         var _local_4:Vodujyse = pizo(_local_2.turret);
         var _local_5:Gobu = Gobu(_local_2.turret.getParams(Gobu));
         var _local_6:Benywani = fireru(_arg_1);
         var _local_7:Fetajid = new Mybuwine(_arg_1,_local_2.turret.id,_local_5.levicedu());
         var _local_8:WeaponForces = new WeaponForces(_local_4.rokakop(),_local_4.razo());
         var _local_9:Weapon = new Gyly(_local_7,new Lerih(),_local_3.reloadMsec.value,_local_8,_local_5.levicedu(),_local_5.fojym(),_local_6,this);
         this.weapons[_arg_1] = _local_9;
         return _local_9;
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Vodujyse = pizo(_local_2.turret);
         var _local_4:Gobu = Gobu(_local_2.turret.getParams(Gobu));
         var _local_5:Benywani = fireru(_arg_1);
         var _local_6:WeaponForces = new WeaponForces(_local_3.rokakop(),_local_3.razo());
         var _local_7:Weapon = new Fupufigu(_local_6,_local_4,_local_5);
         this.weapons[_arg_1] = _local_7;
         return _local_7;
      }
      
      public function nafyd(_arg_1:int) : void
      {
         server.mumyg(_arg_1);
      }
      
      public function lydyn(_arg_1:int, _arg_2:Vector3, _arg_3:Vector.<Body>, _arg_4:Vector.<Vector3>) : void
      {
         var _local_5:Vector.<ClientObject> = null;
         var _local_6:Vector.<Vector3d> = null;
         var _local_7:Vector.<int> = null;
         var _local_8:Vector.<Vector3d> = null;
         var _local_9:Vector.<Vector3d> = null;
         var _local_10:int = 0;
         var _local_11:Body = null;
         var _local_12:Vector3 = null;
         var _local_13:Vector3 = null;
         var _local_14:Tank = null;
         var _local_15:int = int(_arg_3.length);
         if(_local_15 > 0)
         {
            _local_5 = new Vector.<ClientObject>(_local_15);
            _local_6 = new Vector.<Vector3d>(_local_15);
            _local_7 = new Vector.<int>(_local_15);
            _local_8 = new Vector.<Vector3d>(_local_15);
            _local_9 = new Vector.<Vector3d>(_local_15);
            _local_10 = 0;
            while(_local_10 < _local_15)
            {
               _local_11 = _arg_3[_local_10];
               _local_12 = _arg_4[_local_10];
               _local_13 = new Vector3();
               _local_13.copy(_local_12);
               BattleUtils.globalToLocal(_local_11,_local_12);
               _local_14 = _local_11.tank;
               _local_7[_local_10] = _local_14.tankData.incarnation;
               _local_5[_local_10] = _local_14.bebosaca();
               _local_6[_local_10] = BattleUtils.tazotipo(_local_12);
               _local_8[_local_10] = BattleUtils.tazotipo(_local_11.state.position);
               _local_9[_local_10] = BattleUtils.tazotipo(_local_13);
               _local_10++;
            }
         }
         var _local_16:Vector3d = BattleUtils.qoqozezig(_arg_2);
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.jytig(_arg_1,_local_16,_local_5,_local_6,_local_7,_local_8,_local_9);
      }
      
      public function lipapyqyw(_arg_1:int) : void
      {
         server.hiq(_arg_1);
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         this.wudi[_arg_1.tank.bebosaca()] = _arg_1.tank;
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         delete this.wudi[_arg_1.tank.bebosaca()];
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         delete this.wudi[_arg_1.tank.bebosaca()];
      }
   }
}

