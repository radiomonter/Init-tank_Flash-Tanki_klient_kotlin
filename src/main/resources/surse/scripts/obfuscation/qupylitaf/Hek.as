package obfuscation.qupylitaf
{
   public class Hek
   {
      
      public static var CTF:Hek = new Hek("CTF");
      
      public static var TDM:Hek = new Hek("TDM");
      
      public static var DM:Hek = new Hek("DM");
      
      public static var DOM:Hek = new Hek("CP");
      
      public var name:String;
      
      public function Hek(_arg_1:String)
      {
         super();
         this.name = _arg_1;
      }
      
      public static function getType(_arg_1:String) : Hek
      {
         if(_arg_1 == "DM")
         {
            return DM;
         }
         if(_arg_1 == "TDM")
         {
            return TDM;
         }
         if(_arg_1 == "CTF")
         {
            return CTF;
         }
         if(_arg_1 == "DOM")
         {
            return DOM;
         }
         return null;
      }
   }
}

