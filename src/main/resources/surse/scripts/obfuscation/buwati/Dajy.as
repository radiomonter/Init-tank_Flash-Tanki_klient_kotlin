package obfuscation.buwati
{
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.Jomejov;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class Dajy extends Sprite
   {
      
      [Inject]
      public static var fuhebamug:DailyQuestNotifierService;
      
      private static var cuw:Class = Sicavequ;
      
      private static var kotace:BitmapData = Bitmap(new cuw()).bitmapData;
      
      public function Dajy()
      {
         super();
         var _local_1:Bitmap = new Bitmap(kotace);
         addChild(_local_1);
         visible = false;
         fuhebamug.addEventListener(Jomejov.mokiqule,this.bulabiham);
         fuhebamug.addEventListener(Jomejov.fuhy,this.bad);
      }
      
      private function bad(_arg_1:Jomejov) : void
      {
         visible = false;
      }
      
      private function bulabiham(_arg_1:Jomejov) : void
      {
         visible = true;
      }
   }
}

