package obfuscation.wahyfeny
{
   import obfuscation.pejug.Magyp;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Tajuje implements Timazysol
   {
      
      private var object:IGameObject;
      
      private var impl:Timazysol;
      
      public function Tajuje(_arg_1:IGameObject, _arg_2:Timazysol)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function skipDailyQuest(param1:Magyp) : void
      {
         var dailyQuestInfo:Magyp = param1;
         try
         {
            Model.object = this.object;
            this.impl.skipDailyQuest(dailyQuestInfo);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function takePrize(param1:Magyp) : void
      {
         var dailyQuestInfo:Magyp = param1;
         try
         {
            Model.object = this.object;
            this.impl.takePrize(dailyQuestInfo);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

