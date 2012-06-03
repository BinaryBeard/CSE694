#pragma strict

function Start () {

}

function Update () {

	if (GameObject.Find("Cannon")) {
	
		Destroy(GameObject.Find("Cannon"));
	}

	this.guiTexture.pixelInset.xMin = 0;
	this.guiTexture.pixelInset.yMin = 0;
	
	this.guiTexture.pixelInset.width = Screen.width;
	this.guiTexture.pixelInset.height = .75*(Screen.width);

}