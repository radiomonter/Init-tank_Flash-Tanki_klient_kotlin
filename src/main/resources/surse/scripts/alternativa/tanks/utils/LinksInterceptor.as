package alternativa.tanks.utils
{
   import alternativa.tanks.utils.thirdparty.URI;
   
   public class LinksInterceptor
   {
      
      private var _linkRegexp:RegExp = /(https?:\/\/)?((([\w-\.]+)\.([a-z]{2,6}\.?))|(([а-я-\.]+)\.(рф\.?)))(\/[\w\.]*)*\/?([^\s\n]+)?/gi;
      
      private var _linkRegexpExtra:RegExp = new RegExp(this._linkRegexp);
      
      private var _linkRegexpAddon:RegExp = /[\[\]\{\}\|\*\(\)\@\$\^\'`~+№!]/gi;
      
      private var _allowedDomains:Vector.<String>;
      
      public var htmlFlag:Boolean = false;
      
      public function LinksInterceptor(_arg_1:Vector.<String>)
      {
         super();
         this._allowedDomains = _arg_1;
      }
      
      public function checkLinks(_arg_1:String) : String
      {
         var _local_2:String = null;
         var _local_3:URI = null;
         var _local_4:String = null;
         var _local_7:int = 0;
         this._linkRegexp.lastIndex = 0;
         var _local_5:* = "";
         var _local_6:Array = this._linkRegexp.exec(_arg_1);
         this.htmlFlag = false;
         while(_local_6 != null)
         {
            _local_5 += _arg_1.substr(_local_7,_local_6.index - _local_7);
            _local_2 = _arg_1.substr(_local_6.index,this._linkRegexp.lastIndex - _local_6.index);
            _local_3 = new URI(_local_2.indexOf("http://") == -1 ? "http://" + _local_2 : _local_2);
            _local_4 = _local_3.authority;
            if(this._allowedDomains.indexOf(_local_4) != -1 && !this.existsUrlInQuery(_local_3))
            {
               _local_5 += " <u><a href=\'event:" + _local_3 + "\'>" + _local_2 + "</a></u> ";
               this.htmlFlag = true;
            }
            else
            {
               _local_5 += _local_2;
            }
            _local_7 = this._linkRegexp.lastIndex;
            _local_6 = this._linkRegexp.exec(_arg_1);
         }
         return _local_5 + _arg_1.substr(this._linkRegexp.lastIndex == 0 ? Number(_local_7) : Number(this._linkRegexp.lastIndex));
      }
      
      private function existsUrlInQuery(_arg_1:URI) : Boolean
      {
         this._linkRegexpExtra.lastIndex = 0;
         if(this._linkRegexpExtra.exec(_arg_1.queryRaw) != null)
         {
            return true;
         }
         this._linkRegexpAddon.lastIndex = 0;
         if(this._linkRegexpAddon.exec(_arg_1.path) != null)
         {
            return true;
         }
         this._linkRegexpAddon.lastIndex = 0;
         if(this._linkRegexpAddon.exec(_arg_1.fragment) != null)
         {
            return true;
         }
         return false;
      }
   }
}

