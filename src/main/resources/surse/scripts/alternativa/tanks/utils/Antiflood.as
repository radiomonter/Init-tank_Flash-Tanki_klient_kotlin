package alternativa.tanks.utils
{
   import alternativa.osgi.service.clientlog.IClientLog;
   
   public class Antiflood
   {
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private static var domains:Vector.<String>;
      
      private static var minChars:int;
      
      private static var minWords:int;
      
      private static var bufferSize:int;
      
      private static const LOG_CHANNEL_NAME:String = "chat";
      
      private static const nonConsonantLetters:RegExp = /[^bpfvбпфвcgjkqsxzсцзкгхdtдтlлйmnмнrржшщч]/g;
      
      private static const g1:RegExp = /[bpfvбпфв]+/g;
      
      private static const g2:RegExp = /[cgjkqsxzсцзкгх]+/g;
      
      private static const g3:RegExp = /[dtдт]+/g;
      
      private static const g4:RegExp = /[lлй]+/g;
      
      private static const g5:RegExp = /[mnмн]+/g;
      
      private static const g6:RegExp = /[rр]+/g;
      
      private static const g7:RegExp = /[жшщч]+/g;
      
      private static var chatMessageCodes:Vector.<Array> = Vector.<Array>([]);
      
      public function Antiflood()
      {
         super();
      }
      
      public static function init(_arg_1:Vector.<String>, _arg_2:int, _arg_3:int, _arg_4:int) : void
      {
         Antiflood.domains = _arg_1;
         Antiflood.minChars = _arg_2;
         Antiflood.minWords = _arg_3;
         Antiflood.bufferSize = _arg_4;
         clientLog.log(LOG_CHANNEL_NAME,"init: minChars = %1  minWords = %2 bufferSize = %3",Antiflood.minChars,Antiflood.minWords,Antiflood.bufferSize);
      }
      
      private static function getSoundexKey(_arg_1:String) : String
      {
         var _local_2:String = null;
         var _local_4:int = 0;
         var _local_3:String = _arg_1.substr(0,1).toUpperCase();
         _arg_1 = _arg_1.substr(1).toLowerCase().replace(nonConsonantLetters,"");
         _arg_1 = _arg_1.replace(g1,"1").replace(g2,"2").replace(g3,"3").replace(g4,"4").replace(g5,"5").replace(g6,"6").replace(g7,"7");
         while(_local_4 < 10)
         {
            _local_2 = _local_4.toString();
            _arg_1 = _arg_1.replace(RegExp(_local_2 + "{2,}"),_local_2);
            _local_4++;
         }
         if(_arg_1.length > 4)
         {
            _arg_1 = _arg_1.substr(0,4);
         }
         else
         {
            _arg_1 += int(0).toFixed(4 - _arg_1.length).substr(2);
         }
         return _local_3 + _arg_1;
      }
      
      public static function isNotFlood(_arg_1:String) : Boolean
      {
         var _local_2:Array = null;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Array = getMessageKeys(_arg_1);
         if(_arg_1.length < minChars && _local_5.length < minWords)
         {
            return true;
         }
         if(Antiflood.getLettersIndex(_arg_1) < 0.3 || Antiflood.getUniqueWordsIndex(_local_5) < 0.59)
         {
            return false;
         }
         for each(_local_2 in chatMessageCodes)
         {
            _local_3 = Math.max(_local_5.length,_local_2.length) / Math.min(_local_5.length,_local_2.length);
            if(_local_3 < 1.5)
            {
               _local_4 = compareKeys(_local_5,_local_2);
               if(_local_4 > 0.7)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function compareKeys(_arg_1:Array, _arg_2:Array) : Number
      {
         var _local_6:int = 0;
         var _local_3:Number = 0;
         var _local_4:int = _arg_1.indexOf(_arg_2[0]);
         if(_arg_1.length > 1 && _local_4 > -1 && _local_4 < _arg_1.length / 2)
         {
            _arg_1 = _arg_1.slice(_local_4);
         }
         var _local_5:int = Math.min(_arg_1.length,_arg_2.length);
         while(_local_6 < _local_5)
         {
            if(_arg_1[_local_6] == _arg_2[_local_6])
            {
               _local_3 += 1;
            }
            else if(_local_6 > 0 && _arg_1[_local_6] == _arg_2[_local_6 - 1])
            {
               _local_3 += 0.5;
            }
            else if(_local_6 < _local_5 - 1 && _arg_1[_local_6] == _arg_2[_local_6 + 1])
            {
               _local_3 += 0.5;
            }
            _local_6++;
         }
         return _local_3 / _local_5;
      }
      
      public static function getMessageKeys(_arg_1:String, _arg_2:Boolean = false) : Array
      {
         var _local_3:String = null;
         var _local_4:Array = null;
         var _local_5:String = null;
         _arg_1 = cutAllowedSubstring(_arg_1);
         var _local_6:Array = _arg_1.split(" ");
         var _local_7:Array = new Array();
         for each(_local_3 in _local_6)
         {
            if(_local_3 != "")
            {
               _local_7.push(_local_3);
            }
         }
         _local_4 = [];
         for each(_local_5 in _local_7)
         {
            _local_4.push(Antiflood.getSoundexKey(_local_5));
         }
         if(_arg_2 && _local_4.length > 0 && (_local_7.length >= minWords || _arg_1.length >= minChars))
         {
            chatMessageCodes.push(_local_4);
            if(chatMessageCodes.length > bufferSize)
            {
               chatMessageCodes.shift();
            }
         }
         return _local_4;
      }
      
      private static function cutAllowedSubstring(_arg_1:String) : String
      {
         var _local_2:String = null;
         var _local_3:String = null;
         for each(_local_2 in domains)
         {
            _local_3 = "(http://|https://)?(www\\.)?" + _local_2 + "[-a-zA-Z0-9./#%_]+";
            _arg_1 = _arg_1.replace(new RegExp(_local_3,"gi")," ");
         }
         return _arg_1.replace(/[\s_!@#$%^&*()"'\{\}_=+~,.;:\-\/?\[\]\/]+/g," ");
      }
      
      private static function getUniqueWordsIndex(_arg_1:Array) : Number
      {
         var _local_2:String = null;
         if(_arg_1.length < 1)
         {
            return 1;
         }
         var _local_3:Array = new Array();
         for each(_local_2 in _arg_1)
         {
            if(_local_3.indexOf(_local_2) < 0)
            {
               _local_3.push(_local_2);
            }
         }
         return _local_3.length / _arg_1.length;
      }
      
      public static function getLettersIndex(_arg_1:String) : Number
      {
         var _local_2:String = _arg_1.replace(/[\s_!@#$%^&*()"'\{\}_=+~,.;:\-\/?\[\]\/]+/g,"");
         return _local_2.length / _arg_1.length;
      }
   }
}

