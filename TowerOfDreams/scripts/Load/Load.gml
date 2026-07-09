// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(){
	show_debug_message("Loading");
	
	var userAccountId = SwitchCheckUser();
	if(userAccountId == -1)
	{
		switch_accounts_select_account(true,false,false);
		userAccountId = SwitchCheckUser();
	}
	
	switch_save_data_unmount();
	switch_save_data_mount(userAccountId);
	
	global.loadbuff = buffer_create(1,buffer_grow,1);  
	
	buffer_seek(global.loadbuff,buffer_seek_end,0);
	var buffer_size = buffer_tell(global.loadbuff);
	buffer_seek(global.loadbuff,buffer_seek_start,0);
  
	buffer_async_group_begin("save_folder_name");    // save folder   
	buffer_async_group_option("savepadindex", 0);  
	buffer_async_group_option("showdialog",0);  
	buffer_async_group_option("slottitle","SaveForMyGame");    // don't show any dialogues, load from slot 0   
  
	buffer_load_async(global.loadbuff,"my_save_file.sav",0,-1);   // Say what we want to load and into which buffer  
  
	global.loadid = buffer_async_group_end();   // Actually start loading now please
}