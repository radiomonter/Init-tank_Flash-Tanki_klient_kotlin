package obfuscation.lopivyl
{
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   
   public class Biru
   {
      
      private var _usersInfo:Vector.<Bamapylaq>;
      
      public function Biru(_arg_1:Vector.<Bamapylaq> = null)
      {
         super();
         this._usersInfo = _arg_1;
      }
      
      public function get rebar() : Vector.<Bamapylaq>
      {
         return this._usersInfo;
      }
      
      public function set rebar(_arg_1:Vector.<Bamapylaq>) : void
      {
         this._usersInfo = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "StatisticsDMCC [";
         _local_1 += "usersInfo = " + this.rebar + " ";
         return _local_1 + "]";
      }
   }
}

