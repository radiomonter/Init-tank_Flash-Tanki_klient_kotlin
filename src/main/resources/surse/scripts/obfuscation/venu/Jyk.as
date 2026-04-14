package obfuscation.venu
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponObject;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.samona.Diqije;
   
   public class Jyk implements Weapon
   {
      
      private static const kefemuko:AllGlobalGunParams = new AllGlobalGunParams();
      
      private var pepezemu:Number;
      
      private var kowyh:Mureke;
      
      private var effects:Kurivyq;
      
      private var nywyv:WeaponPlatform;
      
      public function Jyk(_arg_1:ClientObject, _arg_2:Diqije, _arg_3:Virijih)
      {
         super();
         var _local_4:WeaponObject = new WeaponObject(_arg_1);
         var _local_5:Vodujyse = _local_4.cywyzugej();
         var _local_6:Virijih = _arg_3;
         var _local_7:Mureke = new Mureke(_local_4,_arg_2,_local_6.bicoqilyp(_arg_1));
         this.pepezemu = _local_5.razo();
         this.kowyh = _local_7;
         this.effects = _local_6.kiravuru(_arg_1);
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
      }
      
      public function cijafe(_arg_1:int, _arg_2:int, _arg_3:Vector3) : void
      {
         this.nywyv.gytamy(kefemuko,_arg_1);
         this.dimiled(_arg_1,kefemuko);
         var _local_4:Qeg = this.kowyh.zira();
         _local_4.rykysap(kefemuko,_arg_3,this.nywyv.qiniwu(),_arg_2);
      }
      
      public function nakole(_arg_1:int) : void
      {
         this.nywyv.gytamy(kefemuko,_arg_1);
         this.dimiled(_arg_1,kefemuko);
      }
      
      private function dimiled(_arg_1:int, _arg_2:AllGlobalGunParams) : void
      {
         this.nywyv.qiniwu().addWorldForceScaled(_arg_2.vegenel,_arg_2.direction,-this.pepezemu);
         this.nywyv.fufyvi(1);
         this.effects.dimiled(this.nywyv.qenokeru(),this.nywyv.getynos(_arg_1));
      }
      
      public function destroy() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(_arg_1:Boolean) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
   }
}

