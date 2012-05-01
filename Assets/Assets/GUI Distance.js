#pragma strict

var speedText = "0";

function Start () {
	guiText.material.color = Color.blue;
	
}

function Update () {

	guiText.material.color = Color.blue;

	
	var bullet = GameObject.Find("Bullet(Clone)");
	var canon = GameObject.Find("Canon");
	var canonLocation : int = canon.transform.position.x;
	var speed : float = bullet.rigidbody.velocity.magnitude;
	var bulletLocation : int = bullet.transform.position.x;

	
	var distance : int = bulletLocation - canonLocation;


	Debug.Log(speed);
	
	if (distance > 0) {
		speedText = distance.ToString();
	}

	
	guiText.text = speedText;

}