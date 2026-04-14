package alternativa.osgi.service.locale
{
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.utils.Dictionary;
   
   public class LocaleService implements ILocaleService
   {
      
      private var strings:Object = {};
      
      private var images:Object = {};
      
      private var movies:Object = {};
      
      private var booleans:Object = {};
      
      private var numbers:Object = {};
      
      private var ints:Object = {};
      
      private var _language:String;
      
      private var _defaultLanguage:String;
      
      public function LocaleService(_arg_1:String, _arg_2:String)
      {
         super();
         this._language = _arg_1;
         this._defaultLanguage = _arg_2;
         this.strings = new Dictionary();
         this.images = new Dictionary();
      }
      
      public function setText(_arg_1:String, _arg_2:String) : void
      {
         this.strings[_arg_1] = _arg_2;
      }
      
      public function setImage(_arg_1:String, _arg_2:BitmapData) : void
      {
         this.images[_arg_1] = _arg_2;
      }
      
      public function setBoolean(_arg_1:String, _arg_2:Boolean) : void
      {
         this.booleans[_arg_1] = _arg_2;
      }
      
      public function setNumber(_arg_1:String, _arg_2:Number) : void
      {
         this.numbers[_arg_1] = _arg_2;
      }
      
      public function setInt(_arg_1:String, _arg_2:int) : void
      {
         this.ints[_arg_1] = _arg_2;
      }
      
      public function getText(_arg_1:String, ... _args) : String
      {
         var _local_4:int = 0;
         var _local_3:String = this.strings[_arg_1];
         if(_local_3 == null)
         {
            return _arg_1;
         }
         while(_local_4 < _args.length)
         {
            _local_3 = _local_3.replace("%" + (_local_4 + 1),_args[_local_4]);
            _local_4++;
         }
         return _local_3;
      }
      
      public function getImage(_arg_1:String) : BitmapData
      {
         return this.images[_arg_1];
      }
      
      public function getBoolean(_arg_1:String) : Boolean
      {
         return this.booleans[_arg_1];
      }
      
      public function getNumber(_arg_1:String) : Number
      {
         return this.numbers[_arg_1];
      }
      
      public function getInt(_arg_1:String) : int
      {
         return this.ints[_arg_1];
      }
      
      public function get language() : String
      {
         return this._language;
      }
      
      public function get defaultLanguage() : String
      {
         return this._defaultLanguage;
      }
      
      public function getMovie(_arg_1:String) : DisplayObjectContainer
      {
         return this.movies[_arg_1];
      }
      
      public function setMovie(_arg_1:String, _arg_2:DisplayObjectContainer) : void
      {
         this.movies[_arg_1] = _arg_2;
      }
      
      public function getTextWithPrefix(_arg_1:String) : Array
      {
         var _local_3:String = null;
         var _local_2:Array = [];
         for(_local_3 in this.strings)
         {
            if(_local_3.indexOf(_arg_1) == 0)
            {
               _local_2.push(this.strings[_local_3]);
            }
         }
         return _local_2;
      }
   }
}

