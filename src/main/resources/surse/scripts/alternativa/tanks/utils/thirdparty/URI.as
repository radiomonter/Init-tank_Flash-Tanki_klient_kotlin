package alternativa.tanks.utils.thirdparty
{
   public class URI
   {
      
      public static const URImustEscape:String = " %";
      
      public static const URIbaselineEscape:String = URImustEscape + ":?#/@";
      
      public static const URIpathEscape:String = URImustEscape + "?#";
      
      public static const URIqueryEscape:String = URImustEscape + "#";
      
      public static const URIqueryPartEscape:String = URImustEscape + "#&=";
      
      public static const URInonHierEscape:String = URImustEscape + "?#/";
      
      public static const UNKNOWN_SCHEME:String = "unknown";
      
      protected static const URIbaselineExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIbaselineEscape);
      
      protected static const URIschemeExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIuserpassExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIauthorityExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIportExludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
      
      protected static const URIpathExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIpathEscape);
      
      protected static const URIqueryExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIqueryEscape);
      
      protected static const URIqueryPartExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIqueryPartEscape);
      
      protected static const URIfragmentExcludedBitmap:URIEncodingBitmap = URIqueryExcludedBitmap;
      
      protected static const URInonHierexcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URInonHierEscape);
      
      public static const NOT_RELATED:int = 0;
      
      public static const CHILD:int = 1;
      
      public static const EQUAL:int = 2;
      
      public static const PARENT:int = 3;
      
      protected static var _resolver:IURIResolver = null;
      
      protected var _valid:Boolean = false;
      
      protected var _relative:Boolean = false;
      
      protected var _scheme:String = "";
      
      protected var _authority:String = "";
      
      protected var _username:String = "";
      
      protected var _password:String = "";
      
      protected var _port:String = "";
      
      protected var _path:String = "";
      
      protected var _query:String = "";
      
      protected var _fragment:String = "";
      
      protected var _nonHierarchical:String = "";
      
      public function URI(_arg_1:String = null)
      {
         super();
         if(_arg_1 == null)
         {
            this.initialize();
         }
         else
         {
            this.constructURI(_arg_1);
         }
      }
      
      public static function escapeChars(_arg_1:String) : String
      {
         return fastEscapeChars(_arg_1,URI.URIbaselineExcludedBitmap);
      }
      
      public static function unescapeChars(_arg_1:String) : String
      {
         var _local_2:String = null;
         return decodeURIComponent(_arg_1);
      }
      
      public static function fastEscapeChars(_arg_1:String, _arg_2:URIEncodingBitmap) : String
      {
         var _local_3:String = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:* = "";
         _local_5 = 0;
         while(_local_5 < _arg_1.length)
         {
            _local_3 = _arg_1.charAt(_local_5);
            _local_4 = _arg_2.ShouldEscape(_local_3);
            if(Boolean(_local_4))
            {
               _local_3 = _local_4.toString(16);
               if(_local_3.length == 1)
               {
                  _local_3 = "0" + _local_3;
               }
               _local_3 = "%" + _local_3;
               _local_3 = _local_3.toUpperCase();
            }
            _local_6 += _local_3;
            _local_5++;
         }
         return _local_6;
      }
      
      public static function queryPartEscape(_arg_1:String) : String
      {
         var _local_2:String = _arg_1;
         return URI.fastEscapeChars(_arg_1,URI.URIqueryPartExcludedBitmap);
      }
      
      public static function queryPartUnescape(_arg_1:String) : String
      {
         var _local_2:String = _arg_1;
         return unescapeChars(_local_2);
      }
      
      protected static function compareStr(_arg_1:String, _arg_2:String, _arg_3:Boolean = true) : Boolean
      {
         if(_arg_3 == false)
         {
            _arg_1 = _arg_1.toLowerCase();
            _arg_2 = _arg_2.toLowerCase();
         }
         return _arg_1 == _arg_2;
      }
      
      protected static function resolve(_arg_1:URI) : URI
      {
         var _local_2:URI = new URI();
         _local_2.copyURI(_arg_1);
         if(_resolver != null)
         {
            return _resolver.resolve(_local_2);
         }
         return _local_2;
      }
      
      public static function set resolver(_arg_1:IURIResolver) : void
      {
         _resolver = _arg_1;
      }
      
      public static function get resolver() : IURIResolver
      {
         return _resolver;
      }
      
      protected function constructURI(_arg_1:String) : Boolean
      {
         if(!this.parseURI(_arg_1))
         {
            this._valid = false;
         }
         return this.isValid();
      }
      
      protected function initialize() : void
      {
         this._valid = false;
         this._relative = false;
         this._scheme = UNKNOWN_SCHEME;
         this._authority = "";
         this._username = "";
         this._password = "";
         this._port = "";
         this._path = "";
         this._query = "";
         this._fragment = "";
         this._nonHierarchical = "";
      }
      
      protected function set hierState(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            this._nonHierarchical = "";
            if(this._scheme == "" || this._scheme == UNKNOWN_SCHEME)
            {
               this._relative = true;
            }
            else
            {
               this._relative = false;
            }
            if(this._authority.length == 0 && this._path.length == 0)
            {
               this._valid = false;
            }
            else
            {
               this._valid = true;
            }
         }
         else
         {
            this._authority = "";
            this._username = "";
            this._password = "";
            this._port = "";
            this._path = "";
            this._relative = false;
            if(this._scheme == "" || this._scheme == UNKNOWN_SCHEME)
            {
               this._valid = false;
            }
            else
            {
               this._valid = true;
            }
         }
      }
      
      protected function get hierState() : Boolean
      {
         return this._nonHierarchical.length == 0;
      }
      
      protected function validateURI() : Boolean
      {
         if(this.isAbsolute())
         {
            if(this._scheme.length <= 1 || this._scheme == UNKNOWN_SCHEME)
            {
               return false;
            }
            if(this.verifyAlpha(this._scheme) == false)
            {
               return false;
            }
         }
         if(this.hierState)
         {
            if(this._path.search("\\") != -1)
            {
               return false;
            }
            if(this.isRelative() == false && this._scheme == UNKNOWN_SCHEME)
            {
               return false;
            }
         }
         else if(this._nonHierarchical.search("\\") != -1)
         {
            return false;
         }
         return true;
      }
      
      protected function parseURI(_arg_1:String) : Boolean
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:String = _arg_1;
         this.initialize();
         _local_2 = _local_4.indexOf("#");
         if(_local_2 != -1)
         {
            if(_local_4.length > _local_2 + 1)
            {
               this._fragment = _local_4.substr(_local_2 + 1,_local_4.length - (_local_2 + 1));
            }
            _local_4 = _local_4.substr(0,_local_2);
         }
         _local_2 = _local_4.indexOf("?");
         if(_local_2 != -1)
         {
            if(_local_4.length > _local_2 + 1)
            {
               this._query = _local_4.substr(_local_2 + 1,_local_4.length - (_local_2 + 1));
            }
            _local_4 = _local_4.substr(0,_local_2);
         }
         _local_2 = _local_4.search(":");
         _local_3 = _local_4.search("/");
         var _local_5:* = _local_2 != -1;
         var _local_6:* = _local_3 != -1;
         var _local_7:Boolean = !_local_6 || _local_2 < _local_3;
         if(Boolean(_local_5) && _local_7)
         {
            this._scheme = _local_4.substr(0,_local_2);
            this._scheme = this._scheme.toLowerCase();
            _local_4 = _local_4.substr(_local_2 + 1);
            if(_local_4.substr(0,2) != "//")
            {
               this._nonHierarchical = _local_4;
               if((this._valid = this.validateURI()) == false)
               {
                  this.initialize();
               }
               return this.isValid();
            }
            this._nonHierarchical = "";
            _local_4 = _local_4.substr(2,_local_4.length - 2);
         }
         else
         {
            this._scheme = "";
            this._relative = true;
            this._nonHierarchical = "";
         }
         if(this.isRelative())
         {
            this._authority = "";
            this._port = "";
            this._path = _local_4;
         }
         else
         {
            if(_local_4.substr(0,2) == "//")
            {
               while(_local_4.charAt(0) == "/")
               {
                  _local_4 = _local_4.substr(1,_local_4.length - 1);
               }
            }
            _local_2 = _local_4.search("/");
            if(_local_2 == -1)
            {
               this._authority = _local_4;
               this._path = "";
            }
            else
            {
               this._authority = _local_4.substr(0,_local_2);
               this._path = _local_4.substr(_local_2,_local_4.length - _local_2);
            }
            _local_2 = this._authority.search("@");
            if(_local_2 != -1)
            {
               this._username = this._authority.substr(0,_local_2);
               this._authority = this._authority.substr(_local_2 + 1);
               _local_2 = this._username.search(":");
               if(_local_2 != -1)
               {
                  this._password = this._username.substring(_local_2 + 1,this._username.length);
                  this._username = this._username.substr(0,_local_2);
               }
               else
               {
                  this._password = "";
               }
            }
            else
            {
               this._username = "";
               this._password = "";
            }
            _local_2 = this._authority.search(":");
            if(_local_2 != -1)
            {
               this._port = this._authority.substring(_local_2 + 1,this._authority.length);
               this._authority = this._authority.substr(0,_local_2);
            }
            else
            {
               this._port = "";
            }
            this._authority = this._authority.toLowerCase();
         }
         if((this._valid = this.validateURI()) == false)
         {
            this.initialize();
         }
         return this.isValid();
      }
      
      public function copyURI(_arg_1:URI) : void
      {
         this._scheme = _arg_1._scheme;
         this._authority = _arg_1._authority;
         this._username = _arg_1._username;
         this._password = _arg_1._password;
         this._port = _arg_1._port;
         this._path = _arg_1._path;
         this._query = _arg_1._query;
         this._fragment = _arg_1._fragment;
         this._nonHierarchical = _arg_1._nonHierarchical;
         this._valid = _arg_1._valid;
         this._relative = _arg_1._relative;
      }
      
      protected function verifyAlpha(_arg_1:String) : Boolean
      {
         var _local_2:int = 0;
         var _local_3:RegExp = /[^a-z]/;
         _arg_1 = _arg_1.toLowerCase();
         _local_2 = _arg_1.search(_local_3);
         if(_local_2 == -1)
         {
            return true;
         }
         return false;
      }
      
      public function isValid() : Boolean
      {
         return this._valid;
      }
      
      public function isAbsolute() : Boolean
      {
         return !this._relative;
      }
      
      public function isRelative() : Boolean
      {
         return this._relative;
      }
      
      public function isDirectory() : Boolean
      {
         if(this._path.length == 0)
         {
            return false;
         }
         return this._path.charAt(this.path.length - 1) == "/";
      }
      
      public function isHierarchical() : Boolean
      {
         return this.hierState;
      }
      
      public function get scheme() : String
      {
         return URI.unescapeChars(this._scheme);
      }
      
      public function set scheme(_arg_1:String) : void
      {
         var _local_2:String = _arg_1.toLowerCase();
         this._scheme = URI.fastEscapeChars(_local_2,URI.URIschemeExcludedBitmap);
      }
      
      public function get authority() : String
      {
         return URI.unescapeChars(this._authority);
      }
      
      public function set authority(_arg_1:String) : void
      {
         _arg_1 = _arg_1.toLowerCase();
         this._authority = URI.fastEscapeChars(_arg_1,URI.URIauthorityExcludedBitmap);
         this.hierState = true;
      }
      
      public function get username() : String
      {
         return URI.unescapeChars(this._username);
      }
      
      public function set username(_arg_1:String) : void
      {
         this._username = URI.fastEscapeChars(_arg_1,URI.URIuserpassExcludedBitmap);
         this.hierState = true;
      }
      
      public function get password() : String
      {
         return URI.unescapeChars(this._password);
      }
      
      public function set password(_arg_1:String) : void
      {
         this._password = URI.fastEscapeChars(_arg_1,URI.URIuserpassExcludedBitmap);
         this.hierState = true;
      }
      
      public function get port() : String
      {
         return URI.unescapeChars(this._port);
      }
      
      public function set port(_arg_1:String) : void
      {
         this._port = URI.escapeChars(_arg_1);
         this.hierState = true;
      }
      
      public function get path() : String
      {
         return URI.unescapeChars(this._path);
      }
      
      public function set path(_arg_1:String) : void
      {
         this._path = URI.fastEscapeChars(_arg_1,URI.URIpathExcludedBitmap);
         if(this._scheme == UNKNOWN_SCHEME)
         {
            this._scheme = "";
         }
         this.hierState = true;
      }
      
      public function get query() : String
      {
         return URI.unescapeChars(this._query);
      }
      
      public function set query(_arg_1:String) : void
      {
         this._query = URI.fastEscapeChars(_arg_1,URI.URIqueryExcludedBitmap);
      }
      
      public function get queryRaw() : String
      {
         return this._query;
      }
      
      public function set queryRaw(_arg_1:String) : void
      {
         this._query = _arg_1;
      }
      
      public function get fragment() : String
      {
         return URI.unescapeChars(this._fragment);
      }
      
      public function set fragment(_arg_1:String) : void
      {
         this._fragment = URI.fastEscapeChars(_arg_1,URIfragmentExcludedBitmap);
      }
      
      public function get nonHierarchical() : String
      {
         return URI.unescapeChars(this._nonHierarchical);
      }
      
      public function set nonHierarchical(_arg_1:String) : void
      {
         this._nonHierarchical = URI.fastEscapeChars(_arg_1,URInonHierexcludedBitmap);
         this.hierState = false;
      }
      
      public function setParts(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String) : void
      {
         this.scheme = _arg_1;
         this.authority = _arg_2;
         this.port = _arg_3;
         this.path = _arg_4;
         this.query = _arg_5;
         this.fragment = _arg_6;
         this.hierState = true;
      }
      
      public function isOfType(_arg_1:String) : Boolean
      {
         _arg_1 = _arg_1.toLowerCase();
         return this._scheme == _arg_1;
      }
      
      public function getQueryValue(_arg_1:String) : String
      {
         var _local_2:Object = null;
         var _local_4:String = null;
         var _local_3:* = null;
         _local_2 = this.getQueryByMap();
         for(_local_3 in _local_2)
         {
            if(_local_3 == _arg_1)
            {
               return _local_2[_local_3];
            }
         }
         return new String("");
      }
      
      public function setQueryValue(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:Object = null;
         _local_3 = this.getQueryByMap();
         _local_3[_arg_1] = _arg_2;
         this.setQueryByMap(_local_3);
      }
      
      public function getQueryByMap() : Object
      {
         var _local_1:String = null;
         var _local_2:String = null;
         var _local_3:Array = null;
         var _local_4:Array = null;
         var _local_5:String = null;
         var _local_6:String = null;
         var _local_7:int = 0;
         var _local_8:Object = new Object();
         _local_1 = this._query;
         _local_3 = _local_1.split("&");
         for each(_local_2 in _local_3)
         {
            if(_local_2.length != 0)
            {
               _local_4 = _local_2.split("=");
               if(_local_4.length > 0)
               {
                  _local_5 = _local_4[0];
                  if(_local_4.length > 1)
                  {
                     _local_6 = _local_4[1];
                  }
                  else
                  {
                     _local_6 = "";
                  }
                  _local_5 = queryPartUnescape(_local_5);
                  _local_6 = queryPartUnescape(_local_6);
                  _local_8[_local_5] = _local_6;
               }
            }
         }
         return _local_8;
      }
      
      public function setQueryByMap(_arg_1:Object) : void
      {
         var _local_2:String = null;
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:String = null;
         var _local_3:* = null;
         var _local_7:* = "";
         for(_local_3 in _arg_1)
         {
            _local_4 = _arg_1[_local_2];
            if(_local_4 == null)
            {
               _local_4 = "";
            }
            _local_3 = queryPartEscape(_local_3);
            _local_4 = queryPartEscape(_local_4);
            _local_5 = _local_3;
            if(_local_4.length > 0)
            {
               _local_5 += "=";
               _local_5 += _local_4;
            }
            if(_local_7.length != 0)
            {
               _local_7 += "&";
            }
            _local_7 += _local_5;
         }
         this._query = _local_7;
      }
      
      public function toString() : String
      {
         if(this == null)
         {
            return "";
         }
         return this.toStringInternal(false);
      }
      
      public function toDisplayString() : String
      {
         return this.toStringInternal(true);
      }
      
      protected function toStringInternal(_arg_1:Boolean) : String
      {
         var _local_2:* = "";
         var _local_3:* = "";
         if(this.isHierarchical() == false)
         {
            _local_2 += !_arg_1 ? this._scheme : this.scheme;
            _local_2 += ":";
            _local_2 += !_arg_1 ? this._nonHierarchical : this.nonHierarchical;
         }
         else
         {
            if(this.isRelative() == false)
            {
               if(this._scheme.length != 0)
               {
                  _local_3 = !_arg_1 ? this._scheme : this.scheme;
                  _local_2 += _local_3 + ":";
               }
               if(this._authority.length != 0 || this.isOfType("file"))
               {
                  _local_2 += "//";
                  if(this._username.length != 0)
                  {
                     _local_3 = !_arg_1 ? this._username : this.username;
                     _local_2 += _local_3;
                     if(this._password.length != 0)
                     {
                        _local_3 = !_arg_1 ? this._password : this.password;
                        _local_2 += ":" + _local_3;
                     }
                     _local_2 += "@";
                  }
                  _local_3 = !_arg_1 ? this._authority : this.authority;
                  _local_2 += _local_3;
                  if(this.port.length != 0)
                  {
                     _local_2 += ":" + this.port;
                  }
               }
            }
            _local_3 = !_arg_1 ? this._path : this.path;
            _local_2 += _local_3;
         }
         if(this._query.length != 0)
         {
            _local_3 = !_arg_1 ? this._query : this.query;
            _local_2 += "?" + _local_3;
         }
         if(this.fragment.length != 0)
         {
            _local_3 = !_arg_1 ? this._fragment : this.fragment;
            _local_2 += "#" + _local_3;
         }
         return _local_2;
      }
      
      public function forceEscape() : void
      {
         this.scheme = this.scheme;
         this.setQueryByMap(this.getQueryByMap());
         this.fragment = this.fragment;
         if(this.isHierarchical())
         {
            this.authority = this.authority;
            this.path = this.path;
            this.port = this.port;
            this.username = this.username;
            this.password = this.password;
         }
         else
         {
            this.nonHierarchical = this.nonHierarchical;
         }
      }
      
      public function isOfFileType(_arg_1:String) : Boolean
      {
         var _local_2:String = null;
         var _local_3:int = 0;
         _local_3 = _arg_1.lastIndexOf(".");
         if(_local_3 != -1)
         {
            _arg_1 = _arg_1.substr(_local_3 + 1);
         }
         _local_2 = this.getExtension(true);
         if(_local_2 == "")
         {
            return false;
         }
         if(compareStr(_local_2,_arg_1,false) == 0)
         {
            return true;
         }
         return false;
      }
      
      public function getExtension(_arg_1:Boolean = false) : String
      {
         var _local_2:String = null;
         var _local_3:int = 0;
         var _local_4:String = this.getFilename();
         if(_local_4 == "")
         {
            return String("");
         }
         _local_3 = _local_4.lastIndexOf(".");
         if(_local_3 == -1 || _local_3 == 0)
         {
            return String("");
         }
         _local_2 = _local_4.substr(_local_3);
         if(_arg_1 && _local_2.charAt(0) == ".")
         {
            _local_2 = _local_2.substr(1);
         }
         return _local_2;
      }
      
      public function getFilename(_arg_1:Boolean = false) : String
      {
         var _local_2:String = null;
         var _local_3:int = 0;
         if(this.isDirectory())
         {
            return String("");
         }
         var _local_4:String = this.path;
         _local_3 = _local_4.lastIndexOf("/");
         if(_local_3 != -1)
         {
            _local_2 = _local_4.substr(_local_3 + 1);
         }
         else
         {
            _local_2 = _local_4;
         }
         if(_arg_1)
         {
            _local_3 = _local_2.lastIndexOf(".");
            if(_local_3 != -1)
            {
               _local_2 = _local_2.substr(0,_local_3);
            }
         }
         return _local_2;
      }
      
      public function getDefaultPort() : String
      {
         if(this._scheme == "http")
         {
            return String("80");
         }
         if(this._scheme == "ftp")
         {
            return String("21");
         }
         if(this._scheme == "file")
         {
            return String("");
         }
         if(this._scheme == "sftp")
         {
            return String("22");
         }
         return String("");
      }
      
      public function getRelation(_arg_1:URI, _arg_2:Boolean = true) : int
      {
         var _local_3:Array = null;
         var _local_4:Array = null;
         var _local_5:String = null;
         var _local_6:String = null;
         var _local_7:int = 0;
         var _local_8:URI = URI.resolve(this);
         var _local_9:URI = URI.resolve(_arg_1);
         if(_local_8.isRelative() || _local_9.isRelative())
         {
            return URI.NOT_RELATED;
         }
         if(_local_8.isHierarchical() == false || _local_9.isHierarchical() == false)
         {
            if(_local_8.isHierarchical() == false && _local_9.isHierarchical() == true || _local_8.isHierarchical() == true && _local_9.isHierarchical() == false)
            {
               return URI.NOT_RELATED;
            }
            if(_local_8.scheme != _local_9.scheme)
            {
               return URI.NOT_RELATED;
            }
            if(_local_8.nonHierarchical != _local_9.nonHierarchical)
            {
               return URI.NOT_RELATED;
            }
            return URI.EQUAL;
         }
         if(_local_8.scheme != _local_9.scheme)
         {
            return URI.NOT_RELATED;
         }
         if(_local_8.authority != _local_9.authority)
         {
            return URI.NOT_RELATED;
         }
         var _local_10:String = _local_8.port;
         var _local_11:String = _local_9.port;
         if(_local_10 == "")
         {
            _local_10 = _local_8.getDefaultPort();
         }
         if(_local_11 == "")
         {
            _local_11 = _local_9.getDefaultPort();
         }
         if(_local_10 != _local_11)
         {
            return URI.NOT_RELATED;
         }
         if(compareStr(_local_8.path,_local_9.path,_arg_2))
         {
            return URI.EQUAL;
         }
         var _local_12:String = _local_8.path;
         var _local_13:String = _local_9.path;
         if((_local_12 == "/" || _local_13 == "/") && (_local_12 == "" || _local_13 == ""))
         {
            return URI.EQUAL;
         }
         _local_3 = _local_12.split("/");
         _local_4 = _local_13.split("/");
         if(_local_3.length > _local_4.length)
         {
            _local_6 = _local_4[_local_4.length - 1];
            if(_local_6.length > 0)
            {
               return URI.NOT_RELATED;
            }
            _local_4.pop();
            _local_7 = 0;
            while(_local_7 < _local_4.length)
            {
               _local_5 = _local_3[_local_7];
               _local_6 = _local_4[_local_7];
               if(compareStr(_local_5,_local_6,_arg_2) == false)
               {
                  return URI.NOT_RELATED;
               }
               _local_7++;
            }
            return URI.CHILD;
         }
         if(_local_3.length < _local_4.length)
         {
            _local_5 = _local_3[_local_3.length - 1];
            if(_local_5.length > 0)
            {
               return URI.NOT_RELATED;
            }
            _local_3.pop();
            _local_7 = 0;
            while(_local_7 < _local_3.length)
            {
               _local_5 = _local_3[_local_7];
               _local_6 = _local_4[_local_7];
               if(compareStr(_local_5,_local_6,_arg_2) == false)
               {
                  return URI.NOT_RELATED;
               }
               _local_7++;
            }
            return URI.PARENT;
         }
         return URI.NOT_RELATED;
      }
      
      public function getCommonParent(_arg_1:URI, _arg_2:Boolean = true) : URI
      {
         var _local_3:String = null;
         var _local_4:String = null;
         var _local_5:URI = URI.resolve(this);
         var _local_6:URI = URI.resolve(_arg_1);
         if(!_local_5.isAbsolute() || !_local_6.isAbsolute() || _local_5.isHierarchical() == false || _local_6.isHierarchical() == false)
         {
            return null;
         }
         var _local_7:int = _local_5.getRelation(_local_6);
         if(_local_7 == URI.NOT_RELATED)
         {
            return null;
         }
         _local_5.chdir(".");
         _local_6.chdir(".");
         do
         {
            _local_7 = _local_5.getRelation(_local_6,_arg_2);
            if(_local_7 == URI.EQUAL || _local_7 == URI.PARENT)
            {
               break;
            }
            _local_3 = _local_5.toString();
            _local_5.chdir("..");
            _local_4 = _local_5.toString();
         }
         while(_local_3 != _local_4);
         return _local_5;
      }
      
      public function chdir(_arg_1:String, _arg_2:Boolean = false) : Boolean
      {
         var _local_3:URI = null;
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:Array = null;
         var _local_7:Array = null;
         var _local_8:String = null;
         var _local_9:int = 0;
         var _local_10:String = null;
         var _local_12:Boolean = false;
         var _local_13:Boolean = false;
         var _local_14:Boolean = false;
         var _local_15:Boolean = false;
         var _local_16:Boolean = false;
         var _local_11:String = _arg_1;
         if(_arg_2)
         {
            _local_11 = URI.escapeChars(_arg_1);
         }
         if(_local_11 == "")
         {
            return true;
         }
         if(_local_11.substr(0,2) == "//")
         {
            _local_10 = this.scheme + ":" + _local_11;
            return this.constructURI(_local_10);
         }
         if(_local_11.charAt(0) == "?")
         {
            _local_11 = "./" + _local_11;
         }
         _local_3 = new URI(_local_11);
         if(_local_3.isAbsolute() || _local_3.isHierarchical() == false)
         {
            this.copyURI(_local_3);
            return true;
         }
         _local_4 = this.path;
         _local_5 = _local_3.path;
         if(_local_4.length > 0)
         {
            _local_6 = _local_4.split("/");
         }
         else
         {
            _local_6 = new Array();
         }
         if(_local_5.length > 0)
         {
            _local_7 = _local_5.split("/");
         }
         else
         {
            _local_7 = new Array();
         }
         if(_local_6.length > 0 && _local_6[0] == "")
         {
            _local_14 = true;
            _local_6.shift();
         }
         if(_local_6.length > 0 && _local_6[_local_6.length - 1] == "")
         {
            _local_12 = true;
            _local_6.pop();
         }
         if(_local_7.length > 0 && _local_7[0] == "")
         {
            _local_15 = true;
            _local_7.shift();
         }
         if(_local_7.length > 0 && _local_7[_local_7.length - 1] == "")
         {
            _local_13 = true;
            _local_7.pop();
         }
         if(_local_15)
         {
            this.path = _local_3.path;
            this.queryRaw = _local_3.queryRaw;
            this.fragment = _local_3.fragment;
            return true;
         }
         if(_local_7.length == 0 && _local_3.query == "")
         {
            this.fragment = _local_3.fragment;
            return true;
         }
         if(_local_12 == false && _local_6.length > 0)
         {
            _local_6.pop();
         }
         this.queryRaw = _local_3.queryRaw;
         this.fragment = _local_3.fragment;
         _local_6 = _local_6.concat(_local_7);
         _local_9 = 0;
         while(_local_9 < _local_6.length)
         {
            _local_8 = _local_6[_local_9];
            _local_16 = false;
            if(_local_8 == ".")
            {
               _local_6.splice(_local_9,1);
               _local_9--;
               _local_16 = true;
            }
            else if(_local_8 == "..")
            {
               if(_local_9 >= 1)
               {
                  if(_local_6[_local_9 - 1] != "..")
                  {
                     _local_6.splice(_local_9 - 1,2);
                     _local_9 -= 2;
                  }
               }
               else if(!this.isRelative())
               {
                  _local_6.splice(_local_9,1);
                  _local_9--;
               }
               _local_16 = true;
            }
            _local_9++;
         }
         var _local_17:* = "";
         _local_13 ||= _local_16;
         _local_17 = this.joinPath(_local_6,_local_14,_local_13);
         this.path = _local_17;
         return true;
      }
      
      protected function joinPath(_arg_1:Array, _arg_2:Boolean, _arg_3:Boolean) : String
      {
         var _local_4:int = 0;
         var _local_5:* = "";
         _local_4 = 0;
         while(_local_4 < _arg_1.length)
         {
            if(_local_5.length > 0)
            {
               _local_5 += "/";
            }
            _local_5 += _arg_1[_local_4];
            _local_4++;
         }
         if(_arg_3 && _local_5.length > 0)
         {
            _local_5 += "/";
         }
         if(_arg_2)
         {
            _local_5 = "/" + _local_5;
         }
         return _local_5;
      }
      
      public function makeAbsoluteURI(_arg_1:URI) : Boolean
      {
         if(this.isAbsolute() || _arg_1.isRelative())
         {
            return false;
         }
         var _local_2:URI = new URI();
         _local_2.copyURI(_arg_1);
         if(_local_2.chdir(this.toString()) == false)
         {
            return false;
         }
         this.copyURI(_local_2);
         return true;
      }
      
      public function makeRelativeURI(_arg_1:URI, _arg_2:Boolean = true) : Boolean
      {
         var _local_3:Array = null;
         var _local_4:Array = null;
         var _local_5:String = null;
         var _local_6:String = null;
         var _local_7:String = null;
         var _local_8:int = 0;
         var _local_14:Boolean = false;
         var _local_15:Boolean = false;
         var _local_9:URI = new URI();
         _local_9.copyURI(_arg_1);
         var _local_10:Array = new Array();
         var _local_11:String = this.path;
         var _local_12:String = this.queryRaw;
         var _local_13:String = this.fragment;
         if(this.isRelative())
         {
            return true;
         }
         if(_local_9.isRelative())
         {
            return false;
         }
         if(this.isOfType(_arg_1.scheme) == false || this.authority != _arg_1.authority)
         {
            return false;
         }
         _local_15 = this.isDirectory();
         _local_9.chdir(".");
         _local_3 = _local_11.split("/");
         _local_4 = _local_9.path.split("/");
         if(_local_3.length > 0 && _local_3[0] == "")
         {
            _local_3.shift();
         }
         if(_local_3.length > 0 && _local_3[_local_3.length - 1] == "")
         {
            _local_15 = true;
            _local_3.pop();
         }
         if(_local_4.length > 0 && _local_4[0] == "")
         {
            _local_4.shift();
         }
         if(_local_4.length > 0 && _local_4[_local_4.length - 1] == "")
         {
            _local_4.pop();
         }
         while(_local_4.length > 0)
         {
            if(_local_3.length == 0)
            {
               break;
            }
            _local_5 = _local_3[0];
            _local_6 = _local_4[0];
            if(!compareStr(_local_5,_local_6,_arg_2))
            {
               break;
            }
            _local_3.shift();
            _local_4.shift();
         }
         var _local_16:* = "..";
         _local_8 = 0;
         while(_local_8 < _local_4.length)
         {
            _local_10.push(_local_16);
            _local_8++;
         }
         _local_10 = _local_10.concat(_local_3);
         _local_7 = this.joinPath(_local_10,false,_local_15);
         if(_local_7.length == 0)
         {
            _local_7 = "./";
         }
         this.setParts("","","",_local_7,_local_12,_local_13);
         return true;
      }
      
      public function unknownToURI(_arg_1:String, _arg_2:String = "http") : Boolean
      {
         var _local_3:String = null;
         var _local_4:String = null;
         if(_arg_1.length == 0)
         {
            this.initialize();
            return false;
         }
         _arg_1 = _arg_1.replace(/\\/g,"/");
         if(_arg_1.length >= 2)
         {
            _local_3 = _arg_1.substr(0,2);
            if(_local_3 == "//")
            {
               _arg_1 = _arg_2 + ":" + _arg_1;
            }
         }
         if(_arg_1.length >= 3)
         {
            _local_3 = _arg_1.substr(0,3);
            if(_local_3 == "://")
            {
               _arg_1 = _arg_2 + _arg_1;
            }
         }
         var _local_5:URI = new URI(_arg_1);
         if(_local_5.isHierarchical() == false)
         {
            if(_local_5.scheme == UNKNOWN_SCHEME)
            {
               this.initialize();
               return false;
            }
            this.copyURI(_local_5);
            this.forceEscape();
            return true;
         }
         if(_local_5.scheme != UNKNOWN_SCHEME && _local_5.scheme.length > 0)
         {
            if(_local_5.authority.length > 0 || _local_5.scheme == "file")
            {
               this.copyURI(_local_5);
               this.forceEscape();
               return true;
            }
            if(_local_5.authority.length == 0 && _local_5.path.length == 0)
            {
               this.setParts(_local_5.scheme,"","","","","");
               return false;
            }
         }
         else
         {
            _local_4 = _local_5.path;
            if(_local_4 == ".." || _local_4 == "." || _local_4.length >= 3 && _local_4.substr(0,3) == "../" || _local_4.length >= 2 && _local_4.substr(0,2) == "./")
            {
               this.copyURI(_local_5);
               this.forceEscape();
               return true;
            }
         }
         _local_5 = new URI(_arg_2 + "://" + _arg_1);
         if(_local_5.scheme.length > 0 && _local_5.authority.length > 0)
         {
            this.copyURI(_local_5);
            this.forceEscape();
            return true;
         }
         this.initialize();
         return false;
      }
   }
}

