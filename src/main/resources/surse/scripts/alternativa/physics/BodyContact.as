package alternativa.physics
{
   public class BodyContact
   {
      
      private static var poolTop:BodyContact;
      
      public var body1:Body;
      
      public var body2:Body;
      
      public var shapeContacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var nextInPool:BodyContact;
      
      public function BodyContact()
      {
         super();
      }
      
      public static function create() : BodyContact
      {
         if(poolTop == null)
         {
            return new BodyContact();
         }
         var _local_1:BodyContact = poolTop;
         poolTop = poolTop.nextInPool;
         _local_1.nextInPool = null;
         return _local_1;
      }
      
      public function dispose() : void
      {
         var _local_1:ShapeContact = null;
         var _local_3:int = 0;
         this.body1 = null;
         this.body2 = null;
         var _local_2:uint = this.shapeContacts.length;
         while(_local_3 < _local_2)
         {
            _local_1 = this.shapeContacts[_local_3];
            _local_1.dispose();
            _local_3++;
         }
         this.shapeContacts.length = 0;
         this.nextInPool = poolTop;
         poolTop = this;
      }
      
      public function copy(_arg_1:BodyContact) : void
      {
         var _local_4:int = 0;
         this.body1 = _arg_1.body1;
         this.body2 = _arg_1.body2;
         var _local_2:Vector.<ShapeContact> = _arg_1.shapeContacts;
         var _local_3:uint = _local_2.length;
         while(_local_4 < _local_3)
         {
            this.shapeContacts[this.shapeContacts.length] = _local_2[_local_4];
            _local_4++;
         }
      }
      
      public function setShapeContacts(_arg_1:Vector.<ShapeContact>) : void
      {
         var _local_3:int = 0;
         var _local_2:int = int(_arg_1.length);
         while(_local_3 < _local_2)
         {
            this.shapeContacts[_local_3] = _arg_1[_local_3];
            _local_3++;
         }
      }
   }
}

