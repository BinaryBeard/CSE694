#pragma strict

var distanceText = "0";

function Start () {
	guiText.text = distanceText;
}

function Update () {
	
	var bullet = GameObject.Find("Bullet(Clone)");
	var canon = GameObject.Find("Canon");
	var canonLocation : int = canon.transform.position.x;
	var speed : float = bullet.rigidbody.velocity.magnitude;
	var bulletLocation : int = bullet.transform.position.x;

	
	var distance : int = bulletLocation - canonLocation;


	Debug.Log(speed);
	
	if (distance > 0) {
		distanceText = distance.ToString();
	}

	
	guiText.text = distanceText;
}