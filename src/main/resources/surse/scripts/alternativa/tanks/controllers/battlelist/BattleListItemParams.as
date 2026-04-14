package alternativa.tanks.controllers.battlelist
{
   import obfuscation.fabuqy.Nukoki;
   import obfuscation.fabuqy.Suvozimi;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleListItemParams
   {
      
      public var gamename:String;
      
      public var battleItemGO:IGameObject;
      
      public var battleMode:Suvozimi;
      
      public var id:String;
      
      public var dmatch:Boolean;
      
      public var reds:int;
      
      public var blues:int;
      
      public var friendsReds:int;
      
      public var friendsBlues:int;
      
      public var all:int;
      
      public var friends:int;
      
      public var maxPeople:int;
      
      public var nmap:String;
      
      public var rankRange:Nukoki;
      
      public var accessible:Boolean;
      
      public var noSupplies:Boolean;
      
      public var suspicious:Boolean;
      
      public var proBattle:Boolean;
      
      public var timeLeft:int;
      
      public var capin:Boolean;
      
      public var kagalo:String;
      
      public function BattleListItemParams()
      {
         super();
      }
   }
}

