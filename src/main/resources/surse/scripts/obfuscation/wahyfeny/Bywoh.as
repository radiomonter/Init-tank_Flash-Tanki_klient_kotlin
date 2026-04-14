package obfuscation.wahyfeny
{
   import obfuscation.pejug.Magyp;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Bywoh implements Timazysol
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Timazysol>;
      
      public function Bywoh(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Timazysol>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function skipDailyQuest(param1:Magyp) : void
      {
         var i:int = 0;
         var m:Timazysol = null;
         var dailyQuestInfo:Magyp = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.skipDailyQuest(dailyQuestInfo);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function takePrize(param1:Magyp) : void
      {
         var i:int = 0;
         var m:Timazysol = null;
         var dailyQuestInfo:Magyp = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.takePrize(dailyQuestInfo);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

