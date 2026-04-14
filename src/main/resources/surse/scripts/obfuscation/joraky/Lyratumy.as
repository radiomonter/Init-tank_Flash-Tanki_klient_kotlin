package obfuscation.joraky
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoListener;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import obfuscation.joni.ShortUserInfo;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class Lyratumy implements BattleUserInfoService, AutoClosable
   {
      
      private const jobidetum:Vector.<BattleUserInfoListener> = new Vector.<BattleUserInfoListener>();
      
      private var jij:IGameObject;
      
      public function Lyratumy(_arg_1:IGameObject)
      {
         super();
         this.jij = _arg_1;
         OSGi.getInstance().registerService(BattleUserInfoService,this);
      }
      
      public function kiq(_arg_1:String) : String
      {
         var _local_2:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_3:ShortUserInfo = _local_2.getShortUserInfo(_arg_1);
         if(_local_3 != null)
         {
            return _local_3.uid;
         }
         return null;
      }
      
      public function fotoqasy(_arg_1:String) : int
      {
         var _local_2:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_3:ShortUserInfo = _local_2.getShortUserInfo(_arg_1);
         if(_local_3 != null)
         {
            return _local_3.rank;
         }
         return 1;
      }
      
      public function suwiq(_arg_1:String) : Boolean
      {
         var _local_2:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_3:ShortUserInfo = _local_2.getShortUserInfo(_arg_1);
         if(_local_3 != null)
         {
            return _local_3.suspicious;
         }
         return false;
      }
      
      public function dijolycy(_arg_1:String) : ChatModeratorLevel
      {
         var _local_2:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         var _local_3:ShortUserInfo = _local_2.getShortUserInfo(_arg_1);
         return _local_3 != null ? _local_3.chatModeratorLevel : ChatModeratorLevel.NONE;
      }
      
      public function fugireza(_arg_1:BattleUserInfoListener) : void
      {
         var _local_2:int = this.jobidetum.indexOf(_arg_1);
         if(_local_2 < 0)
         {
            this.jobidetum.push(_arg_1);
         }
      }
      
      public function pucuke(_arg_1:BattleUserInfoListener) : void
      {
         var _local_2:int = this.jobidetum.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.jobidetum.splice(_local_2,1);
         }
      }
      
      public function qacugotu(_arg_1:ShortUserInfo) : void
      {
         var _local_2:BattleUserInfoListener = null;
         for each(_local_2 in this.jobidetum)
         {
            _local_2.voboqi(_arg_1.userId,_arg_1.uid,_arg_1.rank,_arg_1.suspicious);
         }
      }
      
      public function genericy(_arg_1:String, _arg_2:int) : void
      {
         var _local_3:BattleUserInfoListener = null;
         for each(_local_3 in this.jobidetum)
         {
            _local_3.kigybyde(_arg_1,_arg_2);
         }
      }
      
      public function qapemajat(_arg_1:String, _arg_2:Boolean) : void
      {
         var _local_3:BattleUserInfoListener = null;
         for each(_local_3 in this.jobidetum)
         {
            _local_3.bos(_arg_1,_arg_2);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.jij = null;
         this.jobidetum.length = 0;
         OSGi.getInstance().unregisterService(BattleUserInfoService);
      }
      
      public function getUsersCount() : int
      {
         var _local_1:Pywy = Pywy(OSGi.getInstance().getService(Pywy));
         return _local_1.getUsersCount();
      }
   }
}

