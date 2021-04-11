/// @description value_shift
/// @param value that gets shifted
/// @param target value to shift towards
/// @param shift amount
function value_shift(argument0, argument1, argument2) {
	if (argument0 < argument1) {
	    return min(argument0 + argument2, argument1);
	}
	else {
	    return max(argument0 - argument2, argument1);
	}


}
