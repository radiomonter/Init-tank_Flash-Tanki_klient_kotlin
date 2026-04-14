package alternativa.tanks.gui.clanmanagement.clanmemberlist.list
{
   import controls.cellrenderer.CellNormal;
   import controls.cellrenderer.CellNormalSelected;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.Styles;
   
   public class ClanUserListRenderer extends CellRenderer
   {
      
      protected var item:ClanUserItem;
      
      public function ClanUserListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         mouseEnabled = false;
         mouseChildren = true;
         buttonMode = useHandCursor = false;
         var _local_2:DisplayObject = new CellNormal();
         var _local_3:DisplayObject = new CellNormalSelected();
         setStyle(Styles.UP_SKIN,_local_2);
         setStyle(Styles.DOWN_SKIN,_local_2);
         setStyle(Styles.OVER_SKIN,_local_2);
         setStyle(Styles.SELECTED_UP_SKIN,_local_3);
         setStyle(Styles.SELECTED_OVER_SKIN,_local_3);
         setStyle(Styles.SELECTED_DOWN_SKIN,_local_3);
         addEventListener(Event.RESIZE,this.onResize,false,0,true);
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         addChild(this.item);
         this.onResize();
      }
      
      protected function onResize(_arg_1:Event = null) : void
      {
         this.item.height = height;
         this.item.width = width;
         this.item.y = 1;
      }
      
      protected function onRollOut(_arg_1:MouseEvent) : void
      {
         this.item.deleteIndicator.visible = false;
         super.selected = false;
      }
      
      protected function onRollOver(_arg_1:MouseEvent) : void
      {
         this.item.deleteIndicator.updateActions();
         super.selected = true;
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = _listData.label;
         if(this.item != null)
         {
            setStyle(Styles.ICON,this.item);
         }
      }
   }
}

