#pragma strict

var stopSpeed : float = 0.5;

function Start () {

}

function Update () {

	if (rigidbody.velocity.x < stopSpeed) {
		rigidbody.velocity.x = 0;
	}

}