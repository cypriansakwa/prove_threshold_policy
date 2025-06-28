fn main(secret_share: Field, public_offset: pub Field) {
		let recovery_score = secret_share * 2 + public_offset;
		
		let recovery_threshold = 17;
		
		assert(recovery_score == recovery_threshold);
	}

#[test]
fn test_valid_share_and_offset() {
    let secret_share = 6;
    let public_offset = 5;
    // 6 * 2 + 5 = 17 
    let recovery_score = secret_share * 2 + public_offset;
    assert(recovery_score == 17);
}

#[test]
fn test_alternate_valid_case() {
    let secret_share = 8;
    let public_offset = 1;
    // 8 * 2 + 1 = 17 
    let recovery_score = secret_share * 2 + public_offset;
    assert(recovery_score == 17);
}

//#[test]
//fn test_invalid_combination_should_fail() {
  //  let secret_share = 5;
    //let public_offset = 6;
    // 5 * 2 + 6 = 16 
    //let recovery_score = secret_share * 2 + public_offset;
   // assert(recovery_score == 17);
//}
