package obfuscation.fatik
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.getTimer;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.kewic.Pafijoban;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.samelosin.Fabiwo;
   
   public class Docokesy extends BattleRunnerProvider implements Weapon, LogicUnit
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static var shotId:int;
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private static const kefemuko:AllGlobalGunParams = new AllGlobalGunParams();
      
      private var pepezemu:Number;
      
      private var qip:Number;
      
      private var jahary:int;
      
      private var gez:int;
      
      private var nywyv:WeaponPlatform;
      
      private var controller:Lerih = new Lerih();
      
      private var faki:Bakybyb;
      
      private var peq:int;
      
      private var effects:Futywyq;
      
      private var kowyh:Vijiv;
      
      private var callback:Vanebegum;
      
      private var enabled:Boolean;
      
      private var huzes:Pafijoban;
      
      public function Docokesy(_arg_1:ClientObject, _arg_2:Pafijoban, _arg_3:Vevizajis, _arg_4:Vanebegum)
      {
         super();
         var _local_5:Vevizajis = _arg_3;
         var _local_6:WeaponObject = new WeaponObject(_arg_1);
         var _local_7:Vanebegum = _arg_4;
         this.huzes = _arg_2;
         this.pepezemu = _local_6.cywyzugej().razo();
         this.qip = _arg_2.energyRechargeSpeed / 1000;
         var _local_8:Fabiwo = WeaponsManager.shotDatas[_local_6.nac().turret.id];
         this.faki = pamylip(_local_8,_arg_2);
         this.peq = _local_6.qegotody();
         this.effects = _local_5.fucine(_arg_1);
         this.kowyh = new Vijiv(_local_6,_arg_2,_local_5.wycako(_arg_1),_local_7);
         this.callback = _local_7;
      }
      
      private static function pamylip(_arg_1:Fabiwo, _arg_2:Pafijoban) : Bakybyb
      {
         var _local_3:Number = _arg_1.vom.value;
         var _local_4:int = _arg_1.votyfyzo.value;
         var _local_5:Number = _arg_1.dyrewuneb.value;
         var _local_6:int = _arg_1.dyheh.value;
         var _local_7:Number = _arg_2.shotDistance;
         var _local_8:TanksCollisionDetector = battleService.getBattleRunner().soc();
         return new Bakybyb(_local_3,_local_4,_local_5,_local_6,_local_7,_local_8,battleService.gemokir(),_arg_2.maxRicochetCount);
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.huzes = null;
         this.effects = null;
         this.callback = null;
         this.faki = null;
         this.controller.destroy();
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
            this.controller.hilaq();
         }
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.gez = 0;
         this.jahary = 0;
         this.controller.hilaq();
      }
      
      public function getStatus() : Number
      {
         return this.nase(getTimer()) / this.huzes.energyCapacity;
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         if(this.enabled)
         {
            if(this.controller.selipil() && _arg_1 >= this.jahary)
            {
               _local_3 = this.nase(_arg_1);
               if(_local_3 >= this.huzes.energyPerShot)
               {
                  this.pekuna(_arg_1,_local_3);
               }
            }
         }
         this.controller.hilaq();
      }
      
      private function pekuna(_arg_1:int, _arg_2:Number) : void
      {
         this.jahary = _arg_1 + this.peq;
         this.letihajo(_arg_1,_arg_2 - this.huzes.energyPerShot);
         this.nywyv.gytamy(kefemuko);
         this.nywyv.fufyvi();
         this.wagecup(kefemuko.vegenel,kefemuko.direction,-this.pepezemu);
         this.effects.dimiled(this.nywyv.qenokeru(),this.nywyv.getynos(),kefemuko.vegenel);
         this.effects.hez(this.nywyv.qenokeru(),this.nywyv.getynos());
         if(BattleUtils.cetyryju(this.nywyv.qiniwu(),kefemuko))
         {
            this.beve(_arg_1,kefemuko);
         }
         else
         {
            this.sosir(_arg_1);
         }
      }
      
      private function wagecup(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         this.nywyv.qiniwu().addWorldForceScaled(_arg_1,_arg_2,_arg_3);
      }
      
      private function beve(_arg_1:int, _arg_2:AllGlobalGunParams) : void
      {
         if(this.kakogylyh(_arg_2.hiwanu,_arg_2.direction,this.nywyv.holuzorow()))
         {
            shotDirection.copy(_arg_2.direction);
         }
         else
         {
            this.faki.jyliry(_arg_2.vegenel,_arg_2.direction,_arg_2.navi,this.nywyv.qiniwu(),shotDirection);
         }
         this.fivise(_arg_1,_arg_2,shotDirection);
      }
      
      private function sosir(_arg_1:int) : void
      {
         this.callback.hab(_arg_1);
      }
      
      private function kakogylyh(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : Boolean
      {
         return fahysemas().soc().raycastStatic(_arg_1,_arg_2,Myw.dyhan,_arg_3,null,fawevotoj);
      }
      
      private function nase(_arg_1:int) : Number
      {
         return MathUtils.clamp(this.qip * (_arg_1 - this.gez),0,this.huzes.energyCapacity);
      }
      
      private function letihajo(_arg_1:int, _arg_2:Number) : void
      {
         this.gez = _arg_1 - _arg_2 / this.qip;
      }
      
      private function fivise(_arg_1:int, _arg_2:AllGlobalGunParams, _arg_3:Vector3) : void
      {
         var _local_4:Pizafi = this.kowyh.zira();
         _local_4.rykysap(_arg_2,_arg_3,this.nywyv.qiniwu(),++shotId);
         this.callback.lydyn(_arg_1,_local_4.jobopa(),_arg_3);
      }
   }
}

