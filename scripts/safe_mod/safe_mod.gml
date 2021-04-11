function safe_mod(value, modulus) {
	return (value mod modulus + modulus) mod modulus;
}
	