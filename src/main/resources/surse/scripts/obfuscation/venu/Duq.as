package obfuscation.venu
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Qibakid;
   import alternativa.tanks.models.weapons.targeting.Sib;
   import flash.utils.getTimer;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.kyre.Myw;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.samona.Diqije;
   
   public class Duq extends BattleRunnerProvider implements Weapon, LogicUnit
   {
      
      private static var shotId:int;
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private var jusob:int;
      
      private var peq:int;
      
      private var pepezemu:Number;
      
      private var controller:Lerih;
      
      private var nywyv:WeaponPlatform;
      
      private var enabled:Boolean;
      
      private var faki:Fetajid;
      
      private var currentBarrel:int;
      
      private var callback:Jihidy;
      
      private var kowyh:Mureke;
      
      private var effects:Kurivyq;
      
      private var weakening:DistanceWeakening;
      
      public function Duq(_arg_1:ClientObject, _arg_2:ClientObject, _arg_3:Diqije, _arg_4:Virijih, _arg_5:Jihidy)
      {
         super();
         var _local_6:WeaponObject = new WeaponObject(_arg_1);
         var _local_7:DistanceWeakening = _local_6.wazalaje();
         var _local_8:Vodujyse = _local_6.cywyzugej();
         var _local_9:Jihidy = _arg_5;
         var _local_10:Virijih = _arg_4;
         var _local_11:Mureke = new Mureke(_local_6,_arg_3,_local_10.bicoqilyp(_arg_1),_local_9);
         var _local_12:Fetajid = new Qibakid(_arg_1,_local_6,_local_7.wyky());
         _local_12.fojy().sab();
         var _local_13:Lerih = new Lerih();
         this.peq = _local_6.qegotody();
         this.pepezemu = _local_8.razo();
         this.controller = _local_13;
         this.faki = _local_12;
         this.callback = _local_9;
         this.kowyh = _local_11;
         this.effects = _local_10.kiravuru(_arg_1);
         this.weakening = _local_7;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.faki = null;
         this.effects = null;
         this.controller.destroy();
         this.controller = null;
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
         this.controller.hilaq();
         this.jusob = 0;
         this.currentBarrel = 0;
      }
      
      public function getStatus() : Number
      {
         var _local_1:Number = 1 - (this.jusob - getTimer()) / this.peq;
         return _local_1 > 1 ? Number(1) : Number(_local_1);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(this.enabled)
         {
            if(this.controller.selipil() && _arg_1 >= this.jusob)
            {
               this.pekuna(_arg_1);
            }
         }
         this.controller.hilaq();
      }
      
      private function pekuna(_arg_1:int) : void
      {
         this.jusob = _arg_1 + this.peq;
         this.nywyv.gytamy(betyqiju,this.currentBarrel);
         this.nywyv.qiniwu().addWorldForceScaled(betyqiju.vegenel,betyqiju.direction,-this.pepezemu);
         this.nywyv.fufyvi(1);
         this.effects.dimiled(this.nywyv.qenokeru(),this.nywyv.getynos(this.currentBarrel));
         if(BattleUtils.cetyryju(this.nywyv.qiniwu(),betyqiju))
         {
            this.beve(_arg_1,betyqiju);
         }
         else
         {
            this.sosir(_arg_1);
         }
         this.currentBarrel = (this.currentBarrel + 1) % this.nywyv.sypibi();
      }
      
      private function beve(_arg_1:int, _arg_2:AllGlobalGunParams) : void
      {
         var _local_3:Sib = null;
         if(this.kakogylyh(_arg_2.hiwanu,_arg_2.direction,this.nywyv.holuzorow(this.currentBarrel)))
         {
            shotDirection.copy(_arg_2.direction);
         }
         else
         {
            _local_3 = this.faki.target(_arg_2);
            shotDirection.copy(_local_3.jesenebo());
         }
         var _local_4:Qeg = this.kowyh.zira();
         _local_4.rykysap(_arg_2,shotDirection,this.nywyv.qiniwu(),++shotId);
         this.callback.lydyn(_arg_1,_local_4.jobopa(),this.currentBarrel,shotDirection);
      }
      
      private function kakogylyh(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : Boolean
      {
         return fahysemas().soc().raycastStatic(_arg_1,_arg_2,Myw.dyhan,_arg_3,null,fawevotoj);
      }
      
      private function sosir(_arg_1:int) : void
      {
         this.callback.hab(_arg_1,this.currentBarrel);
      }
   }
}

