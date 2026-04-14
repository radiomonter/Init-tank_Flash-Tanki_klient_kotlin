package alternativa.tanks.model.garage
{
   import alternativa.tanks.gui.tankpreview.TankPreviewWindow;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Tank3DViewer implements ITank3DViewer
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      private var tankPreview:TankPreviewWindow;
      
      private var armorResource3DS:Tanks3DSResource;
      
      private var weaponResource3DS:Tanks3DSResource;
      
      private var color:BitmapData;
      
      private var animation:MultiframeImageResource;
      
      private var gahyza:Boolean;
      
      public function Tank3DViewer()
      {
         super();
      }
      
      public function setView(_arg_1:TankPreviewWindow) : void
      {
         this.tankPreview = _arg_1;
         if(this.armorResource3DS != null)
         {
            this.tankPreview.setHull(this.armorResource3DS);
            this.armorResource3DS = null;
         }
         if(this.weaponResource3DS != null)
         {
            this.tankPreview.setTurret(this.weaponResource3DS);
            this.weaponResource3DS = null;
         }
         if(this.color != null)
         {
            this.tankPreview.setColorMap(this.color);
            this.color = null;
         }
         if(this.animation != null)
         {
            this.tankPreview.setTextureAnimation(this.animation);
            this.animation = null;
         }
      }
      
      public function resetView() : void
      {
         this.tankPreview = null;
      }
      
      public function setArmor(_arg_1:Tanks3DSResource) : void
      {
         if(this.tankPreview != null)
         {
            this.tankPreview.setHull(_arg_1);
         }
         else
         {
            this.armorResource3DS = _arg_1;
         }
      }
      
      public function setWeapon(_arg_1:Tanks3DSResource) : void
      {
         if(this.tankPreview != null)
         {
            this.tankPreview.setTurret(_arg_1);
         }
         else
         {
            this.weaponResource3DS = _arg_1;
         }
      }
      
      public function feduli(_arg_1:BitmapData) : void
      {
         this.gahyza = true;
         if(this.tankPreview != null)
         {
            this.tankPreview.setColorMap(_arg_1);
         }
      }
      
      public function setColor(_arg_1:BitmapData) : void
      {
         this.color = _arg_1;
         if(this.tankPreview != null)
         {
            this.tankPreview.setColorMap(_arg_1);
         }
      }
      
      public function setPreviewAnimation(_arg_1:MultiframeImageResource) : void
      {
         this.gahyza = true;
         if(this.tankPreview != null)
         {
            this.tankPreview.setTextureAnimation(_arg_1);
         }
      }
      
      public function setAnimation(_arg_1:MultiframeImageResource) : void
      {
         this.color = null;
         this.animation = _arg_1;
         if(this.tankPreview != null)
         {
            this.tankPreview.setTextureAnimation(_arg_1);
         }
      }
      
      public function quz() : void
      {
         if(!this.gahyza)
         {
            return;
         }
         this.gahyza = false;
         if(this.tankPreview == null)
         {
            return;
         }
         if(this.color != null)
         {
            this.tankPreview.setColorMap(this.color);
         }
         if(this.animation != null)
         {
            this.tankPreview.setTextureAnimation(this.animation);
         }
      }
   }
}

