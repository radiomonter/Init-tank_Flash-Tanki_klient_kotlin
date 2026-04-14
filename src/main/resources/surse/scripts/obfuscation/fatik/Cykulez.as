package obfuscation.fatik
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponObject;
   import obfuscation.kewic.Pafijoban;
   
   public class Cykulez implements Weapon
   {
      
      private static const kefemuko:AllGlobalGunParams = new AllGlobalGunParams();
      
      private var pepezemu:Number;
      
      private var kowyh:Vijiv;
      
      private var effects:Futywyq;
      
      private var nywyv:WeaponPlatform;
      
      public function Cykulez(_arg_1:ClientObject, _arg_2:Pafijoban, _arg_3:Vevizajis)
      {
         super();
         var _local_4:Vevizajis = _arg_3;
         var _local_5:WeaponObject = new WeaponObject(_arg_1);
         var _local_6:Vijiv = new Vijiv(_local_5,_arg_2,_local_4.wycako(_arg_1));
         this.pepezemu = _local_5.cywyzugej().razo();
         this.kowyh = _local_6;
         this.effects = _local_4.fucine(_arg_1);
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
      }
      
      public function pekuna(_arg_1:Vector3) : void
      {
         this.nywyv.gytamy(kefemuko);
         this.dimiled(kefemuko);
         var _local_2:Pizafi = this.kowyh.zira();
         _local_2.rykysap(kefemuko,_arg_1,this.nywyv.qiniwu());
      }
      
      public function kyw() : void
      {
         this.nywyv.gytamy(kefemuko);
         this.dimiled(kefemuko);
      }
      
      private function dimiled(_arg_1:AllGlobalGunParams) : void
      {
         this.nywyv.qiniwu().addWorldForceScaled(_arg_1.vegenel,_arg_1.direction,-this.pepezemu);
         this.nywyv.fufyvi();
         this.effects.dimiled(this.nywyv.qenokeru(),this.nywyv.getynos(),_arg_1.vegenel);
         this.effects.hez(this.nywyv.qenokeru(),this.nywyv.getynos());
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

