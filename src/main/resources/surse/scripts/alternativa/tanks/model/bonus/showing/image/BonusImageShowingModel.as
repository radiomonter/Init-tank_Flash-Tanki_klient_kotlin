package alternativa.tanks.model.bonus.showing.image
{
   import alternativa.tanks.gui.CongratulationsWindowConfiscate;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.gui.IDestroyWindow;
   import alternativa.tanks.model.bonus.showing.info.BonusInfo;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.panel.model.bonus.showing.image.BonusImageShowingModelBase;
   import projects.tanks.client.panel.model.bonus.showing.image.IBonusImageShowingModelBase;
   
   public class BonusImageShowingModel extends BonusImageShowingModelBase implements IBonusImageShowingModelBase, IObjectLoadListener
   {
      
      public function BonusImageShowingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:IDestroyWindow = null;
         var _local_2:BonusInfo = BonusInfo(object.adapt(BonusInfo));
         if(_local_2.getImage() == null)
         {
            _local_1 = new CongratulationsWindowPresent(null,getInitParam().image,_local_2.getTopText(),_local_2.getBottomText(),object);
         }
         else
         {
            _local_1 = new CongratulationsWindowConfiscate(object,getInitParam().image.data,_local_2.getImage().data,_local_2.getTopText(),_local_2.getBottomText());
         }
         putData(IDestroyWindow,_local_1);
      }
      
      public function objectUnloaded() : void
      {
         var _local_1:IDestroyWindow = IDestroyWindow(getData(IDestroyWindow));
         _local_1.destroy();
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

