package obfuscation.mujusaqim
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.CTFTargetEvaluator;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Qeluzajy;
   import alternativa.tanks.battle.events.Qigawi;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.gui.Tupebeput;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.KeyCodes;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.events.KeyboardEvent;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import obfuscation.bude.BattleTeam;
   import obfuscation.cetij.Vopetycy;
   import obfuscation.fatik.Kadiwitu;
   import obfuscation.fatik.Zer;
   import obfuscation.hizohofog.Birupu;
   import obfuscation.hizohofog.Dusy;
   import obfuscation.hizohofog.Lyf;
   import obfuscation.hizohofog.Nefoq;
   import obfuscation.hizohofog.Qumuro;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.modo.Bibeza;
   import obfuscation.modo.Gazib;
   import obfuscation.modo.Johad;
   import obfuscation.qasa.Mowupime;
   import obfuscation.verymi.Pypi;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Linizujim extends Qumuro implements Birupu, Hylyv, ObjectLoadPostListener, ObjectUnloadListener, BattleEventListener
   {
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var suner:TextureMaterialRegistry;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var norata:BattleInputService;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      public static const niry:Number = 80;
      
      private static const muwacyco:int = 128;
      
      private static const waferihe:int = 256;
      
      private static const noso:uint = KeyCodes.F;
      
      private static const jydicel:int = 5000;
      
      private static const qeva:String = "taken";
      
      private static const myca:String = "lost";
      
      private static const lodaqi:String = "returned";
      
      private static const vesujaq:String = "captured";
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private var tyc:Boolean;
      
      private var seki:Tupebeput;
      
      private var sijod:Pypi;
      
      private var inventoryModel:Bibeza;
      
      private var flags:Dictionary;
      
      private var pena:Object;
      
      private var gepu:Object;
      
      private var tokopob:Object;
      
      private var bewa:String;
      
      private var sucu:String;
      
      private var wygezew:Myj;
      
      private var lycumivul:Myj;
      
      private var flagDropSound:Sound;
      
      private var flagReturnSound:Sound;
      
      private var flagTakeSound:Sound;
      
      private var winSound:Sound;
      
      private var dejysa:Baba;
      
      private var sagal:Dictionary;
      
      private var gaz:Tank;
      
      private var cigypy:Vector.<Cihuqacyp>;
      
      private var qedohat:Vector.<CTFTargetEvaluator>;
      
      public function Linizujim()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Vovakopy,this.byzac);
         this.dejysa.jikina(Qigawi,this.necyjiw);
         this.dejysa.jikina(Rujina,this.qoc);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Qeluzajy,this.doqafeb);
         this.dejysa.jikina(Vopetycy,this.fabademyl);
      }
      
      private static function fipisoqiz(_arg_1:Tanks3DSResource) : Object3D
      {
         var _local_2:Mesh = Mesh(_arg_1.objects[0]);
         var _local_3:BSP = new BSP();
         _local_3.createTree(_local_2);
         var _local_4:BitmapData = _arg_1.getTextureForObject(0);
         if(_local_4 == null)
         {
            _local_4 = new StubBitmapData(16776960);
         }
         var _local_5:TextureMaterial = suner.getMaterial(_local_4);
         _local_5.resolution = 1;
         _local_3.setMaterialToAllFaces(_local_5);
         return _local_3;
      }
      
      private static function byqujemol(_arg_1:Object, _arg_2:uint) : void
      {
         _arg_1[qeva] = new Myj(localeService.getText(TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL),_arg_2);
         _arg_1[myca] = new Myj(localeService.getText(TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL),_arg_2);
         _arg_1[lodaqi] = new Myj(localeService.getText(TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL),_arg_2);
         _arg_1[vesujaq] = new Myj(localeService.getText(TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL),_arg_2);
      }
      
      private static function nyzavu(_arg_1:BattleTeam) : BattleTeam
      {
         return _arg_1 == BattleTeam.BLUE ? BattleTeam.RED : BattleTeam.BLUE;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function hapyqyv() : BattleType
      {
         return BattleType.CTF;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _local_1:Nefoq = getInitParam().rero;
         this.flagDropSound = _local_1.flagDropSound.sound;
         this.flagReturnSound = _local_1.flagReturnSound.sound;
         this.flagTakeSound = _local_1.flagTakeSound.sound;
         this.winSound = _local_1.winSound.sound;
         this.sagal = new Dictionary();
         this.cigypy = new Vector.<Cihuqacyp>();
         this.koq();
         var _local_2:IModelService = IModelService(OSGi.getInstance().getService(IModelService));
         this.inventoryModel = Bibeza(_local_2.getModelsByInterface(Bibeza)[0]);
         this.seki = Tupebeput(OSGi.getInstance().getService(Tupebeput));
         this.sijod = Pypi(OSGi.getInstance().getService(Pypi));
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.dejysa.bijoja();
         this.nigur();
         this.kibiqako();
      }
      
      private function kibiqako() : void
      {
         this.flags = new Dictionary();
         var _local_1:Dusy = getInitParam();
         this.wate(BattleTeam.RED,_local_1.sacymowuw,_local_1.redFlagSprite.data,_local_1.redPedestalModel);
         this.wate(BattleTeam.BLUE,_local_1.gip,_local_1.blueFlagSprite.data,_local_1.bluePedestalModel);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         var _local_1:Byjeso = null;
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         for each(_local_1 in this.flags)
         {
            _local_1.dispose();
         }
         this.flags = null;
         this.seki = null;
         this.gaz = null;
         this.sagal = null;
         this.cigypy = null;
         this.dejysa.ciqon();
         this.qedohat = null;
         battleService.lipa(null);
         battleService.nygeq(null);
         battleService.cocuk(null);
         battleService.sipase(null);
      }
      
      [Obfuscation(rename="false")]
      public function flagTaken(_arg_1:String, _arg_2:BattleTeam) : void
      {
         var _local_3:Byjeso = null;
         var _local_4:Byjeso = this.moverace(_arg_2);
         var _local_5:Tank = this.sagal[_arg_1];
         if(this.gaz != null && this.gaz == _local_5)
         {
            this.weqoq(_local_4,_arg_1,_local_5);
         }
         else
         {
            this.wucezycoh(_local_4,_arg_1,_local_5);
         }
         if(this.gaz != null || battleInfoService.isSpectatorMode())
         {
            this.bam(_local_4);
            if(_local_5 == this.gaz && this.gaz != null)
            {
               _local_3 = this.moverace(this.gaz.teamType);
               if(_local_3.rosobif == null)
               {
                  this.cageh(_local_3);
               }
            }
            this.rebuc(_arg_1,_arg_2);
            battleService.kyfyrid.nekile(this.flagTakeSound);
         }
         this.seki.rim(_arg_2);
      }
      
      private function rebuc(_arg_1:String, _arg_2:BattleTeam) : void
      {
         var _local_3:Myj = null;
         var _local_4:Boolean = false;
         if(battleInfoService.isSpectatorMode())
         {
            _local_3 = this.wovi(qeva,nyzavu(_arg_2));
         }
         else if(this.gaz.teamType != null)
         {
            _local_4 = this.gaz.teamType != _arg_2;
            _local_3 = this.mofajypuv(qeva,_local_4);
         }
         if(_local_3 != null)
         {
            this.gam(_local_3,_arg_1);
            this.seki.logUserAction(_arg_1,_local_3.text,null);
         }
      }
      
      [Obfuscation(rename="false")]
      public function returnFlagToBase(_arg_1:BattleTeam, _arg_2:String) : void
      {
         this.qytenilym(_arg_1);
         if(battleInfoService.isSpectatorMode())
         {
            this.misa(_arg_1,_arg_2);
         }
         else if(Boolean(this.gaz) && Boolean(this.gaz.teamType))
         {
            this.nyl(_arg_1,_arg_2);
         }
         battleService.kyfyrid.nekile(this.flagReturnSound);
      }
      
      private function misa(_arg_1:BattleTeam, _arg_2:String) : void
      {
         var _local_3:Myj = null;
         var _local_4:Myj = null;
         if(Boolean(_arg_2))
         {
            _local_3 = this.wovi(lodaqi,_arg_1);
            this.gam(_local_3,_arg_2);
            this.seki.logUserAction(_arg_2,_local_3.text,null);
         }
         else
         {
            _local_4 = _arg_1 == BattleTeam.BLUE ? this.wygezew : this.lycumivul;
            this.seki.tagew(_local_4.color,_local_4.text);
         }
      }
      
      private function nyl(_arg_1:BattleTeam, _arg_2:String) : void
      {
         var _local_3:String = null;
         var _local_4:* = this.gaz.teamType == _arg_1;
         var _local_5:Myj = this.mofajypuv(lodaqi,_local_4);
         if(Boolean(_arg_2))
         {
            this.gam(_local_5,_arg_2);
            this.seki.logUserAction(_arg_2,_local_5.text,null);
         }
         else
         {
            _local_3 = !_local_4 ? this.sucu : this.bewa;
            this.seki.tagew(_local_5.color,_local_3);
         }
      }
      
      [Obfuscation(rename="false")]
      public function dropFlag(_arg_1:Vector3d, _arg_2:BattleTeam) : void
      {
         var _local_3:Byjeso = this.moverace(_arg_2);
         this.nakobuzy(_local_3);
         this.seki.naly(_local_3.teamType);
         this.zynuho(_local_3);
         _local_3.vafekuny(new Vector3(_arg_1.x,_arg_1.y,_arg_1.z));
      }
      
      private function zynuho(_arg_1:Byjeso) : void
      {
         var _local_2:Byjeso = null;
         if(this.gaz == null)
         {
            return;
         }
         if(_arg_1.rosobif == null)
         {
            return;
         }
         if(this.gaz.fiveqejav(_arg_1.teamType))
         {
            this.naca(null);
         }
         if(_arg_1.rosobif == this.gaz)
         {
            if(this.tyc)
            {
               this.tyc = false;
               battleService.getBattleRunner().wop(new Hewofyh(this,getTimer() + jydicel));
            }
            _local_2 = this.hapafose(_arg_1.teamType);
            if(_local_2.state == Tawytuqe.AT_BASE)
            {
               this.bam(_local_2);
            }
         }
         else
         {
            this.cageh(_arg_1);
         }
      }
      
      private function nakobuzy(_arg_1:Byjeso) : void
      {
         if(_arg_1.rosobif == null)
         {
            return;
         }
         var _local_2:Myj = this.romok(_arg_1.teamType);
         if(_local_2 != null)
         {
            this.gam(_local_2,_arg_1.rosobif.tankData.userName);
            this.seki.logUserAction(_arg_1.rosobif.tankData.userName,_local_2.text,null);
            battleService.kyfyrid.nekile(this.flagDropSound);
         }
      }
      
      private function romok(_arg_1:BattleTeam) : Myj
      {
         var _local_2:Boolean = false;
         if(battleInfoService.isSpectatorMode())
         {
            return this.wovi(myca,nyzavu(_arg_1));
         }
         if(Boolean(this.gaz) && Boolean(this.gaz.teamType))
         {
            _local_2 = this.gaz.fiveqejav(_arg_1);
            return this.mofajypuv(myca,_local_2);
         }
         return null;
      }
      
      [Obfuscation(rename="false")]
      public function flagDelivered(_arg_1:BattleTeam, _arg_2:String) : void
      {
         var _local_3:Tank = null;
         var _local_4:Myj = null;
         this.qytenilym(BattleUtils.coqopale(_arg_1));
         if(this.gaz != null || battleInfoService.isSpectatorMode())
         {
            _local_3 = this.sagal[_arg_2];
            if(_local_3 != null)
            {
               if(battleInfoService.isSpectatorMode())
               {
                  _local_4 = this.wovi(vesujaq,_arg_1);
               }
               else
               {
                  _local_4 = this.mofajypuv(vesujaq,this.gaz.teamType == _arg_1);
               }
               this.gam(_local_4,_arg_2);
               this.seki.logUserAction(_arg_2,_local_4.text,null);
               battleService.kyfyrid.nekile(this.winSound);
            }
         }
      }
      
      public function jydupyv() : void
      {
         this.inventoryModel.wazetap(Johad.MINE,Gazib.dyzupoqy,true);
      }
      
      public function nera() : void
      {
         this.inventoryModel.wazetap(Johad.MINE,Gazib.dyzupoqy,false);
      }
      
      public function gykiha(_arg_1:Byjeso) : void
      {
         this.bam(_arg_1);
         this.dejysa.dispatchEvent(Vegepos.figahe);
         server.gykiha(this.gaz,_arg_1.teamType.name);
      }
      
      public function jebycu() : void
      {
         var _local_1:Byjeso = this.hapafose(this.gaz.teamType);
         if(_local_1.state != Tawytuqe.CARRIED)
         {
            this.cageh(_local_1);
         }
      }
      
      private function wate(_arg_1:BattleTeam, _arg_2:Lyf, _arg_3:BitmapData, _arg_4:Tanks3DSResource) : void
      {
         var _local_5:Byjeso = null;
         var _local_6:Vector3 = null;
         if(_arg_3 == null)
         {
            _arg_3 = new BitmapData(muwacyco,waferihe,false,_arg_1 == BattleTeam.RED ? uint(11141120) : uint(170));
         }
         var _local_7:TextureAnimation = GraphicsUtils.getTextureAnimation(suner,_arg_3,muwacyco,_arg_3.height,0,false);
         var _local_8:Vector3 = new Vector3(_arg_2.vylon.x,_arg_2.vylon.y,_arg_2.vylon.z);
         var _local_9:BattleScene3D = battleService.getBattleScene3D();
         _local_5 = new Byjeso(_arg_1,_local_8,muwacyco,waferihe,_local_7,battleService.getBattleRunner().soc(),this);
         this.flags[_arg_1] = _local_5;
         _local_5.addToScene();
         if(_arg_2.dumetone != null)
         {
            this.wucezycoh(_local_5,_arg_2.dumetone,this.sagal[_arg_2.dumetone]);
            this.seki.rim(_arg_1);
         }
         else if(_arg_2.rulijo != null)
         {
            _local_6 = new Vector3();
            _local_6.x = _arg_2.rulijo.x;
            _local_6.y = _arg_2.rulijo.y;
            _local_6.z = _arg_2.rulijo.z;
            _local_5.vafekuny(_local_6);
            this.seki.naly(_arg_1);
         }
         _local_9.toqok(_local_5,1);
         _local_9.tiziqec.add(_local_5);
         this.japecisa(_arg_4,_arg_2);
      }
      
      private function japecisa(_arg_1:Tanks3DSResource, _arg_2:Lyf) : void
      {
         var _local_3:Object3D = fipisoqiz(_arg_1);
         var _local_4:Vector3 = BattleUtils.haq(_arg_2.vylon);
         _local_4.z -= niry;
         _local_3.x = _local_4.x;
         _local_3.y = _local_4.y;
         _local_3.z = _local_4.z;
         battleService.getBattleScene3D().addObject(_local_3);
         var _local_5:TanksCollisionDetector = battleService.getBattleRunner().soc();
         var _local_6:Cihuqacyp = new Cihuqacyp(_local_4,200,this,_local_5);
         this.cigypy.push(_local_6);
         battleService.getBattleRunner().wapicyjim(_local_6);
      }
      
      private function qytenilym(_arg_1:BattleTeam) : void
      {
         var _local_2:Byjeso = null;
         this.tyc = false;
         var _local_3:Byjeso = this.moverace(_arg_1);
         _local_3.keqipihe();
         if(Boolean(this.gaz) && Boolean(this.gaz.teamType))
         {
            if(this.gaz.fiveqejav(_arg_1))
            {
               this.naca(null);
               _local_2 = this.hapafose(_arg_1);
               if(_local_2.rosobif == this.gaz)
               {
                  this.cageh(_local_3);
               }
               else
               {
                  this.bam(_local_3);
               }
            }
            else
            {
               this.cageh(_local_3);
            }
         }
         this.seki.kun(_arg_1);
      }
      
      private function koq() : void
      {
         this.pena = {};
         this.tokopob = {};
         this.gepu = {};
         this.koqycodap();
         byqujemol(this.tokopob,MessageColor.BLUE);
         byqujemol(this.gepu,MessageColor.RED);
         this.bewa = localeService.getText(TanksLocale.TEXT_CTF_OUR_FLAG_RETURNED);
         this.sucu = localeService.getText(TanksLocale.TEXT_CTF_ENEMY_FLAG_RETURNED);
         this.wygezew = new Myj(localeService.getText(TanksLocale.TEXT_CTF_BLUE_FLAG_RETURNED),MessageColor.BLUE);
         this.lycumivul = new Myj(localeService.getText(TanksLocale.TEXT_CTF_RED_FLAG_RETURNED),MessageColor.RED);
      }
      
      private function koqycodap() : void
      {
         this.fomih(qeva,TanksLocale.TEXT_CTF_GOT_ENEMY_FLAG,MessageColor.gajefo,TanksLocale.TEXT_CTF_GOT_OUR_FLAG,MessageColor.vase);
         this.fomih(myca,TanksLocale.TEXT_CTF_LOST_OUR_FLAG,MessageColor.gajefo,TanksLocale.TEXT_CTF_LOST_ENEMY_FLAG,MessageColor.vase);
         this.fomih(lodaqi,TanksLocale.TEXT_CTF_RETURNED_OUR_FLAG,MessageColor.gajefo,TanksLocale.TEXT_CTF_RETURNED_ENEMY_FLAG,MessageColor.vase);
         this.fomih(vesujaq,TanksLocale.TEXT_CTF_CAPTURED_ENEMY_FLAG,MessageColor.gajefo,TanksLocale.TEXT_CTF_CAPTURED_OUR_FLAG,MessageColor.vase);
      }
      
      private function fomih(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:String, _arg_5:uint) : void
      {
         var _local_6:Myj = new Myj(localeService.getText(_arg_2),_arg_3);
         var _local_7:Myj = new Myj(localeService.getText(_arg_4),_arg_5);
         this.pena[_arg_1] = new Wut(_local_6,_local_7);
      }
      
      private function mofajypuv(_arg_1:String, _arg_2:Boolean) : Myj
      {
         var _local_3:Wut = this.pena[_arg_1];
         return !_arg_2 ? _local_3.negative : _local_3.positive;
      }
      
      private function wovi(_arg_1:String, _arg_2:BattleTeam) : Myj
      {
         var _local_3:Object = _arg_2 == BattleTeam.BLUE ? this.tokopob : this.gepu;
         return _local_3[_arg_1];
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         var _local_2:GameActionEnum = tytol.jikamybu(_arg_1.keyCode);
         switch(_local_2)
         {
            case GameActionEnum.DROP_FLAG:
               this.mowu();
         }
      }
      
      private function mowu() : void
      {
         var _local_1:Byjeso = null;
         if(battleService.lurimire() && !norata.miwyraze() && this.gaz != null && !this.tyc)
         {
            _local_1 = this.hapafose(this.gaz.teamType);
            if(_local_1.rosobif == this.gaz)
            {
               this.tyc = true;
               this.dejysa.dispatchEvent(Vegepos.figahe);
               server.godi(this.gaz);
            }
         }
      }
      
      private function gam(_arg_1:Myj, _arg_2:String) : void
      {
         var _local_3:String = _arg_2 != null ? userInfoService.kiq(_arg_2) : null;
         if(Boolean(_local_3))
         {
            this.seki.tagew(_arg_1.color,_local_3 + " " + _arg_1.text);
         }
      }
      
      private function qoc(_arg_1:Rujina) : void
      {
         this.sagal[_arg_1.tank.tankData.userName] = _arg_1.tank;
         if(_arg_1.isLocal)
         {
            this.gaz = _arg_1.tank;
         }
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         var _local_2:Body = null;
         var _local_3:BodyState = null;
         var _local_4:Vector3 = null;
         var _local_5:Tank = _arg_1.tank;
         var _local_6:Byjeso = this.hapafose(_local_5.teamType);
         if(_local_6.rosobif == _local_5)
         {
            _local_2 = _local_5.qiniwu();
            _local_3 = _local_2.state;
            _local_4 = _local_3.position;
            this.dropFlag(BattleUtils.tazotipo(_local_4),_local_6.teamType);
         }
         delete this.sagal[_local_5.tankData.userName];
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         var _local_2:Byjeso = null;
         for each(_local_2 in this.flags)
         {
            if(_local_2.state == Tawytuqe.CARRIED && _local_2.wef == _arg_1.tank.tankData.userName)
            {
               this.wucezycoh(_local_2,_local_2.wef,_arg_1.tank);
               this.bam(_local_2);
               break;
            }
         }
      }
      
      private function doqafeb(_arg_1:Object) : void
      {
         var _local_2:CTFTargetEvaluator = null;
         var _local_3:Byjeso = this.moverace(this.gaz.teamType);
         if(_local_3.state == Tawytuqe.DROPPED)
         {
            this.cageh(_local_3);
         }
         var _local_4:Byjeso = this.hapafose(this.gaz.teamType);
         if(_local_4.state != Tawytuqe.CARRIED)
         {
            this.cageh(_local_4);
         }
         for each(_local_2 in this.qedohat)
         {
            _local_2.bobaku(this.gaz.teamType);
         }
      }
      
      private function fabademyl(_arg_1:Vopetycy) : void
      {
         var _local_2:Byjeso = null;
         if(this.gaz != null && this.gaz == _arg_1.cuzipin)
         {
            for each(_local_2 in this.flags)
            {
               this.bam(_local_2);
            }
         }
      }
      
      private function necyjiw(_arg_1:Object) : void
      {
         var _local_2:Cihuqacyp = null;
         this.qytenilym(BattleTeam.BLUE);
         this.qytenilym(BattleTeam.RED);
         for each(_local_2 in this.cigypy)
         {
            _local_2.reset();
         }
      }
      
      private function byzac(_arg_1:Object) : void
      {
         var _local_2:Byjeso = null;
         this.tyc = false;
         for each(_local_2 in this.flags)
         {
            this.bam(_local_2);
         }
      }
      
      private function cageh(_arg_1:Byjeso) : void
      {
         if(this.gaz != null && this.gaz.state == ClientTankState.neqahi && battleService.lurimire())
         {
            battleService.getBattleRunner().wapicyjim(_arg_1);
         }
      }
      
      private function bam(_arg_1:Byjeso) : void
      {
         battleService.getBattleRunner().zegyrak(_arg_1);
      }
      
      private function weqoq(_arg_1:Byjeso, _arg_2:String, _arg_3:Tank) : void
      {
         _arg_1.jehe(_arg_2,_arg_3);
         this.nir(_arg_1,_arg_3);
      }
      
      private function wucezycoh(_arg_1:Byjeso, _arg_2:String, _arg_3:Tank) : void
      {
         _arg_1.polydad(_arg_2,_arg_3);
         this.nir(_arg_1,_arg_3);
      }
      
      private function nir(_arg_1:Byjeso, _arg_2:Tank) : void
      {
         if(_arg_2 != null && this.gaz != null && this.gaz.fiveqejav(_arg_1.teamType))
         {
            this.naca(_arg_2.qiniwu());
         }
      }
      
      private function nigur() : void
      {
         this.qedohat = new Vector.<CTFTargetEvaluator>();
         var _local_1:Lib = new Lib();
         battleService.lipa(_local_1);
         this.qedohat.push(_local_1);
         var _local_2:Mowupime = new Mowupime();
         battleService.nygeq(_local_2);
         this.qedohat.push(_local_2);
         var _local_3:Nodof = new Nodof();
         battleService.cocuk(_local_3);
         this.qedohat.push(_local_3);
         var _local_4:Kadiwitu = new Kadiwitu();
         battleService.sipase(_local_4);
         this.qedohat.push(_local_4);
      }
      
      private function naca(_arg_1:Body) : void
      {
         var _local_2:CTFTargetEvaluator = null;
         for each(_local_2 in this.qedohat)
         {
            _local_2.siga(_arg_1);
         }
      }
      
      private function moverace(_arg_1:BattleTeam) : Byjeso
      {
         return this.flags[_arg_1];
      }
      
      private function hapafose(_arg_1:BattleTeam) : Byjeso
      {
         return this.flags[BattleUtils.coqopale(_arg_1)];
      }
      
      public function gemokir() : Zer
      {
         var _local_1:Kadiwitu = new Kadiwitu();
         this.qedohat.push(_local_1);
         return _local_1;
      }
   }
}

