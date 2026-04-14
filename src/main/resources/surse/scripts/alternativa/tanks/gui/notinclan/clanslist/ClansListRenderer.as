package alternativa.tanks.gui.notinclan.clanslist
{
   import controls.cellrenderer.CellNormal;
   import controls.cellrenderer.CellNormalSelected;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import forms.Styles;
   
   public class ClansListRenderer extends CellRenderer
   {
      
      private var clanInfoLabel:ClanInfoLabel;
      
      public function ClansListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         mouseEnabled = false;
         mouseChildren = true;
         buttonMode = useHandCursor = false;
         this.createLabels(_data);
         var _local_2:DisplayObject = new CellNormal();
         var _local_3:DisplayObject = new CellNormalSelected();
         setStyle(Styles.UP_SKIN,_local_2);
         setStyle(Styles.DOWN_SKIN,_local_2);
         setStyle(Styles.OVER_SKIN,_local_2);
         setStyle(Styles.SELECTED_UP_SKIN,_local_3);
         setStyle(Styles.SELECTED_OVER_SKIN,_local_3);
         setStyle(Styles.SELECTED_DOWN_SKIN,_local_3);
         this.clanInfoLabel.width = _width;
         addEventListener(Event.RESIZE,this.onResize,false,0,true);
         this.onResize();
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = _listData.label;
         if(this.clanInfoLabel != null)
         {
            setStyle("icon",this.clanInfoLabel);
         }
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.clanInfoLabel.width = _width;
      }
      
      private function createLabels(_arg_1:Object) : void
      {
         if(_arg_1.type == ClanListType.INCOMING)
         {
            this.clanInfoLabel = new UserIncomingRequestLabel(_arg_1.id);
         }
         else
         {
            this.clanInfoLabel = new UserOutgoingRequestLabel(_arg_1.id);
         }
         addChild(this.clanInfoLabel);
      }
      
      public function onRollOut() : void
      {
         var _local_1:UserIncomingRequestLabel = null;
         super.selected = false;
         if(this.clanInfoLabel is UserIncomingRequestLabel)
         {
            _local_1 = UserIncomingRequestLabel(this.clanInfoLabel);
            if(_local_1.newIndicator != null)
            {
               _local_1.newIndicator.updateNotifications();
            }
         }
      }
      
      public function onRollOver() : void
      {
         var _local_1:UserIncomingRequestLabel = null;
         super.selected = true;
         if(this.clanInfoLabel is UserIncomingRequestLabel)
         {
            _local_1 = UserIncomingRequestLabel(this.clanInfoLabel);
            if(_local_1.newIndicator != null)
            {
               _local_1.newIndicator.visible = false;
            }
         }
      }
   }
}

