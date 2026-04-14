package alternativa.tanks.view.battlelist
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import obfuscation.fabuqy.Suvozimi;
   
   public class BattleModeIcons
   {
      
      private static const dmIconClass:Class = BattleModeIcons_dmIconClass;
      
      private static const dmIconBitmapData:BitmapData = Bitmap(new dmIconClass()).bitmapData;
      
      private static const tdmIconClass:Class = BattleModeIcons_tdmIconClass;
      
      private static const tdmIconBitmapData:BitmapData = Bitmap(new tdmIconClass()).bitmapData;
      
      private static const ctfIconClass:Class = BattleModeIcons_ctfIconClass;
      
      private static const ctfIconBitmapData:BitmapData = Bitmap(new ctfIconClass()).bitmapData;
      
      private static const cpIconClass:Class = BattleModeIcons_cpIconClass;
      
      private static const cpIconBitmapData:BitmapData = Bitmap(new cpIconClass()).bitmapData;
      
      public function BattleModeIcons()
      {
         super();
      }
      
      public static function getIcon(_arg_1:Suvozimi) : BitmapData
      {
         var _local_2:BitmapData = null;
         switch(_arg_1)
         {
            case Suvozimi.JGR:
            case Suvozimi.DM:
               _local_2 = dmIconBitmapData;
               break;
            case Suvozimi.TDM:
               _local_2 = tdmIconBitmapData;
               break;
            case Suvozimi.CTF:
               _local_2 = ctfIconBitmapData;
               break;
            case Suvozimi.CP:
               _local_2 = cpIconBitmapData;
         }
         return _local_2;
      }
   }
}

