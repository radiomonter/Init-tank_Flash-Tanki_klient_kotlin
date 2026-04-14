package obfuscation.joni
{
   import flash.utils.Dictionary;
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Jomyceju;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   
   public class Beb
   {
      
      public function Beb()
      {
         super();
      }
      
      public static function mufusyz(_arg_1:Dictionary, _arg_2:Vector.<Bamapylaq>) : Vector.<Tozutuv>
      {
         var _local_3:Bamapylaq = null;
         var _local_4:Tozutuv = null;
         var _local_7:int = 0;
         var _local_5:Vector.<Tozutuv> = new Vector.<Tozutuv>();
         var _local_6:int = int(_arg_2.length);
         while(_local_7 < _local_6)
         {
            _local_3 = _arg_2[_local_7];
            _local_4 = new Tozutuv();
            _local_4.padini(_local_3,_arg_1[_local_3.user]);
            _local_5.push(_local_4);
            _local_7++;
         }
         return _local_5;
      }
      
      public static function cesipuvav(_arg_1:Dictionary, _arg_2:Vector.<Suc>) : Vector.<Tozutuv>
      {
         var _local_3:Suc = null;
         var _local_4:Tozutuv = null;
         var _local_7:int = 0;
         var _local_5:Vector.<Tozutuv> = new Vector.<Tozutuv>();
         var _local_6:int = int(_arg_2.length);
         while(_local_7 < _local_6)
         {
            _local_3 = _arg_2[_local_7];
            _local_4 = new Tozutuv();
            _local_4.gatelas(_local_3,_arg_1[_local_3.user]);
            _local_5.push(_local_4);
            _local_7++;
         }
         return _local_5;
      }
      
      public static function casabigu(_arg_1:Bamapylaq, _arg_2:BattleTeam) : Momo
      {
         return new Momo(_arg_1.user,_arg_1.uid,_arg_1.rank,false,false,_arg_2,_arg_1.chatModeratorLevel);
      }
      
      public static function ridaha(_arg_1:String, _arg_2:Vector.<Bamapylaq>) : Bamapylaq
      {
         var _local_3:Bamapylaq = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_2.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_2[_local_5];
            if(_arg_1 == _local_3.user)
            {
               return _local_3;
            }
            _local_5++;
         }
         return null;
      }
      
      public static function kekamago(_arg_1:Vector.<Tozutuv>, _arg_2:String) : Vector.<Tozutuv>
      {
         var _local_3:Tozutuv = null;
         var _local_6:int = 0;
         var _local_4:Vector.<Tozutuv> = new Vector.<Tozutuv>();
         var _local_5:int = int(_arg_1.length);
         while(_local_6 < _local_5)
         {
            _local_3 = _arg_1[_local_6];
            if(_local_3.userId != _arg_2)
            {
               _local_4.push(_local_3);
            }
            _local_6++;
         }
         return _local_4;
      }
      
      public static function ryzuni(_arg_1:Vector.<Tozutuv>, _arg_2:Vector.<Jomyceju>, _arg_3:int) : void
      {
         var _local_4:Jomyceju = null;
         var _local_5:Tozutuv = null;
         var _local_7:int = 0;
         var _local_6:int = int(_arg_2.length);
         while(_local_7 < _local_6)
         {
            _local_4 = _arg_2[_local_7];
            _local_5 = myvogy(_arg_1,_local_4.userId);
            if(_local_5 != null)
            {
               _local_5.bejo = _local_4.bejo;
               _local_5.runecufyh = _local_4.runecufyh;
               _local_5.sejukulyq = _local_4.sejukulyq;
               if(_local_5.runecufyh <= 0)
               {
                  _local_5.runecufyh = witimogar(_local_4.bejo,_arg_3);
               }
            }
            _local_7++;
         }
      }
      
      public static function myvogy(_arg_1:Vector.<Tozutuv>, _arg_2:String) : Tozutuv
      {
         var _local_3:Tozutuv = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            if(_local_3.userId == _arg_2)
            {
               return _local_3;
            }
            _local_5++;
         }
         return null;
      }
      
      public static function donanuno(_arg_1:Vector.<Tozutuv>, _arg_2:Suc) : Tozutuv
      {
         var _local_3:Tozutuv = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            if(_local_3.userId == _arg_2.user)
            {
               _local_3.bulug(_arg_2);
               return _local_3;
            }
            _local_5++;
         }
         return null;
      }
      
      public static function kazysi(_arg_1:String, _arg_2:Vector.<Jomyceju>) : int
      {
         var _local_3:Jomyceju = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_2.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_2[_local_5];
            if(_arg_1 == _local_3.userId)
            {
               return _local_3.bejo;
            }
            _local_5++;
         }
         return -1;
      }
      
      public static function viv(_arg_1:Vector.<Tozutuv>, _arg_2:String) : int
      {
         var _local_3:Tozutuv = null;
         var _local_5:int = 0;
         var _local_4:int = int(_arg_1.length);
         while(_local_5 < _local_4)
         {
            _local_3 = _arg_1[_local_5];
            if(_local_3.userId == _arg_2)
            {
               return _local_5;
            }
            _local_5++;
         }
         return -1;
      }
      
      public static function witimogar(_arg_1:int, _arg_2:int) : int
      {
         return Math.ceil(_arg_1 * _arg_2 / 100);
      }
   }
}

