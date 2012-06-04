/*
This camera smoothes out rotation around the y-axis and height.
Horizontal Distance to the target is always fixed.

There are many different ways to smooth the rotation but doing it this way gives you a lot of control over how the camera behaves.

For every of those smoothed values we calculate the wanted value and the current value.
Then we smooth it using the Lerp function.
Then we apply the smoothed values to the transform's position.
*/

// The target we are following
var target : Transform;
// The distance in the x-z plane to the target
var distance = 10.0;
// the height we want the camera to be above the target
var height = 5.0;
// How much we 
var heightDamping = 2.0;
var rotationDamping = 3.0;

// Place the script in the Camera-Control group in the component menu
@script AddComponentMenu("Camera-Control/Smooth Follow")


function LateUpdate () {
	
	Debug.Log(target.name == "Bullet(Clone)");
	
	if (target.name == "Bullet(Clone)") { 
		
		// Calculate the current rotation angles
		var wantedRotationAngle = target.eulerAngles.y;
		var wantedHeight = target.position.y + height;
		var currentRotationAngle = transform.eulerAngles.y;
		var currentHeight = transform.position.y;
		
		if (target.rigidbody.velocity.magnitude > 1) {
	
			// Damp the rotation around the y-axis
			currentRotationAngle = Mathf.LerpAngle (currentRotationAngle, wantedRotationAngle, rotationDamping * Time.deltaTime);

			// Damp the height
			currentHeight = Mathf.Lerp (currentHeight, wantedHeight, heightDamping * Time.deltaTime);

			// Convert the angle into a rotation
			var currentRotation = Quaternion.Euler (0, currentRotationAngle, 0);
	
			// Set the position of the camera on the x-z plane to:
			// distance meters behind the target
			transform.position = target.position;
			var speedFactor = currentRotation * Vector3.forward * distance;
		}
	
		if (target.rigidbody.velocity.magnitude >= 10){
		
			if (target.rigidbody.velocity.magnitude >= 35) {
		
				transform.position -= Vector3(Mathf.Lerp(transform.position.x,(speedFactor * (30*.25)).x, Time.time),Mathf.Lerp(transform.position.y,(speedFactor * (35*.25)).y, Time.time),Mathf.Lerp(transform.position.z,(speedFactor * (35*.25)).z, Time.time));
			}
			else if (speedFactor.magnitude < (speedFactor * (target.rigidbody.velocity.x*.25)).magnitude) {
			
				transform.position -= Vector3(Mathf.Lerp(transform.position.x,(speedFactor * (target.rigidbody.velocity.x*.25)).x, Time.time),Mathf.Lerp(transform.position.y,(speedFactor * (target.rigidbody.velocity.x*.25)).y, Time.time),Mathf.Lerp(transform.position.z,(speedFactor * (target.rigidbody.velocity.x*.25)).z, Time.time));
			}
			else {
				
				transform.position -= Vector3(Mathf.Lerp(transform.position.x,speedFactor.x, Time.time),Mathf.Lerp(transform.position.y,speedFactor.y,Time.time),Mathf.Lerp(transform.position.z,speedFactor.z, Time.time));
			}
		}
		else if (target.rigidbody.velocity.magnitude > 1) {
			transform.position.y = 10;
			transform.position.z = -10;
			transform.position.x += 5;
		}
		else {
		
			var maxX = target.position.x + 100;
			var maxY = target.position.y + 25;
			var maxZ = target.position.z - 50;
			var camX = transform.position.x;
			var camY = transform.position.y;
			var camZ = transform.position.z;
		
			if (camX <= maxX) {
			
				transform.position.x += .5;
			}
		
			if (camY <= maxY) {
			
			transform.position.y += .125;
			}
		
			if (camZ >= maxZ) {
				transform.position.z -= .25;
			}
		}
	
		// Set the height of the camera
		if (target.rigidbody.velocity.magnitude > 1) {
			transform.position.y = currentHeight;
		}
	
		// Always look at the target
		transform.LookAt (target);
	}
}
