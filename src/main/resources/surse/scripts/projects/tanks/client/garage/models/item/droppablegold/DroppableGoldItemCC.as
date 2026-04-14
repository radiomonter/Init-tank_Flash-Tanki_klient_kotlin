package projects.tanks.client.garage.models.item.droppablegold
{
   public class DroppableGoldItemCC
   {
      
      private var _showDroppableGoldAuthor:Boolean;
      
      public function DroppableGoldItemCC(_arg_1:Boolean = false)
      {
         super();
         this._showDroppableGoldAuthor = _arg_1;
      }
      
      public function get showDroppableGoldAuthor() : Boolean
      {
         return this._showDroppableGoldAuthor;
      }
      
      public function set showDroppableGoldAuthor(_arg_1:Boolean) : void
      {
         this._showDroppableGoldAuthor = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "DroppableGoldItemCC [";
         _local_1 += "showDroppableGoldAuthor = " + this.showDroppableGoldAuthor + " ";
         return _local_1 + "]";
      }
   }
}

