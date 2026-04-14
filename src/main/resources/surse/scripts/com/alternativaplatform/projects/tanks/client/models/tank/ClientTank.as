package com.alternativaplatform.projects.tanks.client.models.tank
{
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import obfuscation.bude.BattleTeam;
   
   public class ClientTank
   {
      
      public var self:Boolean;
      
      public var teamType:BattleTeam;
      
      public var incarnationId:int;
      
      public var tankSpecification:TankSpecification;
      
      public var tankState:TankState;
      
      public var spawnState:ClientTankState;
      
      public var health:int;
      
      public function ClientTank()
      {
         super();
      }
   }
}

