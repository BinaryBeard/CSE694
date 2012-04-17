

var followScript : SmoothFollow;

var projectile:Transform;
var shootForce = -1000;
var instanceBullet;

static var moveUp : boolean = true;
static var stopped : boolean = false;

function Start () {
	
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
			transform.eulerAngles.x++;
		}
		else {
			transform.eulerAngles.x--;
		}
	}
}

function Fire() {

		instanceBullet = Instantiate(projectile, transform.position, Quaternion.identity);
		instanceBullet.rigidbody.AddForce(transform.forward * shootForce);
		followScript.target = instanceBullet;
		followScript.LateUpdate();
}	