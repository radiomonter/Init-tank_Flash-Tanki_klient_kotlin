package obfuscation.hizohofog
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.kyre.Myw;
   import platform.client.fp10.core.model.IModel;
   
   public class Jomub
   {
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var model:IModel;
      
      private var network:Network = OSGi.getInstance().getService(INetworker) as Network;
      
      private var byhavineg:Long = Long.getLong(896493825,-1828539754);
      
      public function Jomub(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function godi(_arg_1:Tank) : void
      {
         var _local_3:Boolean = false;
         var _local_2:Object = new Object();
         _local_2.x = _arg_1.qiniwu().state.position.x;
         _local_2.y = _arg_1.qiniwu().state.position.y;
         _local_2.z = _arg_1.qiniwu().state.position.z;
         if((OSGi.getInstance().getService(BattleService) as BattleService).getBattleRunner().soc().raycastStatic(_arg_1.qiniwu().state.position,new Vector3(0,0,-20000),Myw.dyhan,1,null,fawevotoj))
         {
            _local_3 = true;
         }
         this.network.send("battle;flag_drop;" + JSON.stringify(_local_2) + ";" + _local_3.toString());
      }
      
      public function gykiha(_arg_1:Tank, _arg_2:String) : void
      {
         this.network.send("battle;attempt_to_take_flag;" + _arg_2.toUpperCase());
      }
   }
}

