package alternativa.tanks.models.weapon.shaft
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.Dimiqit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.CameraFovCalculator;
   import alternativa.tanks.battle.scene3d.Object3DNames;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.camera.Jojaver;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponForces;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Sib;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.utils.SetControllerForTemporaryItems;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import obfuscation.bude.BattleTeam;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.cujewipo.Myjigyni;
   import obfuscation.fonu.Fepiwe;
   import obfuscation.fonu.Fovijopir;
   import obfuscation.fonu.Fyw;
   import obfuscation.fonu.Tolizel;
   import obfuscation.garud.Sudyhuma;
   import obfuscation.garud.Vaba;
   import obfuscation.gitepy.Boc;
   import obfuscation.gitepy.Cawejew;
   import obfuscation.gitepy.IdleState;
   import obfuscation.gitepy.Jihaba;
   import obfuscation.gitepy.Mafew;
   import obfuscation.gitepy.Pypoqa;
   import obfuscation.gitepy.Pys;
   import obfuscation.gitepy.Pyvu;
   import obfuscation.gitepy.Rulihyn;
   import obfuscation.gur.Qudylin;
   import obfuscation.gur.Wonesegy;
   import obfuscation.kyre.Myw;
   import obfuscation.zajun.Qiqa;
   
   public class Hora extends BattleRunnerProvider implements Weapon, Dimiqit, LogicUnit, Byjujoqum
   {
      
      [Inject]
      public static var pulat:TargetingModeService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const noveg:Class = Hyg;
      
      private static const masaqi:BitmapData = new noveg().bitmapData;
      
      private static const loqago:int = 200;
      
      private static const myqo:Number = 9;
      
      private static const cyf:Vector3 = new Vector3();
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const _m:Matrix4 = new Matrix4();
      
      private static const tevyjip:Vector3 = new Vector3();
      
      private static const bebek:Vector3 = new Vector3();
      
      private static const jadokyzyn:Vector3 = new Vector3();
      
      private static const kylura:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const tumo:int = 75;
      
      private var battleService:BattleService;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var callback:Pyge;
      
      private var effects:Roguqine;
      
      private var faki:Fetajid;
      
      private var myvyl:Qiqa;
      
      private var taziwyn:WeaponForces;
      
      private var ziqowa:Qudylin;
      
      private var dahigim:Lerih;
      
      private var hubihyvaz:Dictionary = new Dictionary();
      
      private var nywyv:WeaponPlatform;
      
      private var states:Dictionary;
      
      private var currentState:Boc;
      
      private var kymecyval:Vector.<Jihaba>;
      
      private var gez:EncryptedInt = new EncryptedIntImpl();
      
      private var rikoveg:EncryptedNumber = new EncryptedNumberImpl();
      
      private var tud:EncryptedNumber = new EncryptedNumberImpl();
      
      private var hebuwital:Hefad = Hefad.RECHARGE;
      
      private var ryzekamem:Bulo;
      
      private var enabled:Boolean;
      
      private var myhop:Vaba;
      
      private var jycike:int;
      
      private var qatasyd:int;
      
      private var team:BattleTeam;
      
      private var qyfimyzul:SetControllerForTemporaryItems;
      
      private var byjow:Dictionary;
      
      private var vesajabaz:Wonesegy;
      
      private var kivuqav:TankSpecification;
      
      private var weakening:DistanceWeakening;
      
      private var josizanep:Sef;
      
      private var zajyten:Myjigyni = new Myjigyni();
      
      private var cross:Bitmap = new Bitmap(masaqi);
      
      private var womabecum:Wyd;
      
      public function Hora(_arg_1:Wyd, _arg_2:BattleService, _arg_3:BattleEventDispatcher, _arg_4:Pyge, _arg_5:Qiqa, _arg_6:WeaponForces, _arg_7:Lerih, _arg_8:Dictionary, _arg_9:Vaba, _arg_10:Fetajid, _arg_11:DistanceWeakening)
      {
         super();
         this.womabecum = _arg_1;
         this.jycike = _arg_1.qegotody();
         this.battleService = _arg_2;
         this.battleEventDispatcher = _arg_3;
         this.callback = _arg_4;
         this.effects = _arg_1.fireru();
         this.faki = _arg_10;
         this.myvyl = _arg_5;
         this.taziwyn = _arg_6;
         this.ziqowa = new Qudylin(_arg_1.fubu(),-_arg_1.daqe(),_arg_5.gusu,_arg_5.roz);
         this.dahigim = _arg_7;
         this.hubihyvaz = _arg_8;
         this.myhop = _arg_9;
         this.kivuqav = _arg_1.nac().pohamozu;
         this.weakening = _arg_11;
         var _local_12:BattleScene3D = _arg_2.getBattleScene3D();
         this.ryzekamem = new Bulo(_local_12.cewubu());
         this.byjow = _local_12.diwupisi();
         this.qyfimyzul = new SetControllerForTemporaryItems(this.byjow);
         this.vesajabaz = new Wonesegy(_arg_1.fubu(),-_arg_1.daqe());
         this.josizanep = _arg_9.ruj();
      }
      
      private static function nekuforat(_arg_1:Vector3, _arg_2:Vector.<Vector3>, _arg_3:Vector3) : void
      {
         var _local_4:Number = NaN;
         bebek.copy(_arg_2[0]);
         bebek.y = 0;
         _arg_3.copy(bebek);
         var _local_5:Number = _arg_1.distanceToSquared(bebek);
         var _local_6:int = 1;
         while(_local_6 < _arg_2.length)
         {
            bebek.copy(_arg_2[_local_6]);
            bebek.y = 0;
            _local_4 = _arg_1.distanceToSquared(bebek);
            if(_local_4 < _local_5)
            {
               _local_5 = _local_4;
               _arg_3.copy(bebek);
            }
            _local_6++;
         }
      }
      
      private static function kik(_arg_1:DisplayObject) : void
      {
         _arg_1.x = display.stage.stageWidth - _arg_1.width >> 1;
         _arg_1.y = display.stage.stageHeight - _arg_1.height >> 1;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.dahigim.setWeapon(this);
         this.dahigim.init();
         this.ryzekamem.setSkin(_arg_1.bij());
         this.ziqowa.mytipab(_arg_1.qenokeru());
         this.team = this.wybejazav().teamType;
         this.initStateMachine();
         this.reset();
      }
      
      public function destroy() : void
      {
         this.womabecum = null;
         this.battleService = null;
         this.battleEventDispatcher = null;
         this.callback = null;
         this.effects = null;
         this.faki = null;
         this.myvyl = null;
         this.taziwyn = null;
         this.ziqowa = null;
         this.hubihyvaz = null;
         this.myhop = null;
         this.kivuqav = null;
         this.weakening = null;
         this.currentState.exit();
         this.dahigim.destroy();
         this.ryzekamem.stop();
      }
      
      public function activate() : void
      {
         fahysemas().wop(this);
      }
      
      public function deactivate() : void
      {
         fahysemas().bapucic(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.currentState.enter(this.battleService.hulivyjam());
         }
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.rawa(Qyj.STOP,_arg_1);
         }
      }
      
      public function reset() : void
      {
         var _local_1:int = this.battleService.hulivyjam();
         if(this.currentState != this.states[Huq.IDLE])
         {
            this.currentState.exit();
            this.currentState = this.states[Huq.IDLE];
         }
         var _local_2:BattleTeam = this.wybejazav().teamType;
         if(this.team != _local_2)
         {
            this.team = _local_2;
         }
         this.currentState.enter(_local_1);
         this.lemopefys(Hefad.RECHARGE,this.myvyl.kazobilu,_local_1);
      }
      
      private function wybejazav() : Tank
      {
         return this.nywyv.qiniwu().tank;
      }
      
      public function getStatus() : Number
      {
         return this.nase(getTimer()) / this.myvyl.kazobilu;
      }
      
      public function suvu() : void
      {
         if(this.enabled)
         {
            this.currentState.rawa(Qyj.TRIGGER_PULL,null);
         }
      }
      
      public function dygajocyc() : void
      {
         if(this.enabled)
         {
            this.currentState.rawa(Qyj.TRIGGER_RELEASE,null);
         }
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(this.enabled)
         {
            this.currentState.update(_arg_1,_arg_2);
         }
      }
      
      public function sybefe() : Boolean
      {
         return this.dahigim.sybefe();
      }
      
      public function cunaro(_arg_1:Hefad) : void
      {
         var _local_2:int = 0;
         var _local_3:Number = NaN;
         if(_arg_1 != this.hebuwital)
         {
            _local_2 = this.battleService.hulivyjam();
            _local_3 = this.nase(_local_2);
            this.lemopefys(_arg_1,_local_3,_local_2);
         }
      }
      
      public function rawa(_arg_1:Qyj, _arg_2:* = undefined) : void
      {
         var _local_3:Jihaba = null;
         for each(_local_3 in this.kymecyval)
         {
            if(_local_3.eventType == _arg_1 && _local_3.state == this.currentState)
            {
               this.currentState.exit();
               if(_local_3.handler != null)
               {
                  _local_3.handler.execute(_arg_2);
               }
               this.currentState = _local_3.newState;
               if(this.currentState is IdleState)
               {
                  this.myhop.zosibukyk();
               }
               this.currentState.enter(this.battleService.hulivyjam());
               return;
            }
         }
         throw new Timyba(this.currentState,_arg_1);
      }
      
      public function nase(_arg_1:int) : Number
      {
         var _local_2:Number = this.rikoveg.getNumber() + (_arg_1 - this.gez.getInt()) * this.tud.getNumber() / kylura.getInt();
         return MathUtils.clamp(_local_2,0,this.myvyl.kazobilu);
      }
      
      public function lasywoci() : void
      {
         this.battleService.sefu(Jojaver.INSTANCE);
      }
      
      public function joduken(_arg_1:int, _arg_2:int) : void
      {
         this.zajyten.x = _arg_1 + myqo;
         this.zajyten.y = _arg_2;
      }
      
      public function govuz() : void
      {
         this.ryzekamem.stop();
         this.nywyv.stopMovement();
         this.nywyv.finypa(true);
         this.nywyv.qigaqesa(false);
         this.nywyv.camite(BattleUtils.vemoleg);
         this.ziqowa.guvoh(BattleUtils.vemoleg);
         this.ziqowa.gimyba = 0;
         this.ziqowa.rywa = 0;
         if(this.wydo())
         {
            this.vesajabaz.activate();
            this.battleService.sefu(this.vesajabaz);
         }
         else
         {
            this.battleService.sefu(this.ziqowa);
         }
         this.effects.qewimequg(this.nywyv.qenokeru());
         this.callback.devitiwy();
         this.callback.vitowe();
         var _local_1:BattleScene3D = this.battleService.getBattleScene3D();
         _local_1.zyz();
         _local_1.tiziqec.wypitir(this.nywyv.qiniwu().state.position,0);
      }
      
      private function wydo() : Boolean
      {
         return pulat.visefi() == Sudyhuma.cuwycagin;
      }
      
      public function legify() : void
      {
         if(this.josizanep.parent != null)
         {
            this.josizanep.parent.removeChild(this.josizanep);
            this.zajyten.parent.removeChild(this.zajyten);
            if(this.cross.parent != null)
            {
               this.cross.parent.removeChild(this.cross);
            }
         }
         this.nywyv.finypa(false);
         this.nywyv.qigaqesa(true);
         this.battleService.vome();
         this.battleService.sidanige();
         this.vesajabaz.deactivate();
         this.battleService.getBattleScene3D().qedunevy();
         this.nywyv.weka();
         var _local_1:Number = this.battleService.getBattleView().gitis();
         var _local_2:Number = this.battleService.getBattleView().boh();
         this.ryzekamem.tobosagyv(CameraFovCalculator.mysepokuw(_local_1,_local_2));
         this.ryzekamem.start();
      }
      
      public function sygym(_arg_1:uint) : Boolean
      {
         return this.dahigim.tuvezu(_arg_1);
      }
      
      public function mofufuqo() : Boolean
      {
         var _local_1:Object3D = null;
         this.nywyv.gytamy(betyqiju);
         var _local_2:Vector3 = this.nywyv.qiniwu().state.position;
         _direction.diff(betyqiju.hiwanu,_local_2);
         var _local_3:RayIntersectionData = this.battleService.getBattleScene3D().raycast(_local_2,_direction,this.battleService.paluhu());
         if(_local_3 != null && _local_3.time <= 1)
         {
            _local_1 = _local_3.object;
            return _local_1.name == Object3DNames.dyhan;
         }
         return false;
      }
      
      public function cyd() : void
      {
         this.effects.cyd();
      }
      
      public function jymon() : Number
      {
         return this.myvyl.kazobilu;
      }
      
      public function tevicyvy(_arg_1:Number) : void
      {
         var _local_2:BattleScene3D = this.battleService.getBattleScene3D();
         _local_2.tiziqec.wypitir(this.nywyv.qiniwu().state.position,_arg_1);
      }
      
      public function gadotity(_arg_1:Number) : void
      {
         var _local_2:int = this.battleService.hulivyjam();
         this.effects.hyhu();
         this.nywyv.gytamy(betyqiju);
         var _local_3:Qesaba = this.vojodupof();
         this.ziqowa.jobojykyl(_direction);
         var _local_4:Number = _arg_1 - this.nase(_local_2);
         this.effects.laqevoj(betyqiju.hiwanu,_local_3.lozybom);
         this.dimiled(_local_3.lozybom,_local_3.raw,_direction);
         this.hywiquli(_local_3.target,_local_3.raw,this.qesohilo(_local_4),_direction);
         this.qatasyd = this.battleService.hulivyjam() + this.jycike;
         this.callback.hac(_local_2,_local_3.lozybom,_local_3.target,_local_3.raw);
         this.lemopefys(Hefad.RECHARGE,Math.min(this.nase(_local_2),this.myvyl.kazobilu - this.myvyl.minAimedShotEnergy),_local_2);
      }
      
      private function vojodupof() : Qesaba
      {
         var _local_1:RayIntersectionData = null;
         var _local_2:Object3D = null;
         var _local_3:Vector3 = null;
         var _local_4:Tank = null;
         var _local_5:Qesaba = new Qesaba();
         this.ziqowa.qokyg(cyf);
         this.myhop.buwo(_direction);
         this.qadakak(this.nywyv.bij());
         while(true)
         {
            _local_1 = this.battleService.getBattleScene3D().raycast(cyf,_direction,this.byjow);
            if(_local_1 == null)
            {
               break;
            }
            _local_2 = _local_1.object;
            _local_3 = cyf.clone().addScaled(_local_1.time + 0.1,_direction);
            if(_local_2.name == Object3DNames.dyhan)
            {
               _local_5.zor(_local_3);
               break;
            }
            if(_local_2.name == Object3DNames.TANK_PART)
            {
               _local_4 = this.hubihyvaz[_local_2];
               if(this.cogegujo(_local_4,_local_2,_local_3))
               {
                  _local_5.juvilyvyb(_local_4.qiniwu(),_local_3);
                  break;
               }
               this.qadakak(_local_4.bij());
            }
            else
            {
               this.qyfimyzul.addTemporaryItem(_local_2);
            }
            cyf.copy(_local_3);
         }
         this.qyfimyzul.deleteAllTemporaryItems();
         return _local_5;
      }
      
      private function cogegujo(_arg_1:Tank, _arg_2:Object3D, _arg_3:Vector3) : Boolean
      {
         var _local_4:TankSkin = _arg_1.bij();
         if(_local_4.qenokeru() == _arg_2)
         {
            _m.setMatrix(_arg_2.x,_arg_2.y,_arg_2.z,_arg_2.rotationX,_arg_2.rotationY,_arg_2.rotationZ);
            _m.transformVectorInverse(_arg_3,tevyjip);
            nekuforat(tevyjip,_local_4.tytew().jaruzar,jadokyzyn);
            _m.transformVector(jadokyzyn,tevyjip);
            tevyjip.subtract(_arg_3);
            if(fahysemas().soc().hasStaticHit(_arg_3,tevyjip,Myw.dyhan,1))
            {
               return false;
            }
         }
         return _local_4.puqym() == 1;
      }
      
      public function hawapule(_arg_1:Number) : void
      {
         var _local_2:Sib = null;
         var _local_3:Body = null;
         var _local_4:Vector3 = null;
         var _local_5:Vector3 = null;
         var _local_6:Number = NaN;
         var _local_7:int = this.battleService.hulivyjam();
         var _local_8:Number = _arg_1 < 0 ? Number(this.nase(_local_7)) : Number(_arg_1);
         if(_local_8 >= this.myvyl.fastShotEnergy)
         {
            _local_8 -= this.myvyl.fastShotEnergy;
            if(!this.mofufuqo())
            {
               this.nywyv.gytamy(betyqiju);
               _local_6 = this.womabecum.cywyzugej().rokakop();
               _local_2 = this.faki.target(betyqiju);
               if(_local_2.mosylejib())
               {
                  _local_4 = _local_2.dopuneq().position.clone();
               }
               if(_local_2.hasStaticHit())
               {
                  _local_5 = _local_2.telyfen().position.clone();
               }
               if(_local_2.zoma())
               {
                  _local_3 = _local_2.dopuneq().shape.body;
                  _local_6 *= this.weakening.sygyta(_local_2.dopuneq().t);
               }
               this.dimiled(_local_5,_local_4,_local_2.jesenebo());
               this.hywiquli(_local_3,_local_4,_local_6,_local_2.jesenebo());
               this.effects.laqevoj(betyqiju.hiwanu,_local_5);
            }
            this.effects.rijewury(this.nywyv.getynos(),this.nywyv.qenokeru());
            this.qatasyd = this.battleService.hulivyjam() + this.jycike;
            this.callback.vir(_local_7,_local_5,_local_3,_local_4);
         }
         this.lemopefys(Hefad.RECHARGE,_local_8,_local_7);
      }
      
      public function fibanewe() : Boolean
      {
         return this.battleService.hulivyjam() >= this.qatasyd;
      }
      
      public function tycy() : void
      {
         this.callback.tafowacyb();
      }
      
      private function qadakak(_arg_1:TankSkin) : void
      {
         this.qyfimyzul.addTemporaryItem(_arg_1.repijumu());
         this.qyfimyzul.addTemporaryItem(_arg_1.qenokeru());
      }
      
      private function initStateMachine() : void
      {
         var _local_1:Vector3 = this.nywyv.falevetos().clone();
         this.states = new Dictionary();
         this.states[Huq.IDLE] = new IdleState(this);
         this.states[Huq.READY_TO_SHOOT] = new Cawejew(this,loqago);
         var _local_2:Pypoqa = new Pypoqa();
         this.states[Huq.cafetuqyz] = new Pys(_local_2,this,this.myvyl.targetingTransitionTime,this.myvyl.fysejydu,_local_1,this.battleService.getBattleScene3D().cewubu(),this.nywyv.bij(),this.nywyv,this.myhop,this.myvyl,this.kivuqav);
         this.states[Huq.kokavoz] = new Mafew(_local_2,this,this.ziqowa,this.myvyl,this.myhop,this.effects,this.kivuqav);
         this.currentState = this.states[Huq.IDLE];
         this.kymecyval = Vector.<Jihaba>([this.ribadutyp(Huq.IDLE,Qyj.READY_TO_SHOOT,Huq.READY_TO_SHOOT,null),this.ribadutyp(Huq.IDLE,Qyj.STOP,Huq.IDLE,null),this.ribadutyp(Huq.READY_TO_SHOOT,Qyj.TRIGGER_RELEASE,Huq.IDLE,new Fyw(this)),this.ribadutyp(Huq.READY_TO_SHOOT,Qyj.SWITCH,Huq.cafetuqyz,null),this.ribadutyp(Huq.READY_TO_SHOOT,Qyj.STOP,Huq.IDLE,null),this.ribadutyp(Huq.cafetuqyz,Qyj.SWITCH,Huq.kokavoz,null),this.ribadutyp(Huq.cafetuqyz,Qyj.TRIGGER_RELEASE,Huq.IDLE,new Fepiwe(this)),this.ribadutyp(Huq.cafetuqyz,Qyj.STOP,Huq.IDLE,new Fovijopir(this)),this.ribadutyp(Huq.kokavoz,Qyj.EXIT,Huq.IDLE,null),this.ribadutyp(Huq.kokavoz,Qyj.STOP,Huq.IDLE,new Tolizel(this))]);
      }
      
      private function ribadutyp(_arg_1:Huq, _arg_2:Qyj, _arg_3:Huq, _arg_4:Rulihyn) : Jihaba
      {
         return new Jihaba(_arg_2,this.states[_arg_1],this.states[_arg_3],_arg_4);
      }
      
      private function lemopefys(_arg_1:Hefad, _arg_2:Number, _arg_3:int) : void
      {
         this.hebuwital = _arg_1;
         switch(_arg_1)
         {
            case Hefad.RECHARGE:
               this.rikoveg.setNumber(0);
               this.tud.setNumber(this.myvyl.chargeRate);
               this.gez.setInt(_arg_3 - _arg_2 / this.tud.getNumber() * kylura.getInt());
               return;
            case Hefad.DRAIN:
               this.rikoveg.setNumber(this.myvyl.kazobilu);
               this.tud.setNumber(-this.myvyl.tikinapys);
               this.gez.setInt(_arg_3 + (this.myvyl.kazobilu - _arg_2) / this.tud.getNumber() * kylura.getInt());
               this.callback.jefogud(_arg_3);
         }
      }
      
      private function dimiled(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         this.effects.numule(betyqiju.vegenel);
         this.effects.huj(_arg_1,_arg_2,betyqiju.vegenel,betyqiju.direction,_arg_3);
         this.nywyv.qiniwu().addWorldForceScaled(betyqiju.vegenel,betyqiju.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
      }
      
      private function hywiquli(_arg_1:Body, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : void
      {
         if(_arg_1 != null)
         {
            _arg_1.tank.tyvedyz(_arg_2,_arg_4,_arg_3);
         }
      }
      
      private function qesohilo(_arg_1:Number) : Number
      {
         var _local_2:Number = this.womabecum.cywyzugej().rokakop();
         return _local_2 + (this.taziwyn.rokakop() - _local_2) * _arg_1 / this.myvyl.kazobilu;
      }
      
      public function tecojeze(_arg_1:Vector3, _arg_2:Pyvu) : Boolean
      {
         var _local_3:RayIntersectionData = null;
         var _local_4:Object3D = null;
         var _local_5:Tank = null;
         this.ziqowa.qokyg(cyf);
         _direction.copy(_arg_1);
         this.qadakak(this.nywyv.bij());
         _arg_2.reset();
         while(true)
         {
            _local_3 = this.battleService.getBattleScene3D().raycast(cyf,_arg_1,this.byjow);
            if(_local_3 == null)
            {
               break;
            }
            _local_4 = _local_3.object;
            if(_local_4.name == Object3DNames.dyhan)
            {
               cyf.addScaled(_local_3.time,_arg_1);
               _arg_2.reme(cyf);
               this.qyfimyzul.deleteAllTemporaryItems();
               return true;
            }
            if(_local_4.name == Object3DNames.TANK_PART)
            {
               cyf.addScaled(_local_3.time,_arg_1);
               _local_5 = this.hubihyvaz[_local_4];
               if(this.cogegujo(_local_5,_local_4,cyf))
               {
                  _arg_2.reme(cyf,_local_5);
                  this.qyfimyzul.deleteAllTemporaryItems();
                  return true;
               }
            }
            this.qyfimyzul.addTemporaryItem(_local_3.object);
         }
         this.qyfimyzul.deleteAllTemporaryItems();
         return false;
      }
      
      public function nisu(_arg_1:Point, _arg_2:Point) : void
      {
         var _local_3:DisplayObjectContainer = this.battleService.getBattleView().kihe();
         _local_3.addChild(this.josizanep);
         kik(this.josizanep);
         var _local_4:Tank = this.wybejazav();
         _local_4.wep();
         var _local_5:BitmapData = _local_4.zyhyg();
         this.zajyten.bitmapData = _local_5;
         _local_3.addChild(this.zajyten);
         if(pulat.visefi() == Sudyhuma.cuwycagin)
         {
            _local_3.addChild(this.cross);
         }
         var _local_6:GameCamera = this.battleService.getBattleScene3D().cewubu();
         var _local_7:Vector3D = new Vector3D();
         _local_4.bivuz(_local_7);
         _local_7 = _local_6.projectGlobal(_local_7);
         _arg_1.x = _local_7.x + this.battleService.getBattleView().lizo();
         _arg_1.y = _local_7.y + this.battleService.getBattleView().sohysatu() - _local_5.height;
         this.zajyten.x = _arg_1.x;
         this.zajyten.y = _arg_1.y;
         this.roc();
         _arg_2.x = display.stage.stageWidth >> 1;
         _arg_2.y = (display.stage.stageHeight >> 1) + tumo;
      }
      
      private function roc() : void
      {
         this.cross.x = display.stage.stageWidth - this.cross.width >> 1;
         this.cross.y = display.stage.stageHeight - this.cross.height >> 1;
      }
      
      public function soqymuce(_arg_1:Number) : void
      {
         this.josizanep.cymule.alpha = _arg_1;
         this.zajyten.alpha = _arg_1;
      }
   }
}

