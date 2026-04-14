package obfuscation.lecezik
{
   import projects.tanks.client.achievements.model.achievements.Jypofa;
   
   public class Tabaw
   {
      
      private var sotivu:Vector.<Jypofa>;
      
      public function Tabaw(_arg_1:Vector.<Jypofa> = null)
      {
         super();
         this.sotivu = _arg_1;
      }
      
      public function get melarit() : Vector.<Jypofa>
      {
         return this.sotivu;
      }
      
      public function set melarit(_arg_1:Vector.<Jypofa>) : void
      {
         this.sotivu = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "AchievementCC [";
         _local_1 += "activeAchievements = " + this.melarit + " ";
         return _local_1 + "]";
      }
   }
}

