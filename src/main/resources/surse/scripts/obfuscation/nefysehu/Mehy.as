package obfuscation.nefysehu
{
   import alternativa.tanks.locale.constants.TextConst;
   import flash.utils.Dictionary;
   import obfuscation.bude.BattleTeam;
   import obfuscation.mujusaqim.MessageColor;
   
   public class Mehy
   {
      
      public static const wyh:Soca = new Soca(MessageColor.gajefo,TextConst.TEXT_DOM_WE_CAPTURED_POINT);
      
      public static const rucybedu:Soca = new Soca(MessageColor.vase,TextConst.TEXT_DOM_ENEMIES_CAPTURED_POINT);
      
      public static const zipa:Soca = new Soca(MessageColor.vase,TextConst.TEXT_DOM_WE_LOST_POINT);
      
      public static const nuwuwery:Soca = new Soca(MessageColor.gajefo,TextConst.TEXT_DOM_ENEMIES_LOST_POINT);
      
      private static const miduwi:Soca = new Soca(MessageColor.BLUE,TextConst.TEXT_DOM_BLUE_CAPTURED_POINT);
      
      private static const mebuhi:Soca = new Soca(MessageColor.RED,TextConst.TEXT_DOM_RED_CAPTURED_POINT);
      
      private static const venywoca:Dictionary = new Dictionary();
      
      private static const nahofi:Soca = new Soca(MessageColor.BLUE,TextConst.TEXT_DOM_BLUE_LOST_POINT);
      
      private static const sezoqufu:Soca = new Soca(MessageColor.RED,TextConst.TEXT_DOM_RED_LOST_POINT);
      
      private static const rytezenat:Dictionary = new Dictionary();
      
      venywoca[BattleTeam.BLUE] = miduwi;
      venywoca[BattleTeam.RED] = mebuhi;
      rytezenat[BattleTeam.BLUE] = nahofi;
      rytezenat[BattleTeam.RED] = sezoqufu;
      
      public function Mehy()
      {
         super();
      }
      
      public static function mygupu(_arg_1:BattleTeam) : Soca
      {
         return venywoca[_arg_1];
      }
      
      public static function dikabad(_arg_1:BattleTeam) : Soca
      {
         return rytezenat[_arg_1];
      }
   }
}

