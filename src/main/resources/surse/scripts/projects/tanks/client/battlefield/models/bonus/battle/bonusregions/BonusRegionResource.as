package projects.tanks.client.battlefield.models.bonus.battle.bonusregions
{
   import flash.display.BitmapData;
   
   public class BonusRegionResource
   {
      
      private static var healthTextureClass:Class = BonusRegionResource_healthTextureClass;
      
      public static const healthTexture:BitmapData = new healthTextureClass().bitmapData;
      
      private static var armorTextureClass:Class = BonusRegionResource_armorTextureClass;
      
      public static const armorTexture:BitmapData = new armorTextureClass().bitmapData;
      
      private static var damageTextureClass:Class = BonusRegionResource_damageTextureClass;
      
      public static const damageTexture:BitmapData = new damageTextureClass().bitmapData;
      
      private static var nitroTextureClass:Class = BonusRegionResource_nitroTextureClass;
      
      public static const nitroTexture:BitmapData = new nitroTextureClass().bitmapData;
      
      private static var goldTextureClass:Class = BonusRegionResource_goldTextureClass;
      
      public static const goldTexture:BitmapData = new goldTextureClass().bitmapData;
      
      public function BonusRegionResource()
      {
         super();
      }
   }
}

