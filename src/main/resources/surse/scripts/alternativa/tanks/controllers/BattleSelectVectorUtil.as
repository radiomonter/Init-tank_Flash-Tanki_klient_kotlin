package alternativa.tanks.controllers
{
   import alternativa.tanks.controllers.battlelist.BattleListItemParams;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class BattleSelectVectorUtil
   {
      
      public function BattleSelectVectorUtil()
      {
         super();
      }
      
      public static function getUsersById(_arg_1:Vector.<BattleInfoUser>, _arg_2:String) : BattleInfoUser
      {
         var _local_3:BattleInfoUser = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            if(_arg_1[_local_5].user == _arg_2)
            {
               _local_3 = _arg_1[_local_5];
               break;
            }
            _local_5++;
         }
         return _local_3;
      }
      
      public static function deleteElementInUsersVector(_arg_1:Vector.<BattleInfoUser>, _arg_2:String) : void
      {
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1[_local_4].user == _arg_2)
            {
               _arg_1[_local_4] = _arg_1[_local_3 - 1];
               _arg_1.pop();
               return;
            }
            _local_4++;
         }
      }
      
      public static function deleteElementInLongsVector(_arg_1:Vector.<String>, _arg_2:String) : void
      {
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1[_local_4] == _arg_2)
            {
               _arg_1[_local_4] = _arg_1[_local_3 - 1];
               _arg_1.pop();
               return;
            }
            _local_4++;
         }
      }
      
      public static function deleteElementInVector(_arg_1:Vector.<BattleListItemParams>, _arg_2:String) : void
      {
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1[_local_4].id == _arg_2)
            {
               _arg_1[_local_4] = _arg_1[_local_3 - 1];
               _arg_1.pop();
               return;
            }
            _local_4++;
         }
      }
      
      public static function deleteElementInArray(_arg_1:Array, _arg_2:String) : void
      {
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1[_local_4].id == _arg_2)
            {
               _arg_1[_local_4] = _arg_1[_local_3 - 1];
               _arg_1.pop();
               return;
            }
            _local_4++;
         }
      }
      
      public static function findElementInVector(_arg_1:Vector.<BattleListItemParams>, _arg_2:String) : BattleListItemParams
      {
         var _local_3:BattleListItemParams = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            if(_arg_1[_local_5].id == _arg_2)
            {
               _local_3 = _arg_1[_local_5];
               break;
            }
            _local_5++;
         }
         return _local_3;
      }
      
      public static function containsElementInVector(_arg_1:Vector.<String>, _arg_2:String) : Boolean
      {
         var _local_4:int = 0;
         var _local_3:int = int(_arg_1.length);
         while(_local_4 < _local_3)
         {
            if(_arg_1[_local_4] == _arg_2)
            {
               return true;
            }
            _local_4++;
         }
         return false;
      }
   }
}

