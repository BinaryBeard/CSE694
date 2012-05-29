#pragma strict

function Start () {

}

function Update () {

	var cannons = GameObject.FindGameObjectsWithTag("Cannon");
	

	if (cannons.Length > 1) {
	
		Debug.Log("Multiple Cannons - Destroy One");
		Destroy (cannons[0]);

	}
}