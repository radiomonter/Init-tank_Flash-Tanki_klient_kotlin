package obfuscation.fafiqu
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.sfx.GraphicEffect;
   import obfuscation.rofa.Puqo;
   
   public class Nyf implements GraphicEffect
   {
      
      private static var rojaby:IModelService = IModelService(OSGi.getInstance().getService(IModelService));
      
      private static var delay:ConsoleVarInt = new ConsoleVarInt("tankexpl_goffset",110,0,2000);
      
      private var tankData:Num;
      
      private var time:int;
      
      private var tydobe:Boolean;
      
      public function Nyf(_arg_1:Num)
      {
         super();
         this.tankData = _arg_1;
      }
      
      public function destroy() : void
      {
         this.tankData = null;
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         if(this.tydobe)
         {
            return false;
         }
         if(this.time >= delay.value)
         {
            this.qav();
            return false;
         }
         this.time += _arg_1;
         return true;
      }
      
      public function kill() : void
      {
         this.tydobe = true;
      }
      
      public function qojyf(_arg_1:Scene3DContainer) : void
      {
         this.time = 0;
         this.tydobe = false;
      }
      
      private function qav() : void
      {
         var _local_1:Tank = null;
         var _local_2:Kyqifav = null;
         try
         {
            _local_1 = this.tankData.tank;
            _local_1.qiniwu().clearAccumulators();
            _local_1.bij().qafubohy();
            _local_1.qiniwu().state.velocity.z = _local_1.qiniwu().state.velocity.z + 500;
            _local_1.qiniwu().state.angularVelocity.reset(2,2,2);
            _local_2 = OSGi.getInstance().getService(Vamobanoc) as Kyqifav;
            _local_2.zazyra(null,this.tankData.tank,Puqo.jaw);
         }
         catch(e:Error)
         {
         }
      }
   }
}

