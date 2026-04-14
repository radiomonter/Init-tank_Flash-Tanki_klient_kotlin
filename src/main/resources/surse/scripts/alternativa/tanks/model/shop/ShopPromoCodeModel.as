package alternativa.tanks.model.shop
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.shop.items.promo.IPromoCodeActivateService;
   import alternativa.tanks.model.shop.items.promo.PromoCodeActivateForm;
   import alternativa.tanks.model.shop.items.promo.PromoCodeActivateService;
   import alternativa.tanks.model.shop.items.promo.PromoCodeActivatedEvent;
   import alternativa.tanks.model.shop.items.promo.SendPromoCodeEvent;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   
   public class ShopPromoCodeModel
   {
      
      private var form:PromoCodeActivateForm;
      
      private var service:PromoCodeActivateService;
      
      public function ShopPromoCodeModel()
      {
         super();
         this.service = new PromoCodeActivateService();
         OSGi.getInstance().registerService(IPromoCodeActivateService,this.service);
         this.service.addEventListener(PromoCodeActivatedEvent.ACTIVATED_SUCCESSFULLY,this.codeActivated);
         this.service.addEventListener(PromoCodeActivatedEvent.ACTIVATED_FAILED,this.codeIsInvalid);
      }
      
      public function codeActivated(_arg_1:PromoCodeActivatedEvent) : void
      {
         this.form.codeActivatedSuccessful();
      }
      
      public function codeIsInvalid(_arg_1:PromoCodeActivatedEvent) : void
      {
         this.form.activateFailed();
      }
      
      public function getForm() : PromoCodeActivateForm
      {
         if(!this.form)
         {
            this.createForm();
         }
         return this.form;
      }
      
      private function createForm() : void
      {
         this.form = new PromoCodeActivateForm();
         this.form.addEventListener(SendPromoCodeEvent.SEND_PROMO_CODE,this.promoCodeActivationTry);
      }
      
      private function promoCodeActivationTry(_arg_1:SendPromoCodeEvent) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;try_activate_promocode;" + _arg_1.getPromoCode());
      }
      
      public function objectUnloaded() : void
      {
         if(Boolean(this.form))
         {
            this.form.removeEventListener(SendPromoCodeEvent.SEND_PROMO_CODE,this.promoCodeActivationTry);
         }
         this.form = null;
         OSGi.getInstance().unregisterService(IPromoCodeActivateService);
         this.service.removeEventListener(PromoCodeActivatedEvent.ACTIVATED_FAILED,this.codeIsInvalid);
         this.service.removeEventListener(PromoCodeActivatedEvent.ACTIVATED_SUCCESSFULLY,this.codeActivated);
         this.service = null;
      }
   }
}

