// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// New rank, old rank
function RankIsBetter(argument0,argument1){
	
	// Only save rank if it's better than current one
	switch(argument0)
	{
		case "S":
			return true;
			break;
		case "A":
			switch(argument1)
			{
				case "A":
					return true;
					break;
				case "B":
					return true;
					break;
				case "C":
					return true;
					break;
				case "D":
					return true;
					break;
				case "F":
					return true;
					break;
			}
			break;
		case "B":
			switch(argument1)
			{
				case "B":
					return true;
					break;
				case "C":
					return true;
					break;
				case "D":
					return true;
					break;
				case "F":
					return true;
					break;
			}
			break;
		case "C":
			switch(argument1)
			{
				case "C":
					return true;
					break;
				case "D":
					return true;
					break;
				case "F":
					return true;
					break;
			}
			break;
		case "D":
			switch(argument1)
			{
				case "D":
					return true;
					break;
				case "F":
					return true;
					break;
			}
			break;
	}
	
	return false;
	
}