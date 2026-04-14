package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.IClanActionListener;
   
   public class ClanActionsManager
   {
      
      private static var actionsUpdateListeners:Vector.<IClanActionListener> = new Vector.<IClanActionListener>();
      
      public function ClanActionsManager()
      {
         super();
      }
      
      public static function addActionsUpdateListener(_arg_1:IClanActionListener) : void
      {
         var _local_2:int = actionsUpdateListeners.indexOf(_arg_1);
         if(_local_2 < 0)
         {
            actionsUpdateListeners.push(_arg_1);
         }
      }
      
      public static function removeActionsListener(_arg_1:IClanActionListener) : void
      {
         var _local_2:int = actionsUpdateListeners.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            actionsUpdateListeners.splice(_local_2,1);
         }
      }
      
      public static function updateActions() : void
      {
         var _local_1:IClanActionListener = null;
         for each(_local_1 in actionsUpdateListeners)
         {
            _local_1.updateActions();
         }
      }
      
      public static function removeListeners() : void
      {
         actionsUpdateListeners = new Vector.<IClanActionListener>();
      }
   }
}

