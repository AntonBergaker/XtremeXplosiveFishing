///@param val1
///@param val2
///@param amount
function angle_lerp(argument0, argument1, argument2) {

	var _val1 = argument0, _val2 = argument1, _amount = argument2;

	return angle_shift(_val1,_val2,abs(angle_difference(_val1,_val2))*_amount);


}
