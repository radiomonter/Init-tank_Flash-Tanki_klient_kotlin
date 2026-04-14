package obfuscation.lin
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoListener;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.ISpace;
   
   public class Gewi implements BattleUserInfoListener, AutoClosable
   {
      
      [Inject]
      public static var battleUserInfoService:BattleUserInfoService;
      
      private var space:ISpace;
      
      public function Gewi(_arg_1:ISpace)
      {
         super();
         this.space = _arg_1;
         battleUserInfoService.fugireza(this);
      }
      
      public function kigybyde(_arg_1:String, _arg_2:int) : void
      {
         var _local_4:Tank = null;
         try
         {
            _local_4 = TankModel(OSGi.getInstance().getService(ITankModel)).tankDataById[_arg_1].tank;
         }
         catch(e:Error)
         {
         }
         var _local_3:Zyhogy = Zyhogy(OSGi.getInstance().getService(Zyhogy));
         _local_3.lud(_local_4,_arg_2);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.space = null;
         battleUserInfoService.pucuke(this);
      }
      
      public function voboqi(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:Boolean) : void
      {
      }
      
      public function bos(_arg_1:String, _arg_2:Boolean) : void
      {
      }
   }
}

