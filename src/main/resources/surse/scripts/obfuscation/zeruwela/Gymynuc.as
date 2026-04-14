package obfuscation.zeruwela
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.BattlefieldEvents;
   import flash.utils.Dictionary;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kutyqypy.Zekuzejob;
   import obfuscation.lykegyc.Cok;
   import obfuscation.lykegyc.Higil;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.bonus.battle.Nasyvozuq;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Gymynuc extends Higil implements Cok, BattleEventListener, BattlefieldEvents
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var bonuses:Dictionary = new Dictionary();
      
      public function Gymynuc()
      {
         super();
         battleEventDispatcher.pugu(Vovakopy,this);
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.qesohi();
      }
      
      private function qesohi() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.bonuses)
         {
            this.removeBonus(_local_1);
         }
      }
      
      private function zowecizoh(_arg_1:IGameObject, _arg_2:String, _arg_3:Vector3d, _arg_4:int) : void
      {
         var _local_5:Zekuzejob = null;
         var _local_6:Bonus = null;
         if(_arg_1 != null)
         {
            _local_5 = Zekuzejob(_arg_1.adapt(Zekuzejob));
            _local_6 = _local_5.tohubyfoj(_arg_2);
            _local_6.spawn(new Vector3(_arg_3.x,_arg_3.y,_arg_3.z),_arg_4,getInitParam().lugij,getFunctionWrapper(this.kobe));
            this.bonuses[_local_6.bonusId] = _local_6;
         }
      }
      
      private function kobe(_arg_1:Bonus) : void
      {
         battleEventDispatcher.dispatchEvent(Vegepos.figahe);
         server.kykur(_arg_1.bonusId);
      }
      
      [Obfuscation(rename="false")]
      public function nehuzok(_arg_1:Vector.<Nasyvozuq>) : void
      {
         var _local_2:Nasyvozuq = null;
         if(_arg_1 != null)
         {
            for each(_local_2 in _arg_1)
            {
               this.zowecizoh(_local_2.nezywasew,_local_2.bonusId,_local_2.miwadyrof,0);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function vavin(_arg_1:Vector.<String>) : void
      {
         var _local_2:String = null;
         if(_arg_1 != null)
         {
            for each(_local_2 in _arg_1)
            {
               this.removeBonus(_local_2);
            }
         }
      }
      
      private function removeBonus(_arg_1:String) : void
      {
         var _local_2:Bonus = this.bonuses[_arg_1];
         if(_local_2 != null)
         {
            delete this.bonuses[_arg_1];
            _local_2.remove();
         }
      }
      
      [Obfuscation(rename="false")]
      public function bonusTaken(_arg_1:String) : void
      {
         var _local_2:Bonus = this.bonuses[_arg_1];
         if(_local_2 != null)
         {
            delete this.bonuses[_arg_1];
            _local_2.pickup();
         }
      }
      
      [Obfuscation(rename="false")]
      public function wadypob(_arg_1:String) : void
      {
         var _local_2:Bonus = this.bonuses[_arg_1];
         if(_local_2 != null)
         {
            _local_2.enableTrigger();
         }
      }
      
      public function notedeg() : void
      {
         this.dez();
      }
      
      private function dez() : void
      {
         var _local_1:Nasyvozuq = null;
         for each(_local_1 in getInitParam().bonuses)
         {
            this.zowecizoh(_local_1.nezywasew,_local_1.bonusId,_local_1.miwadyrof,_local_1.wymot);
         }
         getInitParam().bonuses = null;
      }
   }
}

