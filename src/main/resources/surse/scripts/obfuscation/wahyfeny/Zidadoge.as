package obfuscation.wahyfeny
{
   import obfuscation.pejug.Magyp;
   import projects.tanks.client.panel.model.dailyquest.Biluqare;
   import projects.tanks.client.panel.model.dailyquest.Bofavif;
   
   public class Zidadoge extends Biluqare implements Bofavif, Timazysol
   {
      
      public function Zidadoge()
      {
         super();
      }
      
      public function skipDailyQuest(_arg_1:Magyp) : void
      {
         if(_arg_1.canSkipForFree)
         {
            server.zedunop(_arg_1.questId);
         }
         else
         {
            server.weh(_arg_1.questId,_arg_1.skipCost);
         }
      }
      
      public function takePrize(_arg_1:Magyp) : void
      {
         server.takePrize(_arg_1.questId);
      }
   }
}

