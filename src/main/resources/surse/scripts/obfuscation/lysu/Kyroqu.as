package obfuscation.lysu
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.utils.TextureMaterialRegistry;
   import obfuscation.bude.BattleTeam;
   import obfuscation.syhis.Hegug;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Kyroqu
   {
      
      private static const wehaveh:ConsoleVarFloat = new ConsoleVarFloat("beam_width",100,0,1000);
      
      private static const badeqebi:ConsoleVarFloat = new ConsoleVarFloat("beam_ulength",500,0,10000);
      
      private static const cytut:ConsoleVarFloat = new ConsoleVarFloat("beam_anim_speed",-0.6,-1000,1000);
      
      private static const fofi:ConsoleVarFloat = new ConsoleVarFloat("beam_urange",0.6,0.1,1);
      
      private static const nig:ConsoleVarFloat = new ConsoleVarFloat("beam_alpha",1,0,1);
      
      private var nybejan:Sivebu;
      
      private var cyb:Sivebu;
      
      public function Kyroqu(_arg_1:TextureMaterialRegistry, _arg_2:Hegug)
      {
         super();
         this.nybejan = siduda(_arg_1,_arg_2.blueRay,_arg_2.blueRayTip,50,100,1,1,1);
         this.cyb = siduda(_arg_1,_arg_2.redRay,_arg_2.redRayTip,50,100,1,1,1);
      }
      
      private static function siduda(_arg_1:TextureMaterialRegistry, _arg_2:ImageResource, _arg_3:ImageResource, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number) : Sivebu
      {
         var _local_9:TextureMaterial = null;
         _local_9 = _arg_1.getMaterial(_arg_2.data);
         _local_9.repeat = true;
         var _local_10:TextureMaterial = _arg_1.getMaterial(_arg_3.data);
         return new Sivebu(_local_9,_local_10,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
      }
      
      private static function cikakily(_arg_1:Sivebu) : Sivebu
      {
         return new Sivebu(_arg_1.henipaz,_arg_1.cemar,wehaveh.value,badeqebi.value,cytut.value,fofi.value,nig.value);
      }
      
      private function byhiqun() : Sivebu
      {
         return cikakily(this.nybejan);
      }
      
      private function wefowo() : Sivebu
      {
         return cikakily(this.cyb);
      }
      
      public function kekapa(_arg_1:BattleTeam) : Sivebu
      {
         return _arg_1 == BattleTeam.BLUE ? this.byhiqun() : this.wefowo();
      }
   }
}

