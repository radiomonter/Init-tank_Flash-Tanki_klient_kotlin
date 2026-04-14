package obfuscation.myrudatof
{
   import alternativa.tanks.model.garage.Voku;
   import alternativa.tanks.service.item.ItemService;
   import flash.events.Event;
   import obfuscation.jakypa.Fawi;
   import obfuscation.jakypa.Wud;
   import obfuscation.jykyliv.Puhoka;
   import obfuscation.jykyliv.SendPresentEvent;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Bavipok extends Wud implements Fawi, Nafoh
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      private var uid:String;
      
      private var text:String;
      
      private var price:int;
      
      private var wak:Puhoka;
      
      private var nirybisus:IGameObject;
      
      public function Bavipok()
      {
         super();
      }
      
      public function preparePresent(_arg_1:IGameObject) : void
      {
         this.nirybisus = _arg_1;
         this.wak = new Puhoka();
         this.wak.addEventListener(SendPresentEvent.SEND_PRESENT,getFunctionWrapper(this.mytyzu));
         this.wak.addEventListener(Event.CANCEL,getFunctionWrapper(this.fahu));
      }
      
      private function fahu(_arg_1:Event) : void
      {
         this.musosynuf();
      }
      
      private function musosynuf() : void
      {
         this.wak.removeEventListener(SendPresentEvent.SEND_PRESENT,getFunctionWrapper(this.mytyzu));
         this.wak.removeEventListener(Event.CANCEL,getFunctionWrapper(this.musosynuf));
         this.wak = null;
      }
      
      private function mytyzu(_arg_1:SendPresentEvent) : void
      {
         this.uid = _arg_1.uid;
         this.text = _arg_1.text;
         this.price = itemService.getPrice(this.nirybisus);
         this.musosynuf();
         Voku(object.adapt(Voku)).showConfirmAlert(itemService.getName(this.nirybisus),this.price,itemService.getPreviewResource(this.nirybisus).data,true,-1);
      }
      
      public function confirmPresentPurchase(_arg_1:IGameObject) : void
      {
         server.cari(this.uid,_arg_1,this.text,this.price);
      }
   }
}

