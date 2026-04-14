package alternativa.tanks.service.battle
{
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleUserInfoService implements IBattleUserInfoService
   {
      
      [Inject]
      public static var logService:LogService;
      
      private var winyn:Dictionary = new Dictionary();
      
      public function BattleUserInfoService()
      {
         super();
      }
      
      public function fitaqo(_arg_1:String) : Boolean
      {
         return _arg_1 in this.winyn;
      }
      
      public function debet(_arg_1:String) : IGameObject
      {
         return this.winyn[_arg_1];
      }
      
      public function connect(_arg_1:String, _arg_2:IGameObject) : void
      {
         this.winyn[_arg_1] = _arg_2;
      }
      
      public function disconnect(_arg_1:String) : void
      {
         delete this.winyn[_arg_1];
      }
      
      public function tofawa(_arg_1:IGameObject) : void
      {
         var _local_3:String = null;
         var _local_2:* = undefined;
         for(_local_2 in this.winyn)
         {
            _local_3 = this.winyn[_local_2];
            if(_local_3 == _arg_1)
            {
               this.disconnect(_local_2);
            }
         }
      }
   }
}

