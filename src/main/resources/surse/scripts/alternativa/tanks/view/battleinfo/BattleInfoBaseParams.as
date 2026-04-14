package alternativa.tanks.view.battleinfo
{
   import obfuscation.fabuqy.Suvozimi;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class BattleInfoBaseParams
   {
      
      public var battleName:String;
      
      public var battleUrl:String;
      
      public var battleMode:Suvozimi;
      
      public var clanLink:String;
      
      public var clanName:String;
      
      public var minRank:int;
      
      public var maxRank:int;
      
      public var scoreLimit:int;
      
      public var timeLimitInSec:int;
      
      public var timeLeftInSec:int;
      
      public var spectatorEnabled:Boolean;
      
      public var withoutBonuses:Boolean;
      
      public var withoutCrystals:Boolean;
      
      public var upgradesDisabled:Boolean;
      
      public var proBattle:Boolean;
      
      public var reArmor:Boolean;
      
      public var noSupplies:Boolean;
      
      public var proBattleEnterPrice:int;
      
      public var noSuppliesTimeLeftInSec:int;
      
      public var maxPeopleCount:int;
      
      public var userPaidNoSuppliesBattle:Boolean;
      
      public var roundStarted:Boolean;
      
      public var previewResource:ImageResource;
      
      public var battleItemId:String;
      
      public var suvo:Boolean;
      
      public var kagalo:String;
      
      public var matchmakingMark:Boolean;
      
      public function BattleInfoBaseParams()
      {
         super();
      }
   }
}

