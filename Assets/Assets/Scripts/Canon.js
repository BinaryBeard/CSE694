// Putting some comments here so I can test the commit.
#pragma strict


var followScript : SmoothFollow;

var mainCamera : Camera;
var followCamera : Camera;

/* GravityEffect
	
Planets:
Earth - 1.0
Mercuty - 0.3
Venus - 0.9
Moon - 0.1
Mars - 0.3
Jupiter - 2.3
Saturn - 1.0
Uranus - 0.8
Neptune - 1.1
Sun - 27.0

*/

var gravityEffect : float = 1.0;
var projectile : Transform;
var shootForce = 1000;
var moveSpeed : float = 1.0;
var instanceBullet : GameObject;

static var moveUp : boolean = true;
static var stopped : boolean = false;

function Start () {
	followCamera.enabled = true;
	mainCamera.enabled = false;
}

function Update () {
		
	if (transform.eulerAngles.x >= 80) {
		moveUp = false;
	}
	else if (transform.eulerAngles.x <= 10) {
		moveUp = true;
	}
	
	// Test for touch input
	// TODO: Find a better way to detect touch
	if (Input.touchCount > 0) {
		stopped = !stopped;

		Fire();
	}	
	// Test for the space bar
	if (Input.GetButtonDown("Jump")) {
		stopped = !stopped;

		Fire();
	}
	
	if (!stopped) {
	
		if (moveUp) {
			transform.eulerAngles.x+=moveSpeed;
		}
		else {
			transform.eulerAngles.x-=moveSpeed;
		}
	}
}

function Fire() {

	var cam : GameObject = GameObject.Find("FollowCamera");
	var sf : SmoothFollow = cam.GetComponent(SmoothFollow);

	instanceBullet = Instantiate(projectile.gameObject, transform.position, Quaternion.identity);
	instanceBullet.rigidbody.mass = gravityEffect;
	instanceBullet.rigidbody.AddForce(transform.forward * (-shootForce));
				
	followCamera.enabled = true;
					
	sf.target = GameObject.Find("Bullet(Clone)").transform;
	sf.LateUpdate();

	followScript.target = instanceBullet.transform;
	followScript.LateUpdate();
}	