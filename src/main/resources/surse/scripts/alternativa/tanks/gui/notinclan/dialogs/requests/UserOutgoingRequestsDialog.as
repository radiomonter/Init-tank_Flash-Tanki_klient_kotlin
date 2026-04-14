package alternativa.tanks.gui.notinclan.dialogs.requests
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.ISourceData;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.SearchInputView;
   import alternativa.tanks.gui.notinclan.clanslist.ClanListType;
   import alternativa.tanks.gui.notinclan.clanslist.ClansListEvent;
   import alternativa.tanks.models.user.ClanUserService;
   import alternativa.tanks.models.user.outgoing.IClanUserOutgoingModel;
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class UserOutgoingRequestsDialog extends UserRequestsDialog
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var searchInput:SearchInputView;
      
      public function UserOutgoingRequestsDialog(_arg_1:int)
      {
         this.closeButtonWidth = _arg_1;
         var _local_2:ISourceData = ISourceData(clanUserService.userObject.adapt(ISourceData));
         this.searchInput = new SearchInputView(_local_2,localeService.getText(TanksLocale.TEXT_CLAN_SEND_REQUEST_TO_CLAN),localeService.getText(TanksLocale.TEXT_CLAN_SEND_REQUEST),localeService.getText(TanksLocale.TEXT_CLAN_SEARCH_BLOCKED_HINT),"");
         super();
         var _local_3:IClanUserOutgoingModel = clanUserService.userObject.adapt(IClanUserOutgoingModel) as IClanUserOutgoingModel;
         clansList.fillClansList(_local_3.getOutgoingClans(),ClanListType.OUTGOING);
         ClansListEvent.getDispatcher().addEventListener(ClansListEvent.OUTGOING + ClansListEvent.ADD,onAddRequest);
         ClansListEvent.getDispatcher().addEventListener(ClansListEvent.OUTGOING + ClansListEvent.REMOVE,onCancelRequest);
         addChild(this.searchInput);
      }
      
      override protected function onResize(_arg_1:Event = null) : void
      {
         heightSearchUnit = this.searchInput.height;
         super.onResize(_arg_1);
         this.searchInput.width = width - 3 * MARGIN - closeButtonWidth;
         this.searchInput.x = MARGIN;
         this.searchInput.y = height - this.searchInput.height - MARGIN;
      }
      
      override protected function removeEvents() : void
      {
         super.removeEvents();
         ClansListEvent.getDispatcher().removeEventListener(ClansListEvent.OUTGOING + ClansListEvent.ADD,onAddRequest);
         ClansListEvent.getDispatcher().removeEventListener(ClansListEvent.OUTGOING + ClansListEvent.REMOVE,onCancelRequest);
      }
      
      override public function destroy() : void
      {
         this.searchInput.hide();
         super.destroy();
      }
   }
}

