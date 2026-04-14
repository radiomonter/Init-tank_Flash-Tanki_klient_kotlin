package alternativa.tanks.gui
{
   import controls.DefaultButton;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class EntranceAlertWindow extends Sprite
   {
      
      public static const CRYSTALS:int = 0;
      
      public static const NOSUPPLIES:int = 1;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const buttonSize:Point = new Point(104,33);
      
      private const space:int = 8;
      
      private var window:TankWindow;
      
      private var inner:TankWindowInner;
      
      private var messageTopLabel:LabelBase;
      
      private var messageBottomLabel:LabelBase;
      
      private var entranceImage:Bitmap;
      
      public var closeButton:DefaultButton;
      
      private var windowWidth:int = 430;
      
      public function EntranceAlertWindow()
      {
         super();
      }
   }
}

