package obfuscation.qenomy
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Gipafili
   {
      
      private var wacesisoq:int;
      
      private var hibari:int;
      
      private var sivim:Boolean;
      
      private var guqezo:ImageResource;
      
      private var qyw:ImageResource;
      
      public function Gipafili(_arg_1:int = 0, _arg_2:int = 0, _arg_3:Boolean = false, _arg_4:ImageResource = null, _arg_5:ImageResource = null)
      {
         super();
         this.wacesisoq = _arg_1;
         this.hibari = _arg_2;
         this.sivim = _arg_3;
         this.guqezo = _arg_4;
         this.qyw = _arg_5;
      }
      
      public function get currentQuestLevel() : int
      {
         return this.wacesisoq;
      }
      
      public function set currentQuestLevel(_arg_1:int) : void
      {
         this.wacesisoq = _arg_1;
      }
      
      public function get currentQuestStreak() : int
      {
         return this.hibari;
      }
      
      public function set currentQuestStreak(_arg_1:int) : void
      {
         this.hibari = _arg_1;
      }
      
      public function get doneForToday() : Boolean
      {
         return this.sivim;
      }
      
      public function set doneForToday(_arg_1:Boolean) : void
      {
         this.sivim = _arg_1;
      }
      
      public function get questImage() : ImageResource
      {
         return this.guqezo;
      }
      
      public function set questImage(_arg_1:ImageResource) : void
      {
         this.guqezo = _arg_1;
      }
      
      public function get rewardImage() : ImageResource
      {
         return this.qyw;
      }
      
      public function set rewardImage(_arg_1:ImageResource) : void
      {
         this.qyw = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "WeeklyQuestDescription [";
         _local_1 += "currentQuestLevel = " + this.currentQuestLevel + " ";
         _local_1 += "currentQuestStreak = " + this.currentQuestStreak + " ";
         _local_1 += "doneForToday = " + this.doneForToday + " ";
         _local_1 += "questImage = " + this.questImage + " ";
         _local_1 += "rewardImage = " + this.rewardImage + " ";
         return _local_1 + "]";
      }
   }
}

