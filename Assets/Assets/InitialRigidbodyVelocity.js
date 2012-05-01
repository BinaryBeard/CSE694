
function Update() {

	var bullet = GameObject.Find("Bullet(Clone)");
	var bulletSpeed = bullet.rigidbody.velocity.magnitude;
	
	if (bulletSpeed > 20) {

		rigidbody.velocity = transform.TransformDirection(Vector3.right) * bulletSpeed;
	}
	else {
		rigidbody.velocity = transform.TransformDirection(Vector3.right) * 0;
	}
	
}