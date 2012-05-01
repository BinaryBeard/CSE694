// Putting some comments here so I can test the commit.
#pragma strict


var followScript : SmoothFollow;

var mainCamera : Camera;
var followCamera : Camera;

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
	
	if (Input.GetButtonDown("Jump")) {
		stopped = !stopped;
		// Start Power meter
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
	instanceBullet.rigidbody.AddForce(transform.forward * (-shootForce));
				
	followCamera.enabled = true;
					
	sf.target = GameObject.Find("Bullet(Clone)").transform;
	sf.LateUpdate();

	followScript.target = instanceBullet.transform;
	followScript.LateUpdate();
}	