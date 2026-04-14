package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.UserTitleRenderer;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Gyjohul implements UserTitleRenderer, AutoClosable, BattleEventListener
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const hogelan:EncryptedNumber = new EncryptedNumberImpl(7000);
      
      private static const kotadod:EncryptedNumber = new EncryptedNumberImpl(7050);
      
      private const qonibaf:Dictionary = new Dictionary();
      
      private var gaz:Tank;
      
      private var dejysa:Baba;
      
      public function Gyjohul(_arg_1:Tank, _arg_2:Dictionary)
      {
         super();
         this.gaz = _arg_1;
         this.fajimabed(_arg_2);
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.bijoja();
      }
      
      private function fajimabed(_arg_1:Dictionary) : void
      {
         var _local_2:Tank = null;
         for each(_local_2 in _arg_1)
         {
            if(_local_2 != this.gaz)
            {
               this.qonibaf[_local_2] = true;
            }
         }
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         if(_arg_1.tank != this.gaz)
         {
            this.qonibaf[_arg_1.tank] = true;
         }
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         if(_arg_1.tank != this.gaz)
         {
            delete this.qonibaf[_arg_1.tank];
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function zadajav() : void
      {
         var _local_1:* = undefined;
         var _local_2:BattleScene3D = battleService.getBattleScene3D();
         var _local_3:GameCamera = _local_2.cewubu();
         var _local_4:Vector3 = _local_3.position;
         for(_local_1 in this.qonibaf)
         {
            this.laro(_local_1,_local_4);
         }
      }
      
      private function laro(_arg_1:Tank, _arg_2:Vector3) : void
      {
         if(_arg_1.tankData.health > 0)
         {
            if(this.gaz.fiveqejav(_arg_1.teamType))
            {
               _arg_1.weka();
            }
            else
            {
               this.kuket(_arg_1,_arg_2);
            }
         }
         else
         {
            _arg_1.wep();
         }
      }
      
      private function kuket(_arg_1:Tank, _arg_2:Vector3) : void
      {
         var _local_3:Body = _arg_1.qiniwu();
         var _local_4:BodyState = _local_3.state;
         var _local_5:Vector3 = _local_4.position;
         var _local_6:Number = _local_5.x - _arg_2.x;
         var _local_7:Number = _local_5.y - _arg_2.y;
         var _local_8:Number = _local_5.z - _arg_2.z;
         var _local_9:Number = Math.sqrt(_local_6 * _local_6 + _local_7 * _local_7 + _local_8 * _local_8);
         if(_local_9 >= kotadod.getNumber() || _arg_1.konusah(_arg_2))
         {
            _arg_1.wep();
         }
         else if(_local_9 < hogelan.getNumber())
         {
            _arg_1.weka();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.dejysa.ciqon();
         this.dejysa = null;
         this.gaz = null;
         clearDictionary(this.qonibaf);
      }
   }
}

