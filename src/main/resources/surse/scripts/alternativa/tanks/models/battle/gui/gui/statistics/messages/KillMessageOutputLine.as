package alternativa.tanks.models.battle.gui.gui.statistics.messages
{
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import obfuscation.joni.ShortUserInfo;
   import obfuscation.mujusaqim.MessageColor;
   import obfuscation.pawikoz.Fojuhe;
   import obfuscation.pikobu.Munano;
   import obfuscation.pikobu.Vip;
   import projects.tanks.client.battlefield.types.DamageType;
   
   public class KillMessageOutputLine extends Fojuhe
   {
      
      private static var firebirdIconClass:Class = KillMessageOutputLine_firebirdIconClass;
      
      private static var freezeIconClass:Class = KillMessageOutputLine_freezeIconClass;
      
      private static var isisIconClass:Class = KillMessageOutputLine_isisIconClass;
      
      private static var railgunIconClass:Class = KillMessageOutputLine_railgunIconClass;
      
      private static var ricochetIconClass:Class = KillMessageOutputLine_ricochetIconClass;
      
      private static var shaftIconClass:Class = KillMessageOutputLine_shaftIconClass;
      
      private static var smokyIconClass:Class = KillMessageOutputLine_smokyIconClass;
      
      private static var thunderIconClass:Class = KillMessageOutputLine_thunderIconClass;
      
      private static var devastationIconClass:Class = KillMessageOutputLine_devastationIconClass;
      
      private static var twinsIconClass:Class = KillMessageOutputLine_twinsIconClass;
      
      private static var mineIconClass:Class = KillMessageOutputLine_mineIconClass;
      
      private static var damage2icon:Dictionary = new Dictionary();
      
      damage2icon[DamageType.FIREBIRD] = new firebirdIconClass().bitmapData;
      damage2icon[DamageType.FREEZE] = new freezeIconClass().bitmapData;
      damage2icon[DamageType.ISIS] = new isisIconClass().bitmapData;
      damage2icon[DamageType.MINE] = new mineIconClass().bitmapData;
      damage2icon[DamageType.TWINS] = new twinsIconClass().bitmapData;
      damage2icon[DamageType.RAILGUN] = new railgunIconClass().bitmapData;
      damage2icon[DamageType.TERMINATOR] = new devastationIconClass().bitmapData;
      damage2icon[DamageType.RICOCHET] = new ricochetIconClass().bitmapData;
      damage2icon[DamageType.SHAFT] = new shaftIconClass().bitmapData;
      damage2icon[DamageType.SMOKY] = new smokyIconClass().bitmapData;
      damage2icon[DamageType.THUNDER] = new thunderIconClass().bitmapData;
      
      public function KillMessageOutputLine(param1:ShortUserInfo, param2:ShortUserInfo, param3:DamageType)
      {
         super();
         this.createUserLabel(param1,0);
         this.createDamageIcon(param3,6);
         this.createUserLabel(param2,6);
      }
      
      private function createUserLabel(userStat:ShortUserInfo, param2:int) : void
      {
         var _loc3_:Munano = new Vip(userStat.userId);
         _loc3_.setUidColor(MessageColor.tufytela(userStat.teamType),true);
         _loc3_.x = width + param2;
         shadowContainer.addChild(_loc3_);
      }
      
      private function createDamageIcon(param1:DamageType, param2:int) : void
      {
         var _loc3_:Bitmap = new Bitmap(damage2icon[param1]);
         _loc3_.x = width + param2;
         shadowContainer.addChild(_loc3_);
      }
   }
}

