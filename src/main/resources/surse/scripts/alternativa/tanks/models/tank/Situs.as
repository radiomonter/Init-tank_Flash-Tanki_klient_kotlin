package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoListener;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   
   public class Situs implements BattleUserInfoListener
   {
      
      [Inject]
      public static var ciwitu:TankUsersRegistry;
      
      public function Situs()
      {
         super();
      }
      
      public function voboqi(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:Boolean) : void
      {
         var _local_5:Bamapylaq = null;
         var _local_6:UserTitle = null;
         var _local_7:TankModel = this.syvota(_arg_1);
         if(_local_7 != null)
         {
            _local_5 = _local_7.ridaha(ciwitu.bebosaca(_arg_1));
            _local_5.name = _arg_2;
            _local_5.rank = _arg_3;
            _local_6 = _local_7.getTitle(ciwitu.bebosaca(_arg_1));
            if(_local_6 != null)
            {
               _local_6.setLabelText(_arg_2);
               _local_6.setRank(_arg_3);
               _local_6.setSuspicious(_arg_4);
            }
         }
      }
      
      public function bos(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:TankModel = null;
         var _local_4:UserTitle = null;
         var _local_5:ClientObject = ciwitu.bebosaca(_arg_1);
         if(_local_5 != null)
         {
            _local_3 = this.syvota(_arg_1);
            _local_4 = _local_3.getTitle(_local_5);
            if(_local_4 != null)
            {
               _local_4.setSuspicious(_arg_2);
            }
         }
      }
      
      public function kigybyde(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:Bamapylaq = null;
         var _local_4:UserTitle = null;
         var _local_5:TankModel = this.syvota(_arg_1);
         if(_local_5 != null)
         {
            _local_3 = _local_5.ridaha(ciwitu.bebosaca(_arg_1));
            _local_3.rank = _arg_2;
            _local_4 = _local_5.getTitle(ciwitu.bebosaca(_arg_1));
            if(_local_4 != null)
            {
               _local_4.setRank(_arg_2);
            }
         }
      }
      
      private function syvota(_arg_1:String) : TankModel
      {
         var _local_2:ClientObject = ciwitu.bebosaca(_arg_1);
         if(_local_2 != null)
         {
            return TankModel(OSGi.getInstance().getService(ITankModel));
         }
         return null;
      }
   }
}

