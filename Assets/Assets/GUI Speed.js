#pragma strict


function Start () {

}

function Update () {

	var bullet = GameObject.Find("Bullet(Clone)");

	var speed : float = bullet.rigidbody.velocity.magnitude;

	Debug.Log(speed);
	
	var speedText = speed.ToString();
	
	
	guiText.text = speedText;

}