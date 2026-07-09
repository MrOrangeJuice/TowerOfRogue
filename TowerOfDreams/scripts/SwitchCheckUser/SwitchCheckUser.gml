function SwitchCheckUser(){

	var ret = -1;
	var _num = switch_accounts_get_accounts();  
	for (var i = 0; i < _num; ++i;)  
	{  
		  
	     if(switch_accounts_is_user_open(i))
		 {
			 if(ret==-1)
				ret=i;  
			else
			{
				show_debug_message("2+ Users open, defaulting to first in the list");
			}
		 }
	}
	return ret;
}