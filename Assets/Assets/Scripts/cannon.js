// Putting some comments here so I can test the commit.
#pragma strict

var mainCamera : Camera;
var followCamera : Camera;

var gravityEffect : float = 1.0;
var projectile : Transform;
var shootForce = 1000;
var moveSpeed : float = 1.0;
var instanceBullet : GameObject;

static var moveUp : boolean = true;
var stopped : boolean = false;

function Start () {

	followCamera.enabled = true;
	mainCamera.enabled = false;
	Debug.Log(gravityEffect);
}

function Update () {
		
	mainCamera = GameObject.Find("Main Camera").camera;
	followCamera = GameObject.Find("FollowCamera").camera;
		
	if (transform.eulerAngles.x >= 80) {
		moveUp = false;
	}
	else if (transform.eulerAngles.x <= 10) {
		moveUp = true;
	}
	
	// Test for touch input
	
	if (Input.touchCount > 0) {
	
		if (Input.touches[0].phase == TouchPhase.Began && GameObject.Find("Bullet(Clone)") == null) {
	
			GameObject.Find("PauseButton").guiTexture.enabled = false;
			Fire();		
		}	
	}
	
	// Test for the space bar
	if (Input.GetButtonDown("Jump") && GameObject.Find("Bullet(Clone)") == null) {

		GameObject.Find("PauseButton").guiTexture.enabled = false;
		Fire();
	}
	
	Stop();
}

function Fire() {

	var cam : GameObject = GameObject.Find("FollowCamera");
	var sf : SmoothFollow = cam.GetComponent(SmoothFollow);

	stopped = true;
	instanceBullet = Instantiate(projectile.gameObject, transform.position, Quaternion.identity);
	instanceBullet.rigidbody.mass = gravityEffect;
	instanceBullet.rigidbody.AddForce(transform.forward * (-shootForce));
				
	followCamera.enabled = true;
					
	sf.target = GameObject.Find("Bullet(Clone)").transform;
	sf.LateUpdate();
}	

function Stop() {

	if (!stopped) {
	
		if (moveUp) {
		
			transform.eulerAngles.x+=moveSpeed;
		}
		else {
		
			transform.eulerAngles.x-=moveSpeed;
		}
	}
}

function Awake () {

    DontDestroyOnLoad (this);
}