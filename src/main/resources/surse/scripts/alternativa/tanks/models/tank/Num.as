package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Qygebiko;
   import alternativa.tanks.utils.CircularObjectBuffer;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import obfuscation.bude.BattleTeam;
   import obfuscation.rofa.Maga;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Num
   {
      
      public static var cimise:Num;
      
      public static var kal:int = 10;
      
      public var battlefield:ClientObject;
      
      public var user:ClientObject;
      
      public var turret:ClientObject;
      
      public var hull:ClientObject;
      
      public var weapon:Qygebiko;
      
      public var local:Boolean;
      
      public var health:int;
      
      public var tank:Tank;
      
      public var pohamozu:TankSpecification;
      
      public var enabled:Boolean;
      
      public var teamType:BattleTeam;
      
      public var userName:String;
      
      public var userRank:int;
      
      public var rero:Maga;
      
      public var ginojyko:int;
      
      public var spawnState:ClientTankState;
      
      public var mass:Number = 1;
      
      public var power:Number = 0;
      
      public var incarnation:int;
      
      public var turretObject:IGameObject;
      
      public var dicorija:int;
      
      private var events:CircularObjectBuffer = new CircularObjectBuffer(kal);
      
      public function Num()
      {
         super();
      }
   }
}

