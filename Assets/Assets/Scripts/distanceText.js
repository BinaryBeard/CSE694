#pragma strict

var distanceText = "0";

function Start () {
	guiText.text = distanceText + "m";
}

function Update () {
	
	
	if (GameObject.Find("Bullet(Clone)")) {
	
		var bullet = GameObject.Find("Bullet(Clone)");
		var canon = GameObject.Find("Cannon");
		var canonLocation : int = canon.transform.position.x;
		var speed : float = bullet.rigidbody.velocity.magnitude;
		var bulletLocation : int = bullet.transform.position.x;
		var distance : int = bulletLocation - canonLocation;
	
		if (distance > 0) {
		
			distanceText = distance.ToString();
		}

		guiText.text = distanceText + "m";
	}
}