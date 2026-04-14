package obfuscation.lin
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.types.Long;
   import flash.media.Sound;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.Tyno;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Gacisucy implements Zyhogy
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var listener:Gewi;
      
      private var hanybi:int;
      
      public function Gacisucy()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         if(this.listener == null)
         {
            this.listener = new Gewi(null);
         }
         ++this.hanybi;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         --this.hanybi;
         if(this.hanybi == 0)
         {
            this.listener.close();
            this.listener = null;
         }
      }
      
      public function lud(_arg_1:Tank, _arg_2:int) : void
      {
         var _local_3:Tank = _arg_1;
         if(_local_3.state == ClientTankState.DEAD)
         {
            this.peqyrujyg(_arg_1.bebosaca(),_arg_2);
         }
         else
         {
            this.vupysit(_local_3,_arg_2);
         }
      }
      
      private function peqyrujyg(_arg_1:ClientObject, _arg_2:int) : void
      {
         var _local_3:Sarocely = new Sarocely(_arg_1,_arg_2);
         _arg_1.putParams(Sarocely,_local_3);
      }
      
      private function vupysit(_arg_1:Tank, _arg_2:int) : void
      {
         var _local_3:Tyno = new Tyno();
         _local_3.piqyqeqeb(_arg_1,_arg_2);
         this.vos(_arg_1);
      }
      
      private function vos(_arg_1:Tank) : void
      {
         var _local_2:Sound = null;
         var _local_3:Sound3D = null;
         var _local_4:Body = null;
         var _local_5:Vector3 = null;
         var _local_6:Sound3DEffect = null;
         var _local_7:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,158174))).sound;
         if(_local_7 != null)
         {
            _local_2 = _local_7;
            _local_3 = Sound3D.create(_local_2);
            _local_4 = _arg_1.qiniwu();
            _local_5 = _local_4.state.position.clone();
            _local_6 = Sound3DEffect.create(_local_5,_local_3,0,0);
            battleService.wikyhih(_local_6);
         }
      }
   }
}

