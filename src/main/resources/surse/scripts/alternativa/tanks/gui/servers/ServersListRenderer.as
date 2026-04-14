package alternativa.tanks.gui.servers
{
   import assets.combo.ComboListOverState;
   import base.DiscreteSprite;
   import controls.labels.MouseDisabledLabel;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect.ReconnectService;
   
   public class ServersListRenderer extends CellRenderer
   {
      
      [Inject]
      public static var reconnectService:ReconnectService;
      
      private var serverName:MouseDisabledLabel = new MouseDisabledLabel();
      
      private var busyness:ServerBusynessControl = new ServerBusynessControl();
      
      private var normalStyle:DisplayObject;
      
      private var overStyle:ComboListOverState = new ServersListOverStyle();
      
      private var container:Sprite = new DiscreteSprite();
      
      public function ServersListRenderer()
      {
         super();
         this.serverName.y = 0;
         this.serverName.x = 3;
         this.busyness.x = 37;
         this.busyness.y = 6;
         this.container.addChild(this.serverName);
         this.container.addChild(this.busyness);
         addChild(this.container);
         setStyle("icon",this.container);
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         this.normalStyle = reconnectService.isLocalServer(_arg_1.number) ? this.overStyle : new Bitmap(new BitmapData(1,1,true,0));
         setStyle("upSkin",this.normalStyle);
         setStyle("downSkin",this.overStyle);
         setStyle("overSkin",this.overStyle);
         setStyle("selectedUpSkin",this.normalStyle);
         setStyle("selectedOverSkin",this.overStyle);
         setStyle("selectedDownSkin",this.overStyle);
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         super.listData = _arg_1;
      }
      
      override protected function drawIcon() : void
      {
         this.busyness.setBusyness(data.busyness);
         this.serverName.text = data.name;
         mouseEnabled = data.busyness < 1;
         this.alpha = data.alpha;
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 6;
         background.height = height;
      }
   }
}

